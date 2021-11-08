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
        <link rel="stylesheet" href="css/bootstrap.min.css">   		
        <script src="js/bootstrap.min.js"></script>
        <title>CREAR USUARIO</title>
        <script src="js/jquery-3.6.0.min.js"></script> 
        <link rel="stylesheet" href="css/style.css"> 
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
        <div class="encabezado">
            <a href="RutasController?opcion=index"><img src="img/icono.png" style="width: 100px; height: 100px;" href="RutasController?opcion=index"/> </a>
            <td> <h1><a style="text-decoration:none; " href="RutasController?opcion=index" class="text-white"> Colombia's Airplanes! </a> </h1> </td> 
        </div>
        <section class="form-signup">    
            <h2>Crea tú cuenta en Colombia's Airplanes!</h2>
            <table>
                <td> 
                <button style="margin-left:3px" id="cliente" class="boton-cliente">Cliente </button>
                <button style="margin-left:30px" id="administrador" class="boton-administrador">Administrador</button></td>
            </table>    
            <form action="UsuariosController" method="post" id="formulario" autocomplete="off">      
                <input type="hidden" name="opcion" value="crearusuario">    
                <table>
                    <tr>
                        <td>Número de identificación
                        <input type="text" name="idusuario" class="controlssignup"/></td>
                        <td id="claveadmin">Clave administrador<br>
                        <input type="text" name="claveadmin" class="controlssignup"/></td>    
                    </tr>
                    <tr>
                        <td>Nombre<br>
                        <input type="text" name="nombre" class="controlssignup"/></td>
                        <td>Apellido<br>
                        <input type="text" name="apellido" class="controlssignup"/></td>
                    </tr>
                    <tr>
                        <td>Telefono<br>
                        <input type="text" name="telefono" class="controlssignup"/></td>
                        <td>E-mail<br>
                        <input type="text" name="email" class="controlssignup" autocomplete="off"/></td>           
                    </tr>
                    <tr>
                        <td>Contraseña<br>
                        <input type="text" name="contrasena" class="controlssignup"/></td>
                        <td> Confirmar contraseña<br>
                        <input type="text" name="contrasenacon" class="controlssignup"/></td>
                    </tr>
                </table>  
                <input type="submit" value="Crear cuenta" class="botonsignup"/>            
            </form>            
        </section>
    </body>
</html>
