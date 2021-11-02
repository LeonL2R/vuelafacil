<%-- 
    Document   : index
    Created on : 25/10/2021, 10:36:30 p. m.
    Author     : leora
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>        
        <script type="text/javascript">
            $(document).ready(function(){
                $("#consulta").hide();
                $("#cerrar").hide();
                $("#datos").hide();
                $("#rutas").hide();
                let consulta="${consulta}";
                if (consulta === "1"){
                    $("#consulta").show();
                }      
                let nivel="${nivel}";
                if (nivel==="1"){
                    $("#rutas").show();
                    $("#datos").show();
                    $("#cerrar").show();
                    $("#iniciar").hide();
                }else if (nivel==="2"){
                    $("#datos").show();
                    $("#cerrar").show();
                    $("#iniciar").hide();
                }
            });                            
        </script> <!---- Mostrar Comsulta ----->
    </head>
    <body>
        <td> <h1><a href="RutasController?opcion=index"> Colombia's Airplanes! </a> </h1> </td>
        <div align="right">
            <td><a href="vistas/sesionadmin.jsp" id="rutas"> Creacion de rutas</a></td>
            <td><a href="/vuelafacil/UsuariosController?opcion=datosusuario" id="datos">Mis datos personales</a></td>
            <td><a href="UsuariosController?opcion=iniciarsesion" id="iniciar"> Iniciar sesion </a> </td>
            <td><a href="/vuelafacil/index.jsp?cerrar=true" id="cerrar"> Cerrar sesion </a> </td>            
            <hr>   
        </div>    
        <form action="RutasController" method="post"> 
            <input type="hidden" name="opcion" value="consultar">
            <table> 
                <tr>
                    <td>Origen:</td>
                    <td><input type="text" name="origen" size="30"/></td>
                </tr>       
                <tr>
                    <td>Destino:</td>
                    <td><input type="text" name="destino" size="30"/></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Consultar Vuelos" id="mostrar"/>
        </form>
        <p></p>  
        <table border="1" id="consulta">
            <tr>
                <td align="center">IdRuta </td> 
                <td align="center">Origen </td> 
                <td align="center">Destino </td>
                <td align="center">Fecha </td> 
                <td align="center">Hora </td>
                <td align="center">Puestos disponibles </td> 
                <td align="center">Precio </td>
                <td></td>
            </tr>
            <c:forEach var="ruta" items="${listarutas}">
                <tr>
                    <td><c:out value="${ruta.idruta}"></c:out> </td> 
                    <td><c:out value="${ruta.origen}"></c:out></td> 
                    <td><c:out value="${ruta.destino}"></c:out></td>
                    <td align="center"><c:out value="${ruta.fecha}"></c:out></td>
                    <td align="center"><c:out value="${ruta.hora}"></c:out></td>
                    <td align="center"><c:out value="${ruta.puestoslibres}"></c:out></td> 
                    <td align="center"><c:out value="${ruta.precio}"></c:out></td>
                    <td><a href="RutasController?opcion=reservar&idruta=${ruta.idruta}&nivel=${nivel}"> ¡¡¡ RESERVA AHORA !!! </a></td>    
                </tr>
            </c:forEach>
        </table>
        
        
             <%
                if (request.getParameter("cerrar")!=null){
                session.invalidate();
                response.sendRedirect("index.jsp");
                }else if(request.getAttribute("cerrar")!=null){
                session.invalidate();
                response.sendRedirect("index.jsp");
                 }            
            %>    
    </body>
</html>
