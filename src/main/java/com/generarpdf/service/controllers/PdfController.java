package com.generarpdf.service.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.generarpdf.service.dtos.CurriculumDto;
import com.generarpdf.service.services.IPdfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/cv")
public class PdfController {

    @Autowired
    private IPdfService pdfService;

    @PostMapping(path = "/generate", produces = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<byte[]> generate(@RequestPart String curriculumJson,
                                           @RequestPart(value = "image", required = false) MultipartFile image) {
        try {
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
}
