# PDF Generator Service

A Spring Boot microservice that generates professional PDF resumes from structured JSON data using FreeMarker templates.

## Overview

This service provides a REST API endpoint to generate customized PDF resumes with multiple template styles. It accepts curriculum data in JSON format along with an optional profile image and returns a professionally formatted PDF document.

## Tech Stack

- **Java 17**
- **Spring Boot 3.4.4**
- **FreeMarker** - Template engine for HTML generation
- **OpenHTMLToPDF 1.0.10** - HTML to PDF conversion
- **Lombok 1.18.38** - Boilerplate code reduction
- **Maven** - Build and dependency management

## Features

- Multiple resume templates (modern, plain, professional, professional2)
- Profile image support (JPEG, PNG, GIF)
- HTML entity escaping for safe content rendering
- Base64 image encoding for embedded images
- RESTful API with multipart/form-data support
- Automatic PDF filename generation based on candidate name

## Project Structure

```
src/main/java/com/generarpdf/service/
├── controllers/
│   └── PdfController.java          # REST API endpoint
├── services/
│   ├── IPdfService.java            # Service interface
│   └── PdfService.java             # PDF generation logic
├── dtos/
│   ├── CurriculumDto.java          # Main curriculum data
│   ├── ExperienceDto.java          # Work experience
│   ├── EducationDto.java           # Education history
│   ├── SkillsDto.java              # Skills
│   ├── CertificationsDto.java      # Certifications
│   ├── ProjectDto.java             # Projects
│   └── ReferencesDto.java          # References
└── models/
    └── Curriculum.java             # Domain model

src/main/resources/
└── templates/
    ├── modern.ftl
    ├── plain.ftl
    ├── professional.ftl
    └── professional2.ftl
```

## API Endpoint

### Generate PDF Resume

**Endpoint:** `POST /api/cv/generate`

**Content-Type:** `multipart/form-data`

**Parameters:**
- `curriculumJson` (required) - JSON string containing curriculum data
- `image` (optional) - Profile image file (JPEG, PNG, or GIF)

**Response:**
- **Content-Type:** `application/pdf`
- **Content-Disposition:** `attachment; filename="{fullName}.pdf"`
- **Body:** PDF file as byte array

## Curriculum JSON Structure

```json
{
  "fullName": "John Doe",
  "email": "john.doe@example.com",
  "phone": "+1234567890",
  "address": "City, Country",
  "summary": "Professional summary...",
  "language": "en",
  "style": "professional",
  "skills": [
    {
      "category": "Programming Languages",
      "items": ["Java", "Python", "JavaScript"]
    }
  ],
  "experiences": [
    {
      "jobTitle": "Software Engineer",
      "company": "Tech Company",
      "startDate": "2020-01",
      "endDate": "Present",
      "description": "Job responsibilities..."
    }
  ],
  "education": [
    {
      "degree": "Bachelor of Computer Science",
      "institution": "University Name",
      "startDate": "2016",
      "endDate": "2020",
      "details": "Additional details..."
    }
  ],
  "certifications": [
    {
      "name": "Certification Name",
      "issuer": "Issuing Organization",
      "date": "2021"
    }
  ],
  "projects": [
    {
      "name": "Project Name",
      "description": "Project description...",
      "technologies": ["Tech1", "Tech2"]
    }
  ],
  "references": [
    {
      "name": "Reference Name",
      "position": "Position",
      "contact": "contact@example.com"
    }
  ]
}
```

## Available Templates

The `style` field in the curriculum JSON determines which template is used:

- `modern` - Modern design with contemporary styling
- `plain` - Simple, clean layout
- `professional` - Traditional professional format
- `professional2` - Alternative professional format

## Installation & Setup

### Prerequisites

- Java 17 or higher
- Maven 3.6+

### Build

```bash
./mvnw clean install
```

### Run

```bash
./mvnw spring-boot:run
```

The service will start on the default port (typically 8080).

## Usage Example

### Using cURL

```bash
curl -X POST http://localhost:8080/api/cv/generate \
  -F "curriculumJson={\"fullName\":\"John Doe\",\"email\":\"john@example.com\",\"style\":\"professional\",...}" \
  -F "image=@profile.jpg" \
  -o resume.pdf
```

### Using Postman

1. Set method to `POST`
2. URL: `http://localhost:8080/api/cv/generate`
3. Body type: `form-data`
4. Add key `curriculumJson` (Text) with JSON data
5. Add key `image` (File) with profile image
6. Send request and save response as PDF

## Security Features

- HTML entity escaping to prevent XSS attacks
- Image format validation (JPEG, PNG, GIF)
- Multipart file size limits (configurable in Spring Boot)

## Error Handling

The service returns:
- **200 OK** - PDF generated successfully
- **500 Internal Server Error** - Generation failed (check logs)

## Logging

The service uses SLF4J with Logback for logging. Key operations are logged including:
- Endpoint access
- Image processing details
- Template selection
- Error stack traces

## Development

### Adding New Templates

1. Create a new `.ftl` file in `src/main/resources/templates/`
2. Use existing templates as reference
3. Access curriculum data using FreeMarker syntax: `${curriculum.fieldName}`
4. Set the `style` field in JSON to match the template filename (without `.ftl`)

### Extending DTOs

To add new fields:
1. Update the corresponding DTO class in `dtos/` package
2. Add getter/setter methods (or use Lombok annotations)
3. Update FreeMarker templates to display the new fields

## License

[Specify your license here]

## Author

Heikel A. Molina

## Version

0.0.1
