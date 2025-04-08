package com.generarpdf.service.dtos;

import lombok.Data;

@Data
public class EducationDto {
    private String degree;
    private String institution;
    private String startDate;
    private String endDate;
    private String details;
}
