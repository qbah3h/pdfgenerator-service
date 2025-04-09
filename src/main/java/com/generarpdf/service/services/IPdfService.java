package com.generarpdf.service.services;

import com.generarpdf.service.dtos.CurriculumDto;
import org.springframework.web.multipart.MultipartFile;

public interface IPdfService {
    byte[] generatePDF(CurriculumDto curriculum, MultipartFile image) throws Exception;
}
