package com.generarpdf.service.services;

import com.generarpdf.service.dtos.CurriculumDto;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import java.io.ByteArrayOutputStream;

@Service
public class PdfService implements IPdfService {

    @Autowired
    private Configuration freemarkerConfig;

    public byte[] generatePDF(CurriculumDto curriculum) throws Exception {
        String templateName = "basic.ftl";

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
