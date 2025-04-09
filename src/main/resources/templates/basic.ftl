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
        }

        .header {
            border-bottom: 2px solid #2c3e50;
            margin-bottom: 20px;
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
    </style>
</head>

<body>
    <#if imageData??>
        <img src="${imageData}" alt="Profile Image" />
    </#if>
    <div class="header">
        <h1>${fullName}</h1>
        <div class="contact">
            ${email} | ${phone} | ${address}
        </div>
    </div>

    <div class="section">
        <h2>Professional Summary</h2>
        <p>${summary}</p>
    </div>

    <#if skills?has_content>
        <div class="section">
            <h2>Skills</h2>
            <ul>
                <#list skills as skill>
                    <li>${skill}</li>
                </#list>
            </ul>
        </div>
    </#if>

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

    <#if projects?has_content>
        <div class="section">
            <h2>Projects</h2>
            <#list projects as project>
                <div>
                    <div class="job-title">${project.title}</div>
                    <p>${project.description}</p>
                </div>
            </#list>
        </div>
    </#if>

</body>

</html>