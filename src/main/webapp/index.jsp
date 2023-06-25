<%@page contentType="text/html; ISO-8859-1" pageEncoding="UTF-8" %>
<%@page import="java.util.List" %>
<%
  List<String> errores = (List<String>) request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de usuarios</title>
  <link rel="stylesheet" href="index.css">
</head>
<body>
    <h1>Formulario de usuarios</h1>
    <%
      if(errores != null && errores.size()>0){
    %>
    <ul>
      <% for (String error : errores){%>
      <li><%=error%></li>
      <%}%>
    </ul>
    <%}%>
      <form action="/webapp/registro" method="post">
        <div>
          <label for="username">username</label>
          <div><input type="text" name="username" id="username"></div>
        </div>
        <div>
          <label for="password">password</label>
          <div><input type="password" name="password" id="password"></div>
        </div>
        <div>
          <label for="email">email</label>
          <div><input type="email" name="email" id="email"></div>
        </div>

        <div>
          <label for="pais">Pais</label>
          <div>
            <select name="pais" id="pais">
              <option value="">=Selecionar=</option>
              <option value="MX">Mexico</option>
              <option value="ES">España</option>
              <option value="CL">Chile</option>
              <option value="AR">Argentina</option>
              <option value="VE">Venezuela</option>
            </select>
          </div>
        </div><!--paises-->
        <div>
          <label for="lenguajes">Lenguajes de Programacion</label>
          <div>
            <select name="lenguajes" id="lenguajes" multiple>
              <option value="">=Selecionar=</option>
              <option value="java">Java</option>
              <option value="java">java</option>
              <option value="jakartaee">jakartaee</option>
              <option value="python">python</option>
              <option value="javascript">javascript</option>
              <option value="angular">angular</option>
              <option value="spring">spring</option>
            </select>
          </div>
        </div><!--lenguajes-->
        <div>
          <label for="email">email</label>
          <div>
            <input type="checkbox" name="roles" value="ROLE_ADMIN">
            <label >Administrador</label>
          </div>
          <div>
            <input type="checkbox" name="roles" value="ROLE_USER">
            <label >Usuario</label>
          </div>
          <div>
            <input type="checkbox" name="roles" value="ROLE_MOD">
            <label >Moderador</label>
          </div>
        </div><!--roles-->
        <div>
          <label>Idiomas</label>
        <div>
          <input type="radio" name="idioma" value="es">
          <label>Español</label>
        </div>
        <div>
          <input type="radio" name="idioma" value="en">
          <label>Ingles</label>
        </div>
        <div>
          <input type="radio" name="idioma" value="fr">
          <label>Frances</label>
        </div>
        </div><!--idiomas-->
        <div>
          <label for="habilitar">habilitar</label>
          <div><input type="checkbox" name="habilitar" id="habilitar"></div>
        </div><!--habilitar-->
        <div>
          <div>
            <input type="submit" value="Enviar">
          </div>
        </div><!--boton-->
        <input type="hidden" name="secreto" value="12345">
      </form>
</body>
</html>