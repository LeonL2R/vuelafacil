package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

/**
 *
 * @author leora
 */
public class RutaDAO {
    
    private Connection connection;
    private PreparedStatement ps;
    private boolean estadoOp;
        
    public boolean guardarruta (Ruta ruta) throws SQLException {
        estadoOp=false;
        connection=obtenerConexion();
        
        try {
            connection.setAutoCommit(false);
            String sql="INSERT INTO rutas (Idruta, Origen, Destino, Fecha, Hora, Puestos, Puestoslibres, Precio) VALUES (?,?,?,?,?,?,?,?)";
            ps=connection.prepareStatement(sql);
        
            ps.setString(1, ruta.getIdruta());
            ps.setString(2, ruta.getOrigen());
            ps.setString(3, ruta.getDestino());
            ps.setDate(4, ruta.getFecha()); 
            ps.setTime(5, ruta.getHora()); 
            ps.setInt(6, ruta.getPuestos());
            ps.setInt(7, ruta.getPuestoslibres());
            ps.setInt(8, ruta.getPrecio());
            
        
            estadoOp=ps.executeUpdate()>0;
        
            connection.commit();
            ps.close();
            connection.close();
            
        } catch (SQLException e) {
            connection.rollback();
        }
        return false;    
    }
    
    public List<Ruta> consultarrutas (String origen, String destino) throws SQLException {       
        List<Ruta> listarutas = new ArrayList<>();
        ResultSet rs=null;
        String sql=null;
        connection = obtenerConexion();
        
        //-----------------------------BUSCAR TODAS LAS RUTAS--------------------------------------
        if (origen=="" && destino=="") {
            try {
                sql= "SELECT * FROM rutas";
                ps=connection.prepareStatement(sql);
                rs = ps.executeQuery(sql);
                while (rs.next()) {
                    Ruta rutaconsulta = new Ruta (); 
                    rutaconsulta.setIdruta(rs.getString(1));
                    rutaconsulta.setOrigen(rs.getString(2));
                    rutaconsulta.setDestino(rs.getString(3));
                    rutaconsulta.setFecha(rs.getDate(4));
                    rutaconsulta.setHora(rs.getTime(5));
                    rutaconsulta.setPuestoslibres(rs.getInt(7));
                    rutaconsulta.setPrecio(rs.getInt(8));
                    listarutas.add (rutaconsulta);        
                }
            } catch (SQLException e) {
                }
            //------------------------BUSCAR RUTAS POR ORIGEN-----------------------------------------
            }  else if (origen!="" && destino=="") {
                try {
                    sql = "SELECT * FROM rutas WHERE Origen =?";
                    ps=connection.prepareStatement(sql);
                    ps.setString(1, origen);
                    rs = ps.executeQuery(); 
                    while(rs.next()) {
                        Ruta rutac= new Ruta ();
                        rutac.setIdruta(rs.getString(1));
                        rutac.setOrigen(rs.getString(2));
                        rutac.setDestino(rs.getString(3));
                        rutac.setFecha(rs.getDate(4));
                        rutac.setHora(rs.getTime(5));
                        rutac.setPuestoslibres(rs.getInt(7));
                        rutac.setPrecio(rs.getInt(8));
                        listarutas.add(rutac);
                        }
                    } catch (SQLException e) {
                        }
                
                //---------------------BUSCAR RUTAS POR DESTINO------------------------------------------
                } else if (destino!="") {
                    try {
                        sql = "SELECT * FROM rutas WHERE Destino =?";
                        ps=connection.prepareStatement(sql);                   
                        ps.setString(1, destino);                   
                        rs = ps.executeQuery();                     
                        while(rs.next()) {                        
                            Ruta rutac= new Ruta ();                        
                            rutac.setIdruta(rs.getString(1));
                            rutac.setOrigen(rs.getString(2));                        
                            rutac.setDestino(rs.getString(3));
                            rutac.setFecha(rs.getDate(4));
                            rutac.setHora(rs.getTime(5));
                            rutac.setPuestoslibres(rs.getInt(7));
                            rutac.setPrecio(rs.getInt(8));
                            listarutas.add(rutac);
                            }
                        } catch (SQLException e) {
                            }
                    //---------------------BUSCAR RUTAS POR DESTINO Y ORIGEN------------------------------
                    if (origen!=""){
                        List<Ruta> listarutas2 = new ArrayList<>();
                        for (int i=0;i<listarutas.size();i++){
                            String origenfiltro=listarutas.get(i).getOrigen();
                            Ruta rutaco = new Ruta ();
                            if (origen.equals(origenfiltro) ){
                                rutaco.setIdruta(listarutas.get(i).getIdruta());
                                rutaco.setOrigen(listarutas.get(i).getOrigen());
                                rutaco.setDestino(listarutas.get(i).getDestino());
                                rutaco.setFecha(listarutas.get(i).getFecha());
                                rutaco.setHora(listarutas.get(i).getHora());
                                rutaco.setPuestoslibres(listarutas.get(i).getPuestos());
                                rutaco.setPrecio(listarutas.get(i).getPrecio());
                                listarutas2.add(rutaco);
                            }
                        } 
                        listarutas=listarutas2;  
                    }
                    }          
        return listarutas;
    }
    
    public Ruta obtenervuelo(String idruta) throws SQLException {
        ResultSet rs = null;
	Ruta ruta=new Ruta();
	connection = obtenerConexion();
        
        try {
            String sql = "SELECT * FROM rutas WHERE Idruta ='"+idruta+"'";
	    ps=connection.prepareStatement(sql);
	    rs = ps.executeQuery();
	    if(rs.next()) {
                ruta.setIdruta(rs.getString(1));
		ruta.setOrigen(rs.getString(2));
		ruta.setDestino(rs.getString(3));
		ruta.setFecha(rs.getDate(4));
		ruta.setHora(rs.getTime(5));
                ruta.setPrecio(rs.getInt(8));
                }
            } catch (SQLException e) {
                }
        return ruta;
        }  
    
    public boolean IDisnumeric (String ID) {
        boolean verificacion;
        try {
            Integer.parseInt(ID);
            verificacion = true;          
        } catch (NumberFormatException e) {
            verificacion=false;
        }
        return verificacion;
    }    
    
    
    private Connection obtenerConexion () throws SQLException {
        return Conexion.getConnection();    
    }
    
}
