package com.generarpdf.service.controllers;

import com.generarpdf.service.dtos.CurriculumDto;
import com.generarpdf.service.services.IPdfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/cv")
public class PdfController {

    @Autowired
    private IPdfService pdfService;

    @PostMapping(path = "/generate", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<byte[]> generate(@RequestBody CurriculumDto curriculum) {
        try {
            byte[] pdfBytes = pdfService.generatePDF(curriculum);

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
