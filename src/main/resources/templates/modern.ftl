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

        .resume-container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 30%;
            background-color: #3c3c3c;
            color: #fff;
            padding: 30px;
            box-sizing: border-box;
        }

        .main-content {
            width: 70%;
            padding: 30px;
            box-sizing: border-box;
        }

        .profile-section {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 15px;
            border: 3px solid #fff;
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

        .experience-item, .education-item {
            margin-bottom: 20px;
            position: relative;
        }

        .timeline-dot {
            display: inline-block;
            width: 12px;
            height: 12px;
            background-color: #3c3c3c;
            border-radius: 50%;
            margin-right: 10px;
        }

        .job-title, .degree {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .company, .institution {
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
    <div class="resume-container">
        <div class="sidebar">
            <div class="profile-section">
                <#if imageData??>
                    <img class="profile-image" src="${imageData}" alt="Profile Image" />
                </#if>
                <div class="full-name">${fullName}</div>
            </div>

            <div class="contact-info">
                <h3 class="section-title">CONTACTO</h3>
                <div class="contact-item">
                    <div class="contact-label">Teléfono:</div>
                    <div>${phone}</div>
                </div>
                <div class="contact-item">
                    <div class="contact-label">Email:</div>
                    <div>${email}</div>
                </div>
                <div class="contact-item">
                    <div class="contact-label">Domicilio:</div>
                    <div>${address}</div>
                </div>
            </div>

            <#if references?has_content && references?filter(r -> r.name?has_content)?size gt 0>
                <div class="references-section">
                    <h3 class="section-title">REFERENCIAS</h3>
                    <#list references?filter(r -> r.name?has_content) as ref>
                        <div class="reference">
                            <div class="reference-name">${ref.name}</div>
                            <div class="reference-contact">
                                ${ref.email} | ${ref.phone}
                            </div>
                        </div>
                    </#list>
                </div>
            </#if>

            <#if skills?has_content>
                <div class="skills-section">
                    <h3 class="section-title">HABILIDADES</h3>
                    <#list skills as skill>
                        <div class="skill-item">
                            <div class="skill-title">${skill.title}</div>
                            <div>${skill.description}</div>
                        </div>
                    </#list>
                </div>
            </#if>
        </div>

        <div class="main-content">
            <div class="section">
                <div class="personal-description">
                    <h3 class="section-title">Descripción personal</h3>
                    <p>${summary}</p>
                </div>
            </div>

            <#if education?has_content>
                <div class="section">
                    <h3 class="section-title">EDUCACIÓN</h3>
                    <#list education as edu>
                        <div class="education-item">
                            <span class="timeline-dot"></span>
                            <div class="degree">${edu.degree}</div>
                            <div class="institution">${edu.institution}</div>
                            <div class="date-range">${edu.startDate} - ${edu.endDate}</div>
                            <p>${edu.details}</p>
                        </div>
                    </#list>
                </div>
            </#if>

            <#if experiences?has_content>
                <div class="section">
                    <h3 class="section-title">EXPERIENCIA</h3>
                    <#list experiences as exp>
                        <div class="experience-item">
                            <span class="timeline-dot"></span>
                            <div class="job-title">${exp.jobTitle}</div>
                            <div class="company">${exp.company}</div>
                            <div class="date-range">${exp.startDate} - ${exp.endDate}</div>
                            <p>${exp.description}</p>
                        </div>
                    </#list>
                </div>
            </#if>

            <#if certifications?has_content>
                <div class="section">
                    <h3 class="section-title">CERTIFICACIONES</h3>
                    <#list certifications as cert>
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

            <#if projects?has_content && projects?filter(p -> p.title?has_content || p.description?has_content)?size gt 0>
                <div class="section">
                    <h3 class="section-title">PROYECTOS</h3>
                    <#list projects?filter(p -> p.title?has_content || p.description?has_content) as project>
                        <div class="experience-item">
                            <span class="timeline-dot"></span>
                            <div class="job-title">${project.title}</div>
                            <p>${project.description}</p>
                        </div>
                    </#list>
                </div>
            </#if>
        </div>
    </div>
</body>

</html>
