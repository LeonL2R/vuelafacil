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
        response.sendRedirect("/vuelafacil/vistas/iniciosesion.jsp"); 
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
        <title>Reservar Vuelo</title>       
    </head>
    <body>
        <td> <h1><a href="/vuelafacil/RutasController?opcion=index2"> Colombia's Airplanes! </a> </h1> </td>
        <div align="right">
            <td><a href="/vuelafacil/UsuariosController?opcion=datosusuario" id="datos">Mis datos personales</a></td>
            <td><a href="/vuelafacil/index.jsp?cerrar=true" id="cerrar"> Cerrar sesion </a> </td>            
            <hr>   
        </div>
        <h1 align="center">Reservar Vuelo</h1>
        <form action="/vuelafacil/RutasController" method="post">      
            <input type="hidden" name="opcion" value="reservar">           
            <table>
                <tr><th colspan="2" height="50"><font size="5">Datos del vuelo</th>
                <td></td>
                <td></td>
                <th colspan="2" height="50"><font size="5">Datos del Usuario</th>
                <td></td>
                </tr>
                <tr>
                    <td>IdRuta:</td>
                    <td><input type="text" name="idruta" readonly="readonly" value="${ruta.idruta}" size="20"/></td>
                    <td width="10%"></td>
                    <td>Nombre:</td>
                    <td><input type="text" name="nombre" readonly="readonly" value="<%=sesion.getAttribute("nombre")%>" size="20"/></td>
                </tr> 
                <tr>
                    <td>Origen:</td>
                    <td><input type="text" name="origen" readonly="readonly" value="${ruta.origen}" size="20"/></td>
                    <td width="10%"></td>
                    <td>Apellido:</td>
                    <td><input type="text" name="apellido" readonly="readonly" value="<%=sesion.getAttribute("apellido")%>" size="20"/></td>
                </tr> 
                <tr>
                    <td>Destino:</td>
                    <td><input type="text" name="destino" readonly="readonly" value="${ruta.destino}" size="20"/></td>
                    <td width="10%"></td>
                    <td>Telefono:</td>
                    <td><input type="text" name="idruta" readonly="readonly" value="<%=sesion.getAttribute("telefono")%>"  size="20"/></td>
                </tr>
                <tr>
                    <td>Fecha:</td>
                    <td><input type="text" name="fecha" readonly="readonly" value="${ruta.fecha}" size="20"/></td>
                </tr>
                <tr>
                    <td>Hora:</td>
                    <td><input type="text" name="hora" readonly="readonly" value="${ruta.hora}" size="20"/></td>
                </tr>
                <tr>
                    <td>Precio:</td>
                    <td><input type="text" name="precio" readonly="readonly" value="${ruta.precio}" size="20"/></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Reservar"/>
        </form>       
    </body>
</html>
