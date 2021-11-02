package config;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;


/**
 *
 * @author leora
 */
public class Conexion {
    private static BasicDataSource dataSource=null;
    
    private static DataSource getDataSource () {
        if (dataSource==null) {
            dataSource = new BasicDataSource ();
            dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
            dataSource.setUsername("root");
            dataSource.setPassword("2045");
            dataSource.setUrl("jdbc:mysql://localhost:3306/vuelafacil");
            dataSource.setInitialSize(20);
            dataSource.setMaxIdle(15);
            dataSource.setMaxActive(20);
            dataSource.setMaxWait(5000);          
        }
        return dataSource;
    }
    
    public static Connection getConnection () throws SQLException{
        return getDataSource().getConnection();   
    }
    
}
