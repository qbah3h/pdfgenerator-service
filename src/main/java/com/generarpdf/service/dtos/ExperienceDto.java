package com.generarpdf.service.dtos;

import lombok.Data;

@Data
public class ExperienceDto {
    private String jobTitle;
    private String company;
    private String startDate;
    private String endDate;
    private String description;
}
