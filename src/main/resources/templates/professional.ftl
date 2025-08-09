<!DOCTYPE html>
<html>
<head>
    <style>
        /* Global Styles */
        body {
            font-family: 'Calibri', 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #fff;
            line-height: 1.5;
        }

        /* Container */
        .resume-container {
            max-width: 100%;
            margin: 0;
            padding: 0;
        }

        /* Header Section */
        .header {
            background-color: #1f497d;
            color: white;
            padding: 25px 40px;
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-left {
            flex: 2;
        }

        .header-right {
            flex: 1;
            text-align: right;
        }

        .full-name {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 5px;
            letter-spacing: 0.5px;
        }

        .title {
            font-size: 18px;
            margin-bottom: 10px;
            font-weight: normal;
            color: #e0e0e0;
        }

        .contact-info {
            font-size: 14px;
            line-height: 1.6;
        }

        .contact-item {
            margin-bottom: 4px;
        }

        /* Profile Image */
        .profile-image-container {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            overflow: hidden;
            border: 3px solid white;
            margin-left: 20px;
            background-color: #f5f5f5;
        }

        .profile-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Main Content */
        .main-content {
            padding: 30px 40px;
        }

        /* Section Styling */
        .section {
            margin-bottom: 25px;
            page-break-inside: avoid;
            break-inside: avoid;
        }

        .section-title {
            font-size: 18px;
            font-weight: bold;
            color: #1f497d;
            border-bottom: 2px solid #1f497d;
            padding-bottom: 5px;
            margin-bottom: 15px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Summary */
        .summary {
            margin-bottom: 30px;
            text-align: justify;
        }

        /* Experience and Education Items */
        .item {
            margin-bottom: 20px;
            position: relative;
            page-break-inside: avoid;
            break-inside: avoid;
        }

        .item-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 5px;
        }

        .item-title {
            font-weight: bold;
            font-size: 16px;
            color: #333;
            margin-bottom: 3px;
        }

        .item-subtitle {
            font-style: italic;
            color: #555;
            margin-bottom: 5px;
        }

        .date-range {
            color: #777;
            font-size: 14px;
            white-space: nowrap;
        }

        .item-content {
            margin-top: 5px;
            text-align: justify;
        }

        /* Skills Section */
        .skills-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .skill-item {
            flex: 1 0 45%;
            margin-bottom: 15px;
            min-width: 200px;
        }

        .skill-title {
            font-weight: bold;
            margin-bottom: 3px;
        }

        /* Certifications */
        .certification {
            margin-bottom: 12px;
        }

        .certification-name {
            font-weight: bold;
        }

        .certification-date {
            color: #777;
            font-size: 14px;
        }

        /* Projects */
        .project {
            margin-bottom: 20px;
        }

        .project-title {
            font-weight: bold;
            margin-bottom: 5px;
        }

        /* References */
        .references-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .reference {
            flex: 1 0 45%;
            margin-bottom: 15px;
            min-width: 200px;
        }

        .reference-name {
            font-weight: bold;
            margin-bottom: 3px;
        }

        .reference-contact {
            font-size: 14px;
            color: #555;
        }

        /* Responsive adjustments for print */
        @media print {
            body {
                font-size: 12pt;
            }
            
            .header {
                padding: 20px 30px;
            }
            
            .main-content {
                padding: 20px 30px;
            }
        }
    </style>
</head>

<body>
    <div class="resume-container">
        <!-- Header Section -->
        <div class="header">
            <div class="header-left">
                <div class="full-name">${fullName}</div>
                <#if  jobTitle??>
                    <div class="title">${jobTitle}</div>
                </#if>
                <div class="contact-info">
                    <div class="contact-item">${email}</div>
                    <div class="contact-item">${phone}</div>
                    <div class="contact-item">${address}</div>
                </div>
            </div>
            <div class="header-right">
                <#if  imageData??>
                    <div class="profile-image-container">
                        <img class="profile-image" src="${imageData}" alt="Profile Image" />
                    </div>
                </#if>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Summary Section -->
            <div class="section summary">
                <h2 class="section-title"><#if  language == 'en'>Professional Summary<#else>Resumen Profesional</#if></h2>
                <p>${summary}</p>
            </div>

            <!-- Experience Section -->
            <#if  experiences?has_content>
                <div class="section">
                    <h2 class="section-title"><#if  language == 'en'>Professional Experience<#else>Experiencia Profesional</#if></h2>
                    
                    <#list  experiences as exp>
                        <div class="item">
                            <div class="item-header">
                                <div>
                                    <div class="item-title">${exp.jobTitle}</div>
                                    <div class="item-subtitle">${exp.company}</div>
                                </div>
                                <div class="date-range">${exp.startDate} - ${exp.endDate}</div>
                            </div>
                            <div class="item-content">
                                <p>${exp.description}</p>
                            </div>
                        </div>
                    </#list>
                </div>
            </#if>

            <!-- Education Section -->
            <#if  education?has_content>
                <div class="section">
                    <h2 class="section-title"><#if  language == 'en'>Education<#else>Educación</#if></h2>
                    
                    <#list  education as edu>
                        <div class="item">
                            <div class="item-header">
                                <div>
                                    <div class="item-title">${edu.degree}</div>
                                    <div class="item-subtitle">${edu.institution}</div>
                                </div>
                                <div class="date-range">${edu.startDate} - ${edu.endDate}</div>
                            </div>
                            <div class="item-content">
                                <p>${edu.details}</p>
                            </div>
                        </div>
                    </#list>
                </div>
            </#if>

            <!-- Skills Section -->
            <#if  skills?has_content &&  skills?filter(s -> s.title?has_content || s.description?has_content)?size gt 0>
                <div class="section">
                    <h2 class="section-title"><#if  language == 'en'>Skills<#else>Habilidades</#if></h2>
                    <div class="skills-container">
                        <#list  skills?filter(s -> s.title?has_content || s.description?has_content) as skill>
                            <div class="skill-item">
                                <div class="skill-title">${skill.title}</div>
                                <div>${skill.description}</div>
                            </div>
                        </#list>
                    </div>
                </div>
            </#if>

            <!-- Certifications Section -->
            <#if  certifications?has_content &&  certifications?filter(c -> c.name?has_content)?size gt 0>
                <div class="section">
                    <h2 class="section-title"><#if  language == 'en'>Certifications<#else>Certificaciones</#if></h2>
                    <#list  certifications?filter(c -> c.name?has_content) as cert>
                        <div class="certification">
                            <div class="certification-name">
                                <#if cert.link?? && cert.link !="">
                                    <a href="${cert.link}" target="_blank">${cert.name}</a>
                                <#else>
                                    ${cert.name}
                                </#if>
                            </div>
                            <div class="certification-date">${cert.date}</div>
                        </div>
                    </#list>
                </div>
            </#if>

            <!-- Projects Section -->
            <#if  projects?has_content &&  projects?filter(p -> p.title?has_content || p.description?has_content)?size gt 0>
                <div class="section">
                    <h2 class="section-title"><#if  language == 'en'>Notable Projects<#else>Proyectos Destacados</#if></h2>
                    <#list  projects?filter(p -> p.title?has_content || p.description?has_content) as project>
                        <div class="project">
                            <div class="project-title">${project.title}</div>
                            <p>${project.description}</p>
                        </div>
                    </#list>
                </div>
            </#if>

            <!-- References Section -->
            <#if  references?has_content &&  references?filter(r -> r.name?has_content)?size gt 0>
                <div class="section">
                    <h2 class="section-title"><#if  language == 'en'>References<#else>Referencias</#if></h2>
                    <div class="references-container">
                        <#list  references?filter(r -> r.name?has_content) as ref>
                            <div class="reference">
                                <div class="reference-name">${ref.name}</div>
                                <div class="reference-contact">
                                    <#if ref.position?? && ref.position != "">${ref.position}<br></#if>
                                    ${ref.email} <#if ref.phone?? && ref.phone != "">| ${ref.phone}</#if>
                                </div>
                            </div>
                        </#list>
                    </div>
                </div>
            </#if>
        </div>
    </div>
</body>
</html>