package com.generarpdf.service.dtos;

import lombok.Data;

import java.util.List;

@Data
public class CurriculumDto {
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String summary;
    private List<SkillsDto> skills;
    private List<ExperienceDto> experiences;
    private List<EducationDto> education;
    private List<CertificationsDto> certifications;
    private List<ReferencesDto> references;
    private List<ProjectDto> projects;
    private String imageData;
}
