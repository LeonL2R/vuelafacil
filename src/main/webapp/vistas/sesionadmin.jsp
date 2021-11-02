<%-- 
    Document   : crear
    Created on : 25/10/2021, 11:40:39 p. m.
    Author     : leora
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("nivel")==null) {
        response.sendRedirect("../index.jsp"); 
    } else {
        String nivel=sesion.getAttribute("nivel").toString();
        if (!nivel.equals("1")){
            response.sendRedirect("../index.jsp");
        }        
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sesión Administrador Rutas</title> 
        <link rel="stylesheet" href="/vuelafacil/css/jquery-ui.min.css">
        <script src="/vuelafacil/js/jquery-3.6.0.min.js"></script>
        <script src="/vuelafacil/js/jquery-ui.js"></script>
        <script> 
        $( function() {
            $( "#fecha" ).datepicker()({
        });
        } );
        
        </script> 
    </head>
    <body> 
        <h1><a href="/vuelafacil/RutasController?opcion=index2"> Colombia's Airplanes! </a> </h1>
        <h2 align="center">Bienvenido <%=sesion.getAttribute("nombre")%> <%=sesion.getAttribute("apellido")%></h2>

        <div align="right">
            <a href="/vuelafacil/UsuariosController?opcion=datosusuario">Mis datos personales</a>
            <a href="/vuelafacil/index.jsp?cerrar=true">Cerrar sesion</a>
            <hr>   
        </div>
        <h2>Crear Rutas</h2>      
        <form action="/vuelafacil/RutasController" method="post" autocomplete="off">      
            <input type="hidden" name="opcion" value="guardar">           
            <table>
                <tr>
                    <td>IdRuta:</td>
                    <td><input type="text" name="idruta" size="30"/></td>
                </tr> 
                <tr>
                    <td>Origen:</td>
                    <td><input type="text" name="origen" size="30"/></td>
                </tr> 
                <tr>
                    <td>Destino:</td>
                    <td><input type="text" name="destino" size="30"/></td>
                </tr>
                <tr>
                    <td>Fecha:</td>
                    <td><input type="text" name="fecha" id="fecha" size="30"/></td>
                </tr>
                <tr>
                    <td>Hora:</td>
                    <td><input type="time" name="hora" id="hora" size="30"/></td>
                </tr>
                <tr>
                    <td>Puestos:</td>
                    <td><input type="text" name="puestos" size="30"/></td>
                </tr>
                <tr>
                    <td>Precio:</td>
                    <td><input type="text" name="precio" size="30"/></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Guardar"/>
        </form>       
    </body>
</html>
