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
        <link rel="stylesheet" href="css/bootstrap.min.css">   		
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/style.css"> 
        <script> 
        $( function() {
            $( "#fecha" ).datepicker()({
        });
        } );        
        </script>
    </head>
    <body> 
        <div class="encabezado">
            <a href="RutasController?opcion=index"><img src="img/icono.png" style="width: 100px; height: 100px;" href="RutasController?opcion=index"/> </a>
            <td> <h1><a style="text-decoration:none; " href="/vuelafacil/RutasController?opcion=index2" class="text-white"> Colombia's Airplanes! </a> </h1> </td> 
        </div>       
        <div align="right" class="opciones">
            <a href="/vuelafacil/UsuariosController?opcion=datosusuario" class="sesion">Mis datos personales</a>
            <a href="/vuelafacil/index.jsp?cerrar=true" class="sesion">Cerrar sesion</a>   
        </div>
        <section class="form-crearrutas">
            <h2>Crear Rutas</h2>      
            <form action="/vuelafacil/RutasController" method="post" autocomplete="off">      
                <input type="hidden" name="opcion" value="guardar">           
                <table>
                    <tr>
                        <td>IdRuta:<br>
                        <input type="text" name="idruta" class="controlcrruta"/></td>
                        <td>Origen:<br>
                        <input type="text" name="origen" class="controlcrruta"/></td>
                        <td>Destino:<br>
                        <input type="text" name="destino" class="controlcrruta"/></td>
                        <td>Fecha:<br>
                        <input type="text" name="fecha" id="fecha" class="controlcrruta"/></td>
                    </tr>
                    <tr>
                        <td>Hora:<br>
                        <input type="time" name="hora" id="hora" class="controlcrruta"/></td>
                        <td>Puestos:<br>
                        <input type="text" name="puestos" class="controlcrruta"/></td>
                        <td>Precio:<br>
                        <input type="text" name="precio" class="controlcrruta"/></td>
                        <td><input type="submit" value="Crear ruta" class="boton-crruta"/></td>
                    </tr>
                </table>                
            </form>
        </section>
    </body>
</html>
