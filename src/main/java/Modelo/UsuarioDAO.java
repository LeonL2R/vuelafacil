package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author leora
 */
public class UsuarioDAO {
    
    private Connection connection;
    private PreparedStatement ps;
    private boolean estadoOp;
        
    public boolean crearusuario (Usuario usuario) throws SQLException {
        estadoOp=false;
        connection=obtenerConexion();
        
        try {
            connection.setAutoCommit(false);
            String sql="INSERT INTO usuarios (Idusuario, Nombre, Apellido, Telefono, Contrasena, Nivel) VALUES (?,?,?,?,?,?)";
            ps=connection.prepareStatement(sql);
        
            ps.setString(1, usuario.getIdusuario());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getApellido());
            ps.setString(4, usuario.getTelefono());
            ps.setString(5, usuario.getContrasena());
            ps.setString(6, usuario.getNivel());
        
            estadoOp=ps.executeUpdate()>0;
        
            connection.commit();
            ps.close();
            connection.close();
            
        } catch (SQLException e) {
            connection.rollback();
        }
        return false;    
    }
    
    public Usuario buscarusuario(String idusuario) throws SQLException {
        ResultSet rs = null;
	Usuario usuario=new Usuario();
	connection = obtenerConexion();
        
        try {
            String sql = "SELECT * FROM usuarios WHERE Idusuario ='"+idusuario+"'";
	    ps=connection.prepareStatement(sql);
	    rs = ps.executeQuery();
	    if(rs.next()) {
                usuario.setIdusuario(rs.getString(1));
		usuario.setNombre(rs.getString(2));
		usuario.setApellido(rs.getString(3));
		usuario.setTelefono(rs.getString(4));
		usuario.setContrasena(rs.getString(5));
                usuario.setNivel(rs.getString(6));
                }
            } catch (SQLException e) {
                }
        return usuario;
        }
    
    public boolean actualizarusuario(Usuario usuario) throws SQLException {
	estadoOp = false;
	connection = obtenerConexion();
	try {
		connection.setAutoCommit(false);
		String sql = "UPDATE usuarios SET Nombre=?, Apellido=?, Telefono=? WHERE Idusuario=?";
		ps = connection.prepareStatement(sql);
                
		ps.setString(1, usuario.getNombre());
                ps.setString(2, usuario.getApellido());
                ps.setString(3, usuario.getTelefono());
                ps.setString(4, usuario.getIdusuario()); 


		estadoOp = ps.executeUpdate() > 0;
		connection.commit();
		ps.close();
		connection.close();
	} catch (SQLException e) {
	}
	return estadoOp;
}    
    
    public boolean actualizarcontrasena(Usuario usuario) throws SQLException {
	estadoOp = false;
	connection = obtenerConexion();
	try {
		connection.setAutoCommit(false);
		String sql = "UPDATE usuarios SET Contrasena=? WHERE Idusuario=?";
		ps = connection.prepareStatement(sql);
                
		ps.setString(1, usuario.getContrasena());
                ps.setString(2, usuario.getIdusuario()); 

		estadoOp = ps.executeUpdate() > 0;
		connection.commit();
		ps.close();
		connection.close();
	} catch (SQLException e) {
	}
	return estadoOp;
}    
    
    public boolean eliminarusuario(String idusuario) throws SQLException {
        estadoOp = false;
	connection = obtenerConexion();
	try {
            connection.setAutoCommit(false);
	    String sql = "DELETE FROM usuarios WHERE Idusuario=?";
	    ps = connection.prepareStatement(sql);
	    ps.setString(1, idusuario);
	    estadoOp = ps.executeUpdate() > 0;
	    connection.commit();
	    ps.close();
	    connection.close();      
            } catch (SQLException e) {
                }
	return estadoOp;
	}

    private Connection obtenerConexion () throws SQLException {
        return Conexion.getConnection();    
    }
    
}
