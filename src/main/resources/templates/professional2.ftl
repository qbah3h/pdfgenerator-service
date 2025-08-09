<!DOCTYPE html>
<html lang="en">

<head>
  <title>Full Screen Div Blueprint</title>
  <style>
    @page {
      margin: 0;
    }

    html,
    body {
      margin: 0;
      padding: 0;
      height: 100%;
    }

    .full-screen-div {
      width: 210mm;
      height: 297mm;
      border: 4px solid black;
      box-sizing: border-box;
      display: flex;
    }

    .left-panel {
      width: 30%;
      height: 297mm;
      /* Ensure full screen height */
      background-color: #f0f0f0;
      border-right: 2px solid gray;
      display: flex;
      flex-direction: column;
      box-sizing: border-box;
    }

    .section {
      padding: 10px;
      background-color: #ddd;
      border: 1px solid #aaa;
      box-sizing: border-box;
      overflow: auto;
    }

    .section.picture {
      height: 25%;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .section.contact,
    .section.skills,
    .section.references {
      flex: 1;
      /* Share remaining space equally */
    }

    .right-panel {
      width: 70%;
      background-color: #ffffff;
    }

    img {
      max-width: 100%;
      max-height: 100%;
      object-fit: contain;
    }
  </style>
</head>

<body>

  <div class="full-screen-div">
    <div class="left-panel">
      <#if imageData??>
        <div class="section picture">
          <img src="${imageData}" alt="Profile Picture" />
        </div>
      </#if>

      <div class="section contact">
        <h3>
          <#if language=='en'>CONTACT<#else>CONTACTO</#if>
        </h3>
        <p>
          <#if language=='en'>Phone:<#else>Teléfono:</#if> ${phone}
        </p>
        <p>Email: ${email}</p>
        <p>
          <#if language=='en'>Address:<#else>Domicilio:</#if> ${address}
        </p>
      </div>

      <#if skills?has_content && skills?filter(s -> s.title?has_content || s.description?has_content)?size gt 0>
        <div class="section skills">
          <h3>
            <#if language=='en'>SKILLS<#else>HABILIDADES</#if>
          </h3>
          <#list skills?filter(s -> s.title?has_content || s.description?has_content) as skill>
            <p>- ${skill.title}</p>
            <p>${skill.description}</p>
          </#list>
        </div>
      </#if>

      <#if references?has_content && references?filter(r -> r.name?has_content)?size gt 0>
        <div class="section references">
          <h3>
            <#if language=='en'>REFERENCES<#else>REFERENCIAS</#if>
          </h3>
          <#list references?filter(r -> r.name?has_content) as ref>
            <p>- ${ref.name}</p>
            <p>${ref.phone}</p>
            <p>${ref.email}</p>
          </#list>
        </div>
      </#if>

    </div>

    <div class="right-panel">
      <!-- Right 70% content -->
    </div>
  </div>

</body>

</html>