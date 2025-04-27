package com.generarpdf.service.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.generarpdf.service.dtos.CurriculumDto;
import com.generarpdf.service.services.IPdfService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/cv")
public class PdfController {
    private static final Logger logger = LoggerFactory.getLogger(PdfController.class);

    @Autowired
    private IPdfService pdfService;

    @PostMapping(path = "/generate", produces = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<byte[]> generate(@RequestPart String curriculumJson,
                                           @RequestPart(value = "image", required = false) MultipartFile image) {
        try {
            logger.info("/generate endpoint -------------------------");
            logger.info("curriculumJson variable value: {}", curriculumJson);

            curriculumJson = escapeHtmlInJson(curriculumJson);

            // Deserialize the curriculum JSON manually
            ObjectMapper objectMapper = new ObjectMapper();
            CurriculumDto curriculum = objectMapper.readValue(curriculumJson, CurriculumDto.class);

            byte[] pdfBytes = pdfService.generatePDF(curriculum, image);

            String filename = "CV - Nombre - Tema.pdf";

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + filename)
                    .contentType(MediaType.APPLICATION_PDF)
                    .body(pdfBytes);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(null);
        }
    }

    /**
     * Escapes HTML entities in JSON string values while preserving the JSON structure
     * 
     * @param json The JSON string to process
     * @return The processed JSON string with HTML entities escaped
     */
    private String escapeHtmlInJson(String json) {
        if (json == null || json.isEmpty()) {
            return json;
        }
        
        // Pattern to find JSON string values (text between quotes not preceded by backslash)
        java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("(\"(?:[^\"\\\\]|\\\\.)*\")");
        java.util.regex.Matcher matcher = pattern.matcher(json);
        
        StringBuffer result = new StringBuffer();
        
        while (matcher.find()) {
            String match = matcher.group(1);
            String value = match.substring(1, match.length() - 1); // Remove surrounding quotes
            
            // Apply HTML escaping to the string value
            value = value.replace("&", "&amp;")
                         .replace("<", "&lt;")
                         .replace(">", "&gt;")
                         .replace("\"", "&quot;")
                         .replace("'", "&#39;");
            
            // Fix double-escaped entities
            value = value.replace("&amp;amp;", "&amp;")
                         .replace("&amp;lt;", "&lt;")
                         .replace("&amp;gt;", "&gt;")
                         .replace("&amp;quot;", "&quot;")
                         .replace("&amp;#39;", "&#39;");
            
            // Need to escape $ and \ in the replacement string
            value = java.util.regex.Matcher.quoteReplacement("\"" + value + "\"");
            
            matcher.appendReplacement(result, value);
        }
        
        matcher.appendTail(result);
        return result.toString();
    }
}
