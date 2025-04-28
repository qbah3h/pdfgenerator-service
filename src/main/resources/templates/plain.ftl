<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }

        h1,
        h2 {
            color: #2c3e50;
        }

        .section {
            margin-bottom: 25px;
            page-break-inside: avoid;
            /* Prevents section from being split across pages */
            break-inside: avoid;
            /* Modern browsers */
        }

        .header {
            border-bottom: 2px solid #2c3e50;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 20px;
        }

        .header-content {
            flex: 1;
        }

        .contact {
            font-size: 14px;
            color: #555;
        }

        .job-title {
            font-weight: bold;
            color: #333;
        }

        .company {
            font-style: italic;
            color: #777;
        }

        .date-range {
            float: right;
            color: #999;
        }

        ul {
            padding-left: 20px;
        }

        .certification {
            margin-bottom: 10px;
        }

        .reference {
            margin-bottom: 15px;
        }
    </style>
</head>

<body>
    <div class="header">
        <!--<#if imageData??>
            <img class="profile-image" src="${imageData}" alt="Profile Image" />
        </#if>-->
        <div class="header-content">
            <h1>${fullName}</h1>
            <div class="contact">
                ${email} | ${phone} | ${address}
            </div>
        </div>
    </div>

    <div class="section">
        <h2>Professional Summary</h2>
        <p>${summary}</p>
    </div>

    <#if experiences?has_content>
        <div class="section">
            <h2>Work Experience</h2>
            <#list experiences as exp>
                <div>
                    <div class="date-range">${exp.startDate} - ${exp.endDate}</div>
                    <div class="job-title">${exp.jobTitle}</div>
                    <div class="company">${exp.company}</div>
                    <p>${exp.description}</p>
                </div>
            </#list>
        </div>
    </#if>

    <#if education?has_content>
        <div class="section">
            <h2>Education</h2>
            <#list education as edu>
                <div>
                    <div class="date-range">${edu.startDate} - ${edu.endDate}</div>
                    <div class="job-title">${edu.degree}</div>
                    <div class="company">${edu.institution}</div>
                    <p>${edu.details}</p>
                </div>
            </#list>
        </div>
    </#if>

    <#if certifications?has_content>
        <div class="section">
            <h2>Certifications</h2>
            <#list certifications as cert>
                <div class="certification">
                    <div class="date-range">${cert.date}</div>
                    <div class="job-title">
                        <#if cert.link?? && cert.link !="">
                            <a href="${cert.link}" target="_blank">${cert.name}</a>
                            <#else>
                                ${cert.name}
                        </#if>
                    </div>
                </div>
            </#list>
        </div>
    </#if>

    <#if projects?has_content && projects?filter(p -> p.title?has_content || p.description?has_content)?size gt 0>
        <div class="section">
            <h2>Projects</h2>
            <#list projects?filter(p -> p.title?has_content || p.description?has_content) as project>
                <div>
                    <div class="job-title">${project.title}</div>
                    <p>${project.description}</p>
                </div>
            </#list>
        </div>
    </#if>

    <#if skills?has_content>
        <div class="section">
            <h2>Skills</h2>
            <ul>
                <#list skills as skill>
                    <li>${skill.title}: ${skill.description}</li>
                </#list>
            </ul>
        </div>
    </#if>

    <#if references?has_content && references?filter(r -> r.name?has_content)?size gt 0>
        <div class="section">
            <h2>References</h2>
            <#list references?filter(r -> r.name?has_content) as ref>
                <div class="reference">
                    <div class="job-title">${ref.name}</div>
                    <div class="contact">
                        ${ref.email} | ${ref.phone}
                    </div>
                </div>
            </#list>
        </div>
    </#if>

</body>

</html>