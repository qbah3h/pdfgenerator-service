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
    private String language;
    private String style;
    private List<SkillsDto> skills;
    private List<ExperienceDto> experiences;
    private List<EducationDto> education;
    private List<CertificationsDto> certifications;
    private List<ReferencesDto> references;
    private List<ProjectDto> projects;
    private String imageData;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public List<SkillsDto> getSkills() {
        return skills;
    }

    public void setSkills(List<SkillsDto> skills) {
        this.skills = skills;
    }

    public List<ExperienceDto> getExperiences() {
        return experiences;
    }

    public void setExperiences(List<ExperienceDto> experiences) {
        this.experiences = experiences;
    }

    public List<EducationDto> getEducation() {
        return education;
    }

    public void setEducation(List<EducationDto> education) {
        this.education = education;
    }

    public List<CertificationsDto> getCertifications() {
        return certifications;
    }

    public void setCertifications(List<CertificationsDto> certifications) {
        this.certifications = certifications;
    }

    public List<ReferencesDto> getReferences() {
        return references;
    }

    public void setReferences(List<ReferencesDto> references) {
        this.references = references;
    }

    public List<ProjectDto> getProjects() {
        return projects;
    }

    public void setProjects(List<ProjectDto> projects) {
        this.projects = projects;
    }

    public String getImageData() {
        return imageData;
    }

    public void setImageData(String imageData) {
        this.imageData = imageData;
    }
}
