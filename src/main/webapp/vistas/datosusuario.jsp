<%-- 
    Document   : datosusuario
    Created on : 29/10/2021, 11:40:10 a. m.
    Author     : leora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("nivel")==null) {
        response.sendRedirect("../index.jsp"); 
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>        
        <script type="text/javascript">
            $(document).ready(function(){
                $("#crearruta").hide();
                
                let nivel="${usuario.nivel}";
                if (nivel==="1"){
                     $("#crearruta").show();
                }
            });                            
        </script> <!---- Mostrar Comsulta ----->
        
    </head>
    <body>
        <h1><a href="RutasController?opcion=index2"> Colombia's Airplanes! </a> </h1>
        <div align="right">
            <a href="vistas/sesionadmin.jsp" id="crearruta">Creación de rutas</a>
            <a href="/vuelafacil/index.jsp?cerrar=true">Cerrar sesion</a>
            <hr>   
        </div>
        <h2>Datos personales</h2>
        <form action="/vuelafacil/UsuariosController" method="post" autocomplete="off">      
            <input type="hidden" name="opcion" value="actualizardatos">    
            <table>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" value="${usuario.nombre}" size="30"/></td>
                </tr> 
                <tr>
                    <td>Apellido</td>
                    <td><input type="text" name="apellido" value="${usuario.apellido}" size="30"/></td>
                </tr>
                <tr>
                    <td>Telefono</td>
                    <td><input type="text" name="telefono" value="${usuario.telefono}" size="30"/></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Actualizar datos"/>            
        </form>
                <br>  
        <form action="/vuelafacil/UsuariosController" method="post" autocomplete="off">      
            <input type="hidden" name="opcion" value="actualizarcontrasena">    
            <table>
                <tr>
                    <td>Contraseña</td>
                    <td><input type="text" name="contrasena" size="30"/></td>
                </tr>
                <tr>
                    <td>Confirmar contraseña</td>
                    <td><input type="text" name="contrasenacon" size="30"/></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Actualizar Contraseña"/>            
        </form>
        <form action="/vuelafacil/UsuariosController" method="post">      
            <input type="hidden" name="opcion" value="eliminarcuenta">    
            <br>
            <input type="submit" value="Eliminar Cuenta"/>            
        </form>
    </body>
</html>
