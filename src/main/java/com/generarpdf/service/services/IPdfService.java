package com.generarpdf.service.services;

import com.generarpdf.service.dtos.CurriculumDto;

public interface IPdfService {
    byte[] generatePDF(CurriculumDto curriculum) throws Exception;
}
