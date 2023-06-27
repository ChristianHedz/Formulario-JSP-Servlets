package org.chris.apiservlet.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/registro")
public class FormServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String username = req.getParameter("username");
        String password= req.getParameter("password");
        String email= req.getParameter("email");
        String pais = req.getParameter("pais");
        String idioma = req.getParameter("idioma");
        String habilitar = req.getParameter("habilitar");
        String secreto = req.getParameter("secreto");
        String[] lenguajes = req.getParameterValues("lenguajes");
        String[] roles = req.getParameterValues("roles");

        Map<String,String> errores = new HashMap<>();
        if (username == null || username.isBlank()){
            errores.put("username","El username es requerido");
        }
        if (password == null || password.isBlank()){
            errores.put("password","El password no debe ser vacio!");
        }
        if (email == null || email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$") == false){
            errores.put("email","El email es requerido y debe tener un formato valido");
        }
        if (pais == null || pais.isBlank()){
            errores.put("pais","El pais es requerido");
        }
        if (lenguajes == null || lenguajes.length == 0){
            errores.put("lenguajes","debe seleccionar al menos un lenguaje");
        }
        if (roles == null || roles.length == 0){
            errores.put("roles","debe seleccionar al menos un rol");
        }
        if (idioma == null){
            errores.put("idioma","El idioma es requerido");
        }
        if (errores.isEmpty()) {
            try (PrintWriter out = resp.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("   <head>");
            out.println("      <meta charset= \"UTF-8\" >");
            out.println("      <title></title>");
            out.println("   </head>");
            out.println("   <body>");
            out.println("       <h1>Resultado parametros formulario</h1>");
            out.println("       <ul>");
                out.println("           <li>username : " + username + "</li>");
                out.println("           <li>password : " + password + "</li>");
                out.println("           <li>email : " + email + "</li>");
                out.println("           <li>pais : " + pais + "</li>");
                out.println("           <li>lenguajes : <ul>");
                Arrays.asList(lenguajes).forEach(lenguaje -> {
                    out.println("           <li>" + lenguaje + "</li>");
                });
                out.println("           </ul></li>");
                out.println("           <li>roles : <ul>");
                Arrays.asList(roles).forEach(role -> {
                    out.println("           <li>" + role + "</li>");
                });
                out.println("           </ul></li>");
                out.println("           <li>idioma : " + idioma + "</li>");
                out.println("           <li>habilitar : " + habilitar + "</li>");
                out.println("           <li>secreto : " + secreto + "</li>");
                out.println("       </ul>");
                out.println("   </body>");
                out.println("</html>");
        }
            }else{
//                errores.forEach(error ->{
//                    out.println("       <li>"+error+"</li>");
//                });
//                out.println("       <p><a href=\"/webapp/index.jsp\">Volver</p>");
                req.setAttribute("errores",errores);
                getServletContext().getRequestDispatcher("/index.jsp").forward(req,resp);
            }
    }
}
