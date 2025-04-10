package com.generarpdf.service.services;

import com.generarpdf.service.dtos.CurriculumDto;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.util.Base64;

@Service
public class PdfService implements IPdfService {

    @Autowired
    private Configuration freemarkerConfig;

    public byte[] generatePDF(CurriculumDto curriculum, MultipartFile image) throws Exception {
        String templateName = "basic.ftl";

        // If there is an image, convert it to a byte array
        if (image != null && !image.isEmpty()) {
            byte[] imageBytes = image.getBytes();
            String contentType = image.getContentType();
            if (contentType == null) {
                contentType = "image/jpeg"; // Default to JPEG if content type is not available
            }
            curriculum.setImageData("data:" + contentType + ";base64," + Base64.getEncoder().encodeToString(imageBytes));
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
}
