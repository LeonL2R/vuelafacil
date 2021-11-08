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
        <link rel="stylesheet" href="css/bootstrap.min.css">   		
        <script src="js/bootstrap.min.js"></script> 
        <link rel="stylesheet" href="css/style.css">  
        <title>Inicio de sesión</title>        
    </head>
    <body> 
        <div class="encabezado">
            <a href="RutasController?opcion=index"><img src="img/icono.png" style="width: 100px; height: 100px;" href="RutasController?opcion=index"/> </a>
            <h1><a style="text-decoration:none; " href="RutasController?opcion=index" class="text-white"> Colombia's Airplanes! </a> </h1>
        </div>
        <section class="form-login">
            <h5>Formulario Login</h5>
            <form action="/vuelafacil/UsuariosController" method="post" autocomplete="off">
                <input type="hidden" name="opcion" value="iniciarsesion">    
                <table>
                    <tr>
                        <td><input type="text" name="idusuario" class= "controls" placeholder="Número de identificación"/></td>
                    </tr> 
                    <tr>
                        <td><input type="text" name="contrasena" class= "controls" placeholder="Contraseña"/></td>
                    </tr>
                </table>
                <input type="submit" value="Iniciar sesion" class="botonlogin"/>
                <p> <a href="/vuelafacil/UsuariosController?opcion=crearusuario"> Crear Usuario </a> </p>
            </form>
        </section>
   
        <%
            HttpSession sesion = request.getSession(); 
            if (request.getAttribute("nivel")!=null){
                String nivel=(String) request.getAttribute("nivel");
                sesion.setAttribute("idusuario", request.getAttribute("idusuario"));
                sesion.setAttribute("nombre", request.getAttribute("nombre"));
                sesion.setAttribute("apellido", request.getAttribute("apellido"));
                sesion.setAttribute("telefono", request.getAttribute("telefono"));
                sesion.setAttribute("email", request.getAttribute("email"));
                sesion.setAttribute("nivel", nivel);
                if (nivel.equals("1")) {
                    response.sendRedirect("/vuelafacil/UsuariosController?opcion=sesionadmin");
                } else if (nivel.equals("2")){
                    response.sendRedirect("index.jsp");
                    request.setAttribute("nivel", "2");
                    }
                }
        %>    <-<!-- LOGIN -->        
    </body>
</html>
