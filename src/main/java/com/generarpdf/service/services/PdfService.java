package com.generarpdf.service.services;

import com.generarpdf.service.dtos.CurriculumDto;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.util.Base64;

@Service
public class PdfService implements IPdfService {

    private static final Logger logger = LoggerFactory.getLogger(PdfService.class);

    @Autowired
    private Configuration freemarkerConfig;

    private int findImageStart(byte[] data) {
        // Common image format signatures
        byte[][] signatures = {
            {(byte) 0xFF, (byte) 0xD8}, // JPEG
            {(byte) 0x89, (byte) 0x50, (byte) 0x4E, (byte) 0x47}, // PNG
            {(byte) 0x47, (byte) 0x49, (byte) 0x46, (byte) 0x38}, // GIF
        };

        // Search for known image format signatures
        for (int i = 0; i < data.length - 4; i++) {
            for (byte[] signature : signatures) {
                boolean found = true;
                for (int j = 0; j < signature.length && (i + j) < data.length; j++) {
                    if (data[i + j] != signature[j]) {
                        found = false;
                        break;
                    }
                }
                if (found) {
                    logger.info("Found image signature at index: {}", i);
                    return i;
                }
            }
        }
        return 0; // Return 0 if no signature is found
    }

    public byte[] generatePDF(CurriculumDto curriculum, MultipartFile image) throws Exception {
        String templateName = "basic.ftl";
        logger.info("generatePDF method ------------------");

        // Escape HTML entities in text fields to prevent XML parsing errors
        escapeHtmlEntities(curriculum);

        // If there is an image, convert it to a byte array
        if (image != null && !image.isEmpty()) {
            logger.info("Processing image: name={}, originalFilename={}, contentType={}, size={}", 
                image.getName(), image.getOriginalFilename(), image.getContentType(), image.getSize());
            
            try {
                // Get the input stream directly from the multipart file
                try (java.io.InputStream inputStream = image.getInputStream()) {
                    // Read the actual image bytes, skipping any headers
                    byte[] imageBytes = inputStream.readAllBytes();
                    
                    String contentType = image.getContentType();
                    if (contentType == null) {
                        contentType = "image/jpeg"; // Default to JPEG if content type is not available
                        logger.warn("No content type detected, defaulting to: {}", contentType);
                    } else {
                        logger.info("Using detected content type: {}", contentType);
                    }

                    // Clean the image bytes by finding the actual image data start
                    int startIdx = findImageStart(imageBytes);
                    if (startIdx > 0) {
                        imageBytes = java.util.Arrays.copyOfRange(imageBytes, startIdx, imageBytes.length);
                        logger.info("Cleaned image data, new size: {} bytes", imageBytes.length);
                    }
                    
                    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                    logger.debug("Base64 image length: {}", base64Image.length());
                    
                    String dataUrl = "data:" + contentType + ";base64," + base64Image;
                    curriculum.setImageData(dataUrl);
                    logger.info("Successfully processed image and set data URL");
                }
            } catch (Exception e) {
                logger.error("Error processing image: {}", e.getMessage(), e);
                throw e;
            }
        } else {
            logger.info("No image provided or empty image");
        }

        Template template = freemarkerConfig.getTemplate(templateName);
        String htmlContent = FreeMarkerTemplateUtils.processTemplateIntoString(template, curriculum);

        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            PdfRendererBuilder builder = new PdfRendererBuilder();
            builder.useFastMode(); // Optional, for faster rendering
            builder.withHtmlContent(htmlContent, new ClassPathResource("/templates/").getURL().toString());
            builder.toStream(outputStream);
            builder.run();

            return outputStream.toByteArray();
        }
    }

    /**
     * Escapes HTML entities in the curriculum data to prevent XML parsing errors
     * @param curriculum The curriculum data to escape
     */
    private void escapeHtmlEntities(CurriculumDto curriculum) {
        // Escape summary
        if (curriculum.getSummary() != null) {
            curriculum.setSummary(escapeHtml(curriculum.getSummary()));
        }
        
        // Escape experience descriptions
        if (curriculum.getExperiences() != null) {
            curriculum.getExperiences().forEach(exp -> {
                if (exp.getDescription() != null) {
                    exp.setDescription(escapeHtml(exp.getDescription()));
                }
            });
        }
        
        // Escape education details
        if (curriculum.getEducation() != null) {
            curriculum.getEducation().forEach(edu -> {
                if (edu.getDetails() != null) {
                    edu.setDetails(escapeHtml(edu.getDetails()));
                }
            });
        }
        
        // Escape project descriptions
        if (curriculum.getProjects() != null) {
            curriculum.getProjects().forEach(project -> {
                if (project.getDescription() != null) {
                    project.setDescription(escapeHtml(project.getDescription()));
                }
            });
        }
    }
    
    /**
     * Escapes HTML special characters in a string
     * @param input The string to escape
     * @return The escaped string
     */
    private String escapeHtml(String input) {
        if (input == null) return null;
        // First, escape ampersands to prevent issues with existing entities
        String result = input.replace("&", "&amp;");
        
        // Then escape other special characters
        result = result.replace("<", "&lt;")
                      .replace(">", "&gt;")
                      .replace("\"", "&quot;")
                      .replace("'", "&#39;");
        
        // Additional check for any remaining unescaped ampersands followed by characters
        // This handles cases where an ampersand might be part of a string like "A&A" or "Q&A"
        result = result.replaceAll("&(?!(amp;|lt;|gt;|quot;|#39;))", "&amp;");
        
        return result;
    }
}
