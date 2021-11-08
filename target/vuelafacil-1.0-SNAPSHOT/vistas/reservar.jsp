<%-- 
    Document   : reservar
    Created on : 1/11/2021, 5:18:58 p. m.
    Author     : leora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("nivel")==null) {
        response.sendRedirect("UsuariosController?opcion=iniciarsesion"); 
    } else {
        String nivel=sesion.getAttribute("nivel").toString();
        if (!nivel.equals("2")){
            response.sendRedirect("/vuelafacil/vistas/iniciosesion.jsp");
        }
    }    
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">   		
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <title>Reservar Vuelo</title>       
    </head>
    <body>
        <div class="encabezado">
            <a href="RutasController?opcion=index"><img src="img/icono.png" style="width: 100px; height: 100px;" href="RutasController?opcion=index"/> </a>
            <td> <h1><a style="text-decoration:none; " href="RutasController?opcion=index" class="text-white"> Colombia's Airplanes! </a> </h1> </td> 
        </div>
        <div align="right" class="opciones">
            <td><a href="/vuelafacil/UsuariosController?opcion=datosusuario" id="datos" class="sesion">Mis datos personales</a></td>
            <td><a href="/vuelafacil/index.jsp?cerrar=true" id="cerrar" class="sesion"> Cerrar sesion </a> </td>               
        </div>
        <section class="form-reservar">
            <h2 align="center">Reservar Vuelo</h2>
            <form action="/vuelafacil/RutasController" method="post">      
                <input type="hidden" name="opcion" value="reservar">           
                <table>
                    <tr>
                    <th colspan="2" class="label-reservarupper">Datos del vuelo</th>
                    <th colspan="2" class="label-reservarupper">Datos del usuario</th>
                    </tr>
                    <tr><td></td></tr>
                    <tr>
                        <td class="label-reservar">IdRuta:</td>
                        <td><input type="text" name="idruta" readonly="readonly" class="controlreservar" value="${ruta.idruta}"/></td>
                        <td class="label-reservar">Nombre:</td>
                        <td><input type="text" name="nombre" readonly="readonly" class="controlreservar" value="<%=sesion.getAttribute("nombre")%>"/></td>
                    </tr> 
                    <tr>
                        <td class="label-reservar">Origen:</td>
                        <td><input type="text" name="origen" readonly="readonly" class="controlreservar" value="${ruta.origen}"/></td>
                        <td class="label-reservar">Apellido:</td>
                        <td><input type="text" name="apellido" readonly="readonly" class="controlreservar" value="<%=sesion.getAttribute("apellido")%>"/></td>
                    </tr> 
                    <tr>
                        <td class="label-reservar">Destino:</td>
                        <td><input type="text" name="destino" readonly="readonly" class="controlreservar" value="${ruta.destino}"/></td>
                        <td class="label-reservar">Telefono:</td>
                        <td><input type="text" name="idruta" readonly="readonly" class="controlreservar" value="<%=sesion.getAttribute("telefono")%>"/></td>
                    </tr>
                    <tr>
                        <td class="label-reservar">Fecha:</td>
                        <td><input type="text" name="fecha" readonly="readonly" class="controlreservar" value="${ruta.fecha}"/></td>
                        <td class="label-reservar">E-mail</td>
                        <td><input type="text" name="email"  readonly="readonly" class="controlreservar" value="<%=sesion.getAttribute("email")%>"/></td>
                    </tr>
                    <tr>
                        <td class="label-reservar">Hora:</td>
                        <td><input type="text" name="hora" readonly="readonly" class="controlreservar" value="${ruta.hora}"/></td>
                        <td></td>
                        <td><input type="submit" value="Reservar" class="boton-reservar"/></td>
                    </tr>
                    <tr>
                        <td class="label-reservar">Precio:</td>
                        <td><input type="text" name="precio" readonly="readonly" class="controlreservar" value="${ruta.precio}"/></td>
                    </tr>
                </table>
            </form>
        </section>
    </body>
</html>
