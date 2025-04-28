<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #fff;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            table-layout: fixed;
        }

        td {
            vertical-align: top;
            padding: 0;
        }

        .resume-container {
            width: 100%;
        }

        .sidebar {
            width: 30%;
            background-color: #3c3c3c;
            color: #fff;
            padding: 10px;
            box-sizing: border-box;
        }

        .main-content {
            width: 70%;
            padding: 10px;
            box-sizing: border-box;
        }

        .profile-section {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-image-container {
            width: 120px;
            height: 120px;
            margin: 0 auto 15px;
            border: 1px solid #fff;
            background-color: #3c3c3c;
            overflow: hidden;
            position: relative;
        }

        .profile-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: center;
            display: block;
        }

        .full-name {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 5px;
            text-transform: uppercase;
        }

        .contact-info {
            margin-bottom: 30px;
        }

        .contact-item {
            margin-bottom: 10px;
        }

        .contact-label {
            font-weight: bold;
            margin-bottom: 3px;
        }

        .section-title {
            position: relative;
            margin-bottom: 20px;
            padding-bottom: 10px;
            font-size: 18px;
            text-transform: uppercase;
            font-weight: bold;
        }

        .sidebar .section-title {
            color: #fff;
            border-bottom: 2px solid #fff;
        }

        .main-content .section-title {
            color: #333;
            border-bottom: 2px solid #3c3c3c;
        }

        .section-title::before {
            content: "";
            position: absolute;
            left: 0;
            bottom: -2px;
            width: 50px;
            height: 2px;
        }

        .sidebar .section-title::before {
            background-color: #fff;
        }

        .main-content .section-title::before {
            background-color: #3c3c3c;
        }

        .section {
            margin-bottom: 25px;
            page-break-inside: avoid;
            break-inside: avoid;
        }

        .experience-item,
        .education-item {
            margin-bottom: 20px;
            position: relative;
            page-break-inside: avoid;
            break-inside: avoid;
        }

        .timeline-dot {
            display: inline-block;
            width: 12px;
            height: 12px;
            background-color: #3c3c3c;
            border-radius: 50%;
            margin-right: 10px;
        }

        .job-title,
        .degree {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .company,
        .institution {
            font-style: italic;
            margin-bottom: 5px;
        }

        .date-range {
            color: #777;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .skill-item {
            margin-bottom: 15px;
            page-break-inside: avoid;
            break-inside: avoid;
        }

        .skill-title {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .personal-description {
            margin-bottom: 20px;
            font-style: italic;
            line-height: 1.5;
        }

        .references-section .reference {
            margin-bottom: 15px;
            page-break-inside: avoid;
            break-inside: avoid;
        }

        .reference-name {
            font-weight: bold;
            margin-bottom: 3px;
        }

        .reference-contact {
            font-size: 14px;
        }

        ul {
            padding-left: 20px;
            margin: 0;
        }

        li {
            margin-bottom: 5px;
        }

        .certification {
            margin-bottom: 15px;
            page-break-inside: avoid;
            break-inside: avoid;
        }

        .certification-name {
            font-weight: bold;
        }

        .certification-date {
            color: #777;
            font-size: 14px;
        }
    </style>
</head>

<body>
    <table class="resume-container" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td class="sidebar" width="30%">
                <div class="profile-section">
                    <#if imageData??>
                        <div class="profile-image-container">
                            <img class="profile-image" src="${imageData}" alt="Profile Image" />
                        </div>
                    </#if>
                    <div class="full-name">${fullName}</div>
                </div>

                <div class="contact-info">
                    <h3 class="section-title"><#if language == 'en'>CONTACT<#else>CONTACTO</#if></h3>
                    <div class="contact-item">
                        <div class="contact-label"><#if language == 'en'>Phone:<#else>Teléfono:</#if></div>
                        <div>${phone}</div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-label">Email:</div>
                        <div>${email}</div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-label"><#if language == 'en'>Address:<#else>Domicilio:</#if></div>
                        <div>${address}</div>
                    </div>
                </div>

                <#if skills?has_content>
                    <div class="skills-section">
                        <h3 class="section-title"><#if language == 'en'>SKILLS<#else>HABILIDADES</#if></h3>
                        <#list skills as skill>
                            <table class="skill-item" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td>
                                        <div class="skill-title">${skill.title}</div>
                                        <div>${skill.description}</div>
                                    </td>
                                </tr>
                            </table>
                        </#list>
                    </div>
                </#if>

                <#if references?has_content && references?filter(r -> r.name?has_content)?size gt 0>
                    <div class="references-section">
                        <h3 class="section-title"><#if language == 'en'>REFERENCES<#else>REFERENCIAS</#if></h3>
                        <#list references?filter(r -> r.name?has_content) as ref>
                            <table class="reference" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td>
                                        <div class="reference-name">${ref.name}</div>
                                        <div class="reference-contact">
                                            ${ref.email} ${ref.phone}
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </#list>
                    </div>
                </#if>

            </td>

            <td class="main-content" width="70%">
                <div class="section">
                    <div class="personal-description">
                        <h3 class="section-title"><#if language == 'en'>Personal Description<#else>Descripción personal</#if></h3>
                        <p>${summary}</p>
                    </div>
                </div>

                <#if experiences?has_content>
                    <div class="section">
                        <h3 class="section-title"><#if language == 'en'>EXPERIENCE<#else>EXPERIENCIA</#if></h3>
                        <#list experiences as exp>
                            <table class="experience-item" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="width: 12px; vertical-align: top; padding-right: 10px;">
                                        <span class="timeline-dot"
                                            style="display: inline-block; width: 12px; height: 12px; background-color: #3c3c3c; border-radius: 50%;"></span>
                                    </td>
                                    <td>
                                        <div class="job-title">${exp.jobTitle}</div>
                                        <div class="company">${exp.company}</div>
                                        <div class="date-range">${exp.startDate} - ${exp.endDate}</div>
                                        <p>${exp.description}</p>
                                    </td>
                                </tr>
                            </table>
                        </#list>
                    </div>
                </#if>

                <#if education?has_content>
                    <div class="section">
                        <h3 class="section-title"><#if language == 'en'>EDUCATION<#else>EDUCACIÓN</#if></h3>
                        <#list education as edu>
                            <table class="education-item" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="width: 12px; vertical-align: top; padding-right: 10px;">
                                        <span class="timeline-dot"
                                            style="display: inline-block; width: 12px; height: 12px; background-color: #3c3c3c; border-radius: 50%;"></span>
                                    </td>
                                    <td>
                                        <div class="degree">${edu.degree}</div>
                                        <div class="institution">${edu.institution}</div>
                                        <div class="date-range">${edu.startDate} - ${edu.endDate}</div>
                                        <p>${edu.details}</p>
                                    </td>
                                </tr>
                            </table>
                        </#list>
                    </div>
                </#if>

                <#if certifications?has_content>
                    <div class="section">
                        <h3 class="section-title"><#if language == 'en'>CERTIFICATIONS<#else>CERTIFICACIONES</#if></h3>
                        <#list certifications as cert>
                            <table class="certification" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td>
                                        <div class="certification-name">
                                            <#if cert.link?? && cert.link !="">
                                                <a href="${cert.link}" target="_blank">${cert.name}</a>
                                                <#else>
                                                    ${cert.name}
                                            </#if>
                                        </div>
                                        <div class="certification-date">${cert.date}</div>
                                    </td>
                                </tr>
                            </table>
                        </#list>
                    </div>
                </#if>

                <#if projects?has_content && projects?filter(p -> p.title?has_content || p.description?has_content)?size
                    gt 0>
                    <div class="section">
                        <h3 class="section-title"><#if language == 'en'>PROJECTS<#else>PROYECTOS</#if></h3>
                        <#list projects?filter(p -> p.title?has_content || p.description?has_content) as project>
                            <table class="experience-item" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="width: 12px; vertical-align: top; padding-right: 10px;">
                                        <span class="timeline-dot"
                                            style="display: inline-block; width: 12px; height: 12px; background-color: #3c3c3c; border-radius: 50%;"></span>
                                    </td>
                                    <td>
                                        <div class="job-title">${project.title}</div>
                                        <p>${project.description}</p>
                                    </td>
                                </tr>
                            </table>
                        </#list>
                    </div>
                </#if>
            </td>
        </tr>
    </table>
</body>

</html>