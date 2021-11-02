<%-- 
    Document   : iniciosesion
    Created on : 27/10/2021, 10:51:09 p. m.
    Author     : leora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>          
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesión</title>        
    </head>
    <body>
        <h1><a href="/vuelafacil/RutasController?opcion=index"> Colombia's Airplanes! </a> </h1>
        <h2>Iniciar Sesión</h2>
        <form action="/vuelafacil/UsuariosController" method="post" autocomplete="off">      
            <input type="hidden" name="opcion" value="iniciarsesion">    
            <table>
                <tr>
                    <td>Número de identificación:</td>
                    <td><input type="text" name="idusuario" size="30"/></td>
                </tr> 
                <tr>
                    <td>Contraseña</td>
                    <td><input type="text" name="contrasena" size="30"/></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Iniciar sesion"/>            
        </form>
        <br>
        <tr> 
            <td> <a href="/vuelafacil/UsuariosController?opcion=crearusuario"> Crear Usuario </a> </td> 
        </tr>
   
        <%
            HttpSession sesion = request.getSession(); 
            if (request.getAttribute("nivel")!=null){
                String nivel=(String) request.getAttribute("nivel");
                sesion.setAttribute("idusuario", request.getAttribute("idusuario"));
                sesion.setAttribute("nombre", request.getAttribute("nombre"));
                sesion.setAttribute("apellido", request.getAttribute("apellido"));
                sesion.setAttribute("telefono", request.getAttribute("telefono"));
                sesion.setAttribute("nivel", nivel);
                if (nivel.equals("1")) {
                    response.sendRedirect("vistas/sesionadmin.jsp");
                } else if (nivel.equals("2")){
                    response.sendRedirect("index.jsp");
                    request.setAttribute("nivel", "2");
                    }
                }
        %>            
    </body>
</html>
