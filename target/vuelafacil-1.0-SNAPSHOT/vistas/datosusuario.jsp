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
        <script src="/vuelafacil/js/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">   		
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/style.css"> 
        <title>JSP Page</title>       
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
        <div class="encabezado">
            <a href="RutasController?opcion=index"><img src="img/icono.png" style="width: 100px; height: 100px;" href="RutasController?opcion=index"/> </a>
            <td> <h1><a style="text-decoration:none; " href="RutasController?opcion=index" class="text-white"> Colombia's Airplanes! </a> </h1> </td> 
        </div>
        <div align="right" class="opciones">
            <a href="/vuelafacil/UsuariosController?opcion=sesionadmin" id="crearruta" class="sesion">Creación de rutas</a>
            <a href="/vuelafacil/index.jsp?cerrar=true" class="sesion">Cerrar sesion</a> 
        </div>
        <section class="form-datos">
            <h2>Datos personales</h2>
            <form action="/vuelafacil/UsuariosController" method="post" autocomplete="off">      
                <input type="hidden" name="opcion" value="actualizardatos">    
                <table>
                    <tr>
                        <td>Nombre<br>
                        <input type="text" name="nombre" class="controldatos" value="${usuario.nombre}"/></td>
                        <td>Apellido<br>
                        <input type="text" name="apellido" class="controldatos" value="${usuario.apellido}"/></td>
                    </tr>
                    <tr>
                        <td>Telefono<br>
                        <input type="text" name="telefono" class="controldatos" value="${usuario.telefono}"/></td>
                        <td>E-mail<br>
                        <input type="text" name="email" class="controldatos" autocomplete="off" value="${usuario.email}"//></td>  
                    </tr>
                </table>
                    <input type="submit" value="Actualizar datos" class="boton-actdatos"/>
            </form>
                    <br>  
            <form action="/vuelafacil/UsuariosController" method="post" autocomplete="off">      
                <input type="hidden" name="opcion" value="actualizarcontrasena">    
                <table>
                    <tr>
                        <td>Contraseña<br>
                        <input type="text" name="contrasena" class="controldatos"/></td>
                        <td>Confirmar contraseña<br>
                        <input type="text" name="contrasenacon" class="controldatos"/></td>
                    </tr>
                </table>
                <input type="submit" value="Actualizar Contraseña" class="boton-actcontrasena"/>            
            </form>
                    <br>
            <form action="/vuelafacil/UsuariosController" method="post">      
                <input type="hidden" name="opcion" value="eliminarcuenta">    
                <br>
                <input type="submit" value="Eliminar Cuenta" class="boton-eliminarcuenta"/>            
            </form>
        </section>
    </body>
</html>
