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
        <script src="js/jquery-3.6.0.min.js"></script>   
        <link rel="stylesheet" href="css/style.css"> 
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min2.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css">
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script> 
        <script type="text/javascript" src="js/dataTables.bootstrap5.min.js"></script>
        <script type="text/javascript">
            $(document).ready( function () {
                $("#cerrar").hide();
                $("#datos").hide();
                $("#rutas").hide();
                    
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
                
                $("#consulta").DataTable({
                "lengthChange": false,
                "searching": false,
                language: {
                    "zeroRecords": "No se encontraron resultados",
                    "emptyTable": "Ningún dato disponible en esta tabla",
                    "infoEmpty": "Mostrando 0 de 0 registros",
                    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sInfo" :  "Mostrando _START_ a _END_ de _TOTAL_ registros",
                    "paginate": {
                        "first": "Primero",
                        "last": "Último",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    }                    
                }
            });
        });
        </script> <!----Tabla dinamica---->
    </head>
    <body>
        <div class="encabezado">
            <a href="RutasController?opcion=index"><img src="img/icono.png" style="width: 100px; height: 100px;" href="RutasController?opcion=index"/> </a>
            <td> <h1><a style="text-decoration:none; " href="RutasController?opcion=index" class="text-white"> Colombia's Airplanes! </a> </h1> </td> 
        </div>
        <div align="right" class="opciones">
            <td><a href="/vuelafacil/UsuariosController?opcion=sesionadmin" id="rutas" class="sesion"> Creacion de rutas</a></td>
            <td><a href="/vuelafacil/UsuariosController?opcion=datosusuario" id="datos" class="sesion">Mis datos personales</a></td>
            <td><a href="UsuariosController?opcion=iniciarsesion" id="iniciar" class="sesion"> Iniciar sesion </a> </td>
            <td><a href="/vuelafacil/index.jsp?cerrar=true" id="cerrar" class="sesion"> Cerrar sesion </a> </td>            
        </div>
        <section class="form-index">
            <form action="RutasController" method="post"> 
                <input type="hidden" name="opcion" value="consultar">
                <table class="busqueda"> 
                    <tr>
                        <td class="label-busqueda">Origen:</td>
                        <td><input type="text" name="origen" class="controlbusqueda"/></td>
                        <td class="label-busqueda">Destino:</td>
                        <td><input type="text" name="destino" class="controlbusqueda"/></td>
                        <td> <input type="submit" value="Consultar Vuelos" id="mostrar" class="boton-busqueda"/> </td>
                    </tr>
                </table>
            </form>
            <table border="1" id="consulta" class="resultados">
                <thead>
                    <tr>
                        <td align="center" class="label-resultados">IDRUTA </td> 
                        <td align="center" class="label-resultados">ORIGEN </td> 
                        <td align="center" class="label-resultados">DESTINO </td>
                        <td align="center" class="label-resultados">FECHA </td> 
                        <td align="center" class="label-resultados">HORA </td>
                        <td align="center" class="label-resultados">PUESTOS</td> 
                        <td align="center" class="label-resultados">PRECIO </td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ruta" items="${listarutas}">
                        <tr>
                            <td><c:out value="${ruta.idruta}"></c:out> </td> 
                            <td><c:out value="${ruta.origen}"></c:out></td> 
                            <td><c:out value="${ruta.destino}"></c:out></td>
                            <td align="center"><c:out value="${ruta.fecha}"></c:out></td>
                            <td align="center"><c:out value="${ruta.hora}"></c:out></td>
                            <td align="center"><c:out value="${ruta.puestoslibres} libres"></c:out></td> 
                            <td align="center"><c:out value="${ruta.precio}"></c:out></td>
                            <td><a href="RutasController?opcion=reservar&idruta=${ruta.idruta}&nivel=${nivel}" class="reservarahora">¡¡¡ RESERVA AHORA !!!</a></td>    
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
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
