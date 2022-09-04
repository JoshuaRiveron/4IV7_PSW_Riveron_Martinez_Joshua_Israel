/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Alumno
 */
public class Conexion {
    
    public static Connection getConection() throws ClassNotFoundException{
        try{
            String url, user, pass;
            Class.forName("com.mysql.jbdc.Driver");            
            
            url = "jdbc:mysql://localhost/maquinasbatiz";
            user = "root";
            pass = "n0m3l0";
            
            return DriverManager.getConnection(url, user, pass);
            
        }catch(SQLException eq){
            System.out.println("Error al conectar con BD");
            System.out.println(eq.getMessage());
        }catch(Exception ex){
            System.out.println("Error al no enontrar la clase");
            System.out.println(ex.getMessage());
        }
        return ;
    }  
}
