<%-- 
    Document   : crearusuario
    Created on : 27/10/2021, 9:19:19 p. m.
    Author     : leora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CREAR USUARIO</title>
        <script src="js/jquery-3.6.0.min.js"></script>
        
        
        <script type="text/javascript">
            $(document).ready(function(){
                $("#claveadmin").hide();
                });
            $(function(){
                $("#administrador").click(function(){
                    $("#claveadmin").show();  
                });
                $("#cliente").click(function(){
                    $("#claveadmin").hide();  
                });
            });                    
        </script> <!---- Nivel de acceso ----->
                
    </head>
    <body>
        <h1><a href="RutasController?opcion=index"> Colombia's Airplanes! </a> </h1>
        <h2>Crear cuenta de usuario</h2>
        <table>
            <td> Tipo de usuario</td>
            <td> <button style="margin-left:100px" id="cliente">Cliente </button>
                 <button style="margin-left:30px" id="administrador">Administrador</button></td>
        </table>
        <form action="UsuariosController" method="post" id="formulario" autocomplete="off">      
            <input type="hidden" name="opcion" value="crearusuario">    
            <table>
                <tr id="claveadmin">
                    <td>Clave de administrador</td>
                    <td><input type="text" name="claveadmin" size="30"/></td>
                </tr>
                <tr>
                    <td>Número de identificación:</td>
                    <td><input type="text" name="idusuario" size="30"/></td>
                </tr> 
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" size="30"/></td>
                </tr> 
                <tr>
                    <td>Apellido</td>
                    <td><input type="text" name="apellido" size="30"/></td>
                </tr>
                <tr>
                    <td>Telefono</td>
                    <td><input type="text" name="telefono" size="30"/></td>
                </tr>
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
            <input type="submit" value="Crear cuenta"/>            
        </form>
    </body>
</html>
