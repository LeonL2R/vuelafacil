package Controlador;

import Modelo.RutaDAO;
import Modelo.Ruta;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author leora
 */
public class RutasController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String opcion=request.getParameter("opcion");
        RutaDAO rutaDAO = new RutaDAO ();                   
        Ruta ruta = new Ruta (); 
            
        if (opcion.equals("index")) { 
            RequestDispatcher resquestDispatcher= request.getRequestDispatcher("index.jsp");
            resquestDispatcher.forward(request, response);   
            //-----------------------Reserva Ahora-------------------------------------
        } else if(opcion.equals("reservar")){
            String idruta=request.getParameter("idruta");
            String nivel=request.getParameter("nivel");
            
            if (nivel.equals("1")){
                RequestDispatcher resquestDispatcher= request.getRequestDispatcher("index.jsp");
                resquestDispatcher.forward(request, response);
            } else {
   
                try {
                    ruta=rutaDAO.obtenervuelo(idruta);
                } catch (SQLException ex) {
                    Logger.getLogger(RutasController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("ruta", ruta);
                RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/reservar.jsp");
                resquestDispatcher.forward(request, response);
            }
            
        } else if (opcion.equals("index2")){
            HttpSession sesion = request.getSession();
            String nivel=sesion.getAttribute("nivel").toString();
            request.setAttribute("nivel", nivel);
            RequestDispatcher resquestDispatcher= request.getRequestDispatcher("index.jsp");
            resquestDispatcher.forward(request, response);
        }     
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String opcion=request.getParameter("opcion");       
        RutaDAO rutaDAO = new RutaDAO ();                   
        Ruta ruta = new Ruta ();                    
          
        //--------------------------------GUARDAR RUTA------------------------------------------------------
        if (opcion.equals("guardar")) {
            
            String idruta=request.getParameter("idruta").toUpperCase();
            String origen=request.getParameter("origen").toUpperCase();
            String destino=request.getParameter("destino").toUpperCase();
            String fechac=request.getParameter("fecha");
            boolean veripuestosc=rutaDAO.IDisnumeric(request.getParameter("puestos"));
            boolean veriprecio=rutaDAO.IDisnumeric(request.getParameter("precio"));
            String horac=request.getParameter("hora");

            if (idruta.isEmpty() || origen.isEmpty()){     
            //-------------------------agregar mensaje------------
            } else if (destino.isEmpty() || fechac.isEmpty()){
            //---------------------agregar mensaje------------
            } else if (veripuestosc==false || veriprecio==false){
            //---------------------agregarmensaje--------------
            } else if (horac.isEmpty()){
                //-----------agregarmensaje--------------------
            } else {
                int puestos=Integer.parseInt(request.getParameter("puestos"));
                int precio=Integer.parseInt(request.getParameter("precio"));
                horac=horac+":00";
                java.sql.Time hora=java.sql.Time.valueOf(horac);
                
                SimpleDateFormat formato= new SimpleDateFormat("MM/dd/yyyy");
                java.util.Date fecha2 = null;
            try {
                fecha2 = formato.parse(fechac);
            } catch (ParseException ex) {
                Logger.getLogger(RutasController.class.getName()).log(Level.SEVERE, null, ex);
            }
                Date fecha=new java.sql.Date (fecha2.getTime());
                
                ruta.setIdruta(idruta);
                ruta.setOrigen(origen);    
                ruta.setDestino(destino);
                ruta.setFecha(fecha);
                ruta.setHora(hora);
                ruta.setPuestos(puestos);
                ruta.setPuestoslibres(puestos);
                ruta.setPrecio(precio);
                try {
                    rutaDAO.guardarruta(ruta);
                    RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/sesionadmin.jsp");
                    resquestDispatcher.forward(request, response);
                } catch (SQLException ex) {
                }
                }
            RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/sesionadmin.jsp");
            resquestDispatcher.forward(request, response);     
    }
        
        //-----------------------------------CONSULTAR RUTAS--------------------------------------------------    
         else if (opcion.equals("consultar")) {            
            List<Ruta> listarutas = new ArrayList<> ();
            String origen=request.getParameter("origen").toUpperCase();
            String destino=request.getParameter("destino").toUpperCase();
            try {
                listarutas=rutaDAO.consultarrutas(origen, destino);    //Consulta de datos 
                request.setAttribute("consulta", "1");
                request.setAttribute("listarutas", listarutas);        // enviar parametros a la vista
                RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/index.jsp");
                resquestDispatcher.forward(request, response);
            } catch (SQLException ex) { 
                }
            }            
        }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

