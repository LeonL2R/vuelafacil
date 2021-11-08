package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.sql.SQLException;
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
public class UsuariosController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
            
        String opcion=request.getParameter("opcion");
        
        //---------------------------------Redireccionamiento Incio sesión---------------------------
        if (opcion.equals("iniciarsesion")) {   
            RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/iniciosesion.jsp");
            resquestDispatcher.forward(request, response); 
            //----------------------------Redireccionameiento Crear Usuario---------------------------            
        } else if (opcion.equals("crearusuario")){
            RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/crearusuario.jsp");
            resquestDispatcher.forward(request, response);
        } else if (opcion.equals("sesionadmin")) {
            RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/sesionadmin.jsp");
            resquestDispatcher.forward(request, response);
        } else if (opcion.equals("datosusuario")){
            //---------------------------Redirecionamiento mi datoas Personales------------------------------
            Usuario usuario = new Usuario ();
            UsuarioDAO usuarioDAO = new UsuarioDAO ();         
            HttpSession sesion = request.getSession();  
            String idusuario=sesion.getAttribute("idusuario").toString();
            try { 
                usuario=usuarioDAO.buscarusuario(idusuario);
                request.setAttribute("usuario", usuario);
                RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/datosusuario.jsp");
                resquestDispatcher.forward(request, response);
            } catch (SQLException ex) {
            }
        }
    }
        

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);      
        
        String opcion=request.getParameter("opcion");       
        UsuarioDAO usuarioDAO = new UsuarioDAO ();         
        Usuario usuario = new Usuario ();                   
          
        
        switch (opcion) {
//--------------------------------CREAR USUARIO------------------------------------------------------        
            case "crearusuario":
                {
                    String contrasena = request.getParameter("contrasena");
                    String contrasenacon = request.getParameter("contrasenacon");
                    String idusuario = request.getParameter("idusuario");
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    String telefono = request.getParameter("telefono");
                    String email=request.getParameter("email");
                    String claveadmin=request.getParameter("claveadmin");
                    String nivel="2";
                    
                    if (claveadmin.equals("2045")){
                        nivel="1";                    
                    } 
                    
                    if (idusuario.isEmpty() || nombre.isEmpty()){
                        //--------------agregar mensaje----------------------
                    }else if (apellido.isEmpty() || telefono.isEmpty()){
                        //--------------agregar mensaje-----------------
                    }else if (contrasena.isEmpty() || !contrasena.equals(contrasenacon)){
                        //--------------agregar mensaje-----------------
                    }else if(email.isEmpty()) {
                      //--------------agregar mensaje-------------------------
                    }else if (contrasena.equals(contrasenacon)) {
                        usuario.setIdusuario(idusuario);
                        usuario.setNombre(nombre);
                        usuario.setApellido(apellido);
                        usuario.setTelefono(telefono);
                        usuario.setEmail(email);
                        usuario.setContrasena(contrasena);
                        usuario.setNivel(nivel);
                        try {
                            usuarioDAO.crearusuario(usuario);
                        } catch (SQLException ex) {
                        }
                    }       
                    RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/crearusuario.jsp");
                    resquestDispatcher.forward(request, response);
                    break;
                }
//--------------------------------INICIAR SESION----------------------------------------------------         
            case "iniciarsesion":
                {
                    String idusuario=request.getParameter("idusuario");
                    String contrasena=request.getParameter("contrasena");
                    if (idusuario.isEmpty() || contrasena.isEmpty()){
                        RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/iniciosesion.jsp");
                        resquestDispatcher.forward(request, response);
                    } else {
                        try {
                            usuario=usuarioDAO.buscarusuario(idusuario);
                            String nivel=usuario.getNivel();
                            if (contrasena.equals(usuario.getContrasena())){
                                request.setAttribute("idusuario", idusuario);
                                request.setAttribute("nombre", usuario.getNombre());
                                request.setAttribute("apellido", usuario.getApellido());
                                request.setAttribute("telefono", usuario.getTelefono());
                                request.setAttribute("email", usuario.getEmail());
                                request.setAttribute("nivel", nivel);
                                HttpSession sesion = request.getSession();
                                sesion.setAttribute("nivel", nivel); 
                                RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/iniciosesion.jsp");
                                resquestDispatcher.forward(request, response);
                            }
                            else {
                                RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/iniciosesion.jsp");
                                resquestDispatcher.forward(request, response);
                            }
                        } catch (SQLException ex) {
                        }
                    }
                    break;
                }
//--------------------------------Actualizar datos-----------------------------------------------                
            case "actualizardatos":  
                {
                    HttpSession sesion = request.getSession();
                    String idusuario=sesion.getAttribute("idusuario").toString();
                    String nivel=sesion.getAttribute("nivel").toString();
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    String telefono = request.getParameter("telefono");
                    String email = request.getParameter("email");
                    
                    usuario.setIdusuario(idusuario);
                    usuario.setNombre(nombre);
                    usuario.setApellido(apellido);
                    usuario.setTelefono(telefono);
                    usuario.setEmail(email);
                    usuario.setContrasena("contrasena");
                    usuario.setNivel(nivel);
                    
                    if (nombre.isEmpty() || apellido.isEmpty()){
                    //---------agregar mensaje------------------
                    }else if (telefono.isEmpty() || email.isEmpty()){
                        //----------agregar mensaje------------
                    } else { 
                        try {
                            usuarioDAO.actualizarusuario(usuario);
                            request.setAttribute("usuario", usuario);
                            sesion.setAttribute("nombre", usuario.getNombre());
                            sesion.setAttribute("apellido", usuario.getApellido());
                            sesion.setAttribute("telefono", usuario.getTelefono());
                            sesion.setAttribute("email", usuario.getEmail());
                        } catch (SQLException ex) {
                        }
                    }
                    RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/datosusuario.jsp");
                    resquestDispatcher.forward(request, response);
                break;
                }
//----------------------------Actualizar contraseña--------------------------------------------                  
            case "actualizarcontrasena":
                {
                    HttpSession sesion = request.getSession();
                    String idusuario=sesion.getAttribute("idusuario").toString();
                    String nombre=sesion.getAttribute("nombre").toString();
                    String apellido=sesion.getAttribute("apellido").toString();
                    String telefono=sesion.getAttribute("telefono").toString();
                    String email=sesion.getAttribute("email").toString();
                    String nivel=sesion.getAttribute("nivel").toString();
                    String contrasena=request.getParameter("contrasena");
                    String contrasenacon=request.getParameter("contrasenacon");
                    usuario.setIdusuario(idusuario);
                    usuario.setNombre(nombre);
                    usuario.setApellido(apellido);
                    usuario.setTelefono(telefono);
                    usuario.setEmail(email);
                    usuario.setContrasena(contrasena);
                    usuario.setNivel(nivel);
                    if (contrasena.isEmpty() || contrasenacon.isEmpty()){
                        request.setAttribute("usuario", usuario);  
                        RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/datosusuario.jsp");
                        resquestDispatcher.forward(request, response);
                    } else if (contrasena.equals(contrasenacon)){    
                        try {
                            usuarioDAO.actualizarcontrasena(usuario);
                            sesion.setAttribute("contrasena", contrasena);
                            request.setAttribute("usuario", usuario);  
                            RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/datosusuario.jsp");
                            resquestDispatcher.forward(request, response);
                        } catch (SQLException ex) {
                            Logger.getLogger(UsuariosController.class.getName()).log(Level.SEVERE, null, ex);
                        }                         
                    } else {
                        request.setAttribute("usuario", usuario);  
                        RequestDispatcher resquestDispatcher= request.getRequestDispatcher("/vistas/datosusuario.jsp");
                        resquestDispatcher.forward(request, response);
                    }             
                    break;
                }
                
            case "eliminarcuenta": 
            {  
                HttpSession sesion=request.getSession();
                String idusuario=sesion.getAttribute("idusuario").toString();
                
            try {
                usuarioDAO.eliminarusuario(idusuario);
            } catch (SQLException ex) {
                Logger.getLogger(UsuariosController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("cerrar", true); 
            RequestDispatcher resquestDispatcher= request.getRequestDispatcher("index.jsp");
            resquestDispatcher.forward(request, response);
                break;
            }    
            default:
                break;
        }
            }       
        
       
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}


