<%@page contentType="text/html; ISO-8859-1" pageEncoding="UTF-8" %>
<%@page import="java.util.Map" %>
<%Map<String,String> errores = (Map<String,String>) request.getAttribute("errores");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de usuarios</title>
    <link rel="stylesheet" href=<%request.getContextPath();%>"bootstrap.min.css">
</head>
<body style="background: rgb(34,193,195);
        background: linear-gradient(0deg, rgba(34,193,195,1) 10%, rgba(36,147,196,1) 29%, rgba(245,244,251,0.7931547619047619) 100%);">
<%--    <%--%>
<%--      if(errores != null && errores.size()>0){--%>
<%--    %>--%>
<%--    <ul class="alert alert-danger mx-5">--%>
<%--      <% for (String error : errores.values()){%>--%>
<%--      <li><%=error%></li>--%>
<%--      <%}%>--%>
<%--    </ul>--%>
<%--    <%}%>--%>
    <h1 class="mx-5" style="text-transform: capitalize">Formulario de usuarios</h1>
    <div class="px-5">
      <form action="/webapp/registro" method="post">
        <div class="row mb-3 ">
          <label for="username" class="col-form-label col-sm-2">username</label>
          <div class="col-sm-4 "><input type="text" name="username" id="username" class="form-control" value="${param.username}"></div>
          <%
            if (errores != null && errores.containsKey("username")){
            out.println("<small class='alert alert-danger col-sm-4'>"+ errores.get("username")+"</small>");
          }%>
        </div>
        <div class="row mb-3 ">
          <label for="password" class="col-form-label col-sm-2">password</label>
          <div class="col-sm-4 "><input type="password" name="password" id="password" class="form-control" value="${param.password}"></div>
          <%
            if (errores != null && errores.containsKey("password")){
              out.println("<small class='alert alert-danger col-sm-4'>"+ errores.get("password")+"</small>");
            }%>
        </div>
        <div class="row mb-3 ">
          <label for="email" class="col-form-label col-sm-2">email</label>
          <div class="col-sm-4 "><input type="email" name="email" id="email" class="form-control" value="${param.email}"></div>
          <%
            if (errores != null && errores.containsKey("email")){
              out.println("<small class='alert alert-danger col-sm-4'>"+ errores.get("email")+"</small>");
            }%>
        </div>

        <div class="row mb-3">
          <label for="pais" class="col-form-label col-sm-2">Pais</label>
          <div class="col-sm-4">
            <select name="pais" id="pais" class="form-select">
              <option value="">=Selecionar=</option>
              <option value="MX" ${param.pais.equals("MX")? "selected" : ""}>Mexico</option>
              <option value="ES" ${param.pais.equals("ES")? "selected" : ""}>España</option>
              <option value="CL" ${param.pais.equals("CL")? "selected" : ""}>Chile</option>
              <option value="AR" ${param.pais.equals("AR")? "selected" : ""}>Argentina</option>
              <option value="VE" ${param.pais.equals("VE")? "selected" : ""}>Venezuela</option>
            </select>
          </div>
          <%
            if (errores != null && errores.containsKey("pais")){
              out.println("<small class='alert alert-danger col-sm-4'>"+ errores.get("pais")+"</small>");
            }%>
        </div><!--paises-->
        <div class="row mb-3">
          <label for="lenguajes" class="col-form-label col-sm-2">Lenguajes de Programacion</label>
          <div class="col-sm-4">
            <select name="lenguajes" id="lenguajes" multiple class="form-select">
              <option value="">=Selecionar=</option>
              <option value="java" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("java").get()? "selected": "")}>Java</option>
              <option value="c#" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("c#").get()? "selected": "")}>c#</option>
              <option value="jakartaee" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("jakartaee").get()? "selected": "")}>jakartaee</option>
              <option value="python" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("python").get()? "selected": "")}>python</option>
              <option value="javascript" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("javascript").get()? "selected": "")}>javascript</option>
              <option value="angular" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("angular").get()? "selected": "")}>angular</option>
              <option value="spring" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("spring").get()? "selected": "")}>spring</option>
            </select>
          </div>
          <%
            if (errores != null && errores.containsKey("lenguajes")){
              out.println("<small class='alert alert-danger col-sm-4'>"+ errores.get("lenguajes")+"</small>");
            }%>
        </div><!--lenguajes-->
        <div class="row mb-3">
          <label for="email" class="col-form-label col-sm-2">email</label>
          <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROLE_ADMIN" class="form-check-input" ${paramValues.roles.stream().anyMatch(v -> v.equals("ROLE_ADMIN").get()? "ckecked": "")}>
            <label  class="form-check-label">Administrador</label>
          </div>
          <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROLE_USER" class="form-check-input" ${paramValues.roles.stream().anyMatch(v -> v.equals("ROLE_USER").get()? "ckecked": "")}>
            <label  class="form-check-label">Usuario</label>
          </div>
          <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROLE_MOD" class="form-check-input"  ${paramValues.roles.stream().anyMatch(v -> v.equals("ROLE_MOD").get()? "ckecked": "")}>
            <label  class="form-check-label">Moderador</label>
          </div>
          <%
            if (errores != null && errores.containsKey("roles")){
              out.println("<small class='alert alert-danger col-sm-4'>"+ errores.get("roles")+"</small>");
            }%>
        </div><!--roles-->
        <div class="row mb-3">
          <label class="col-form-label col-sm-2">Idiomas</label>
        <div class="form-check col-sm-2">
          <input type="radio" name="idioma" value="es" class="form-check-input" ${param.idioma.equals("es")? "checked": ""}>
          <label class="form-check-label">Español</label>
        </div>
        <div class="form-check col-sm-2">
          <input type="radio" name="idioma" value="en" class="form-check-input" ${param.idioma.equals("en")? "checked": ""}>
          <label class="form-check-label">Ingles</label>
        </div>
        <div class="form-check col-sm-2">
          <input type="radio" name="idioma" value="fr" class="form-check-input" ${param.idioma.equals("fr")? "checked": ""}>
          <label class="form-check-label">Frances</label>
        </div>
          <%
            if (errores != null && errores.containsKey("idioma")){
              out.println("<small class='alert alert-danger col-sm-4'>"+ errores.get("idioma")+"</small>");
            }%>
        </div><!--idiomas-->
        <div class="row mb-3 ">
          <label for="habilitar" class="col-form-label col-sm-2">habilitar</label>
          <div class="form-check col-sm-2"><input type="checkbox" name="habilitar" id="habilitar"></div>
        </div><!--habilitar-->
        <div class="row mb-3">
          <div>
            <input type="submit" value="Enviar" class="btn btn-primary">
          </div>
        </div><!--boton-->
        <input type="hidden" name="secreto" value="12345">
      </form>
    </div>
</body>
</html>