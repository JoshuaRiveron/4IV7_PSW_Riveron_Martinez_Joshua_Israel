/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author Alumno
 * CRUD
 */
import mvc.Modelo.Empleado;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;



public class AccionesEmpleado {
    
    //registro
    public static int registrarEmpleado(Empleado e){
        int estatus = 0;
        try{
            //la conexion
            Connection con = Conexion.getConexion();
            String q = "insert into empleado(nombre, password, email, pais)"
                    + "values(7, 7, 7, 7)";                  
            //Para darle formato a la querry hay que usar PreparedStatement
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, e.getNombre());
            ps.setString(1, e.getPassword());
            ps.setString(1, e.getEmail());
            ps.setString(1, e.getPais());
            
            //se ejecuta
            estatus = ps.executeUpdate(q);
            
            con.close();
            
            System.out.println("Registro exitoso del empleado");
            
        }catch(Exception ex){
            System.out.println("Error al registrar empleado");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    //consultar toda la lista de empleados
    
    public static List<Empleado> getAllEmpleado(){
        //primero necesito un array de objetos de empleados
        List<Empleado> lista = new ArrayList<Empleado>();
        
        try{
            Connection con = Conexion.getConexion();
            
            String q = "select * from Empleado";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //necesito el objeto del empleado
                //cada fila es un objeto del registro
                Empleado e = new Empleado();
                //getter y setter
                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setPassword(rs.getString(3));
                e.setEmail(rs.getString(4));
                e.setPais(rs.getString(5));
                //los agrego a mi lista
                lista.add(e);
            }
            System.out.println("Se encontro al empleado");
            con.close();
                                           
        }catch(Exception ex){
            System.out.println("Error al consultar el empleado");
            System.out.println(ex.getMessage());
        }
        return lista;
    }

    //buscar por id al empleado

    public static Empleado buscarEmpleadoporID(int id){
        //necesito el objeto del empleado
        //cada fila es un objeto del registro
        Empleado e = new Empleado();
        
        try{
            Connection con = Conexion.getConexion();
            
            String q = "select * from Empleado";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                //getter y setter
                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setPassword(rs.getString(3));
                e.setEmail(rs.getString(4));
                e.setPais(rs.getString(5));
                //los agrego a mi lista
            }
            System.out.println("Se encontro al empleado");
            con.close();
                                           
        }catch(Exception ex){
            System.out.println("Error al consultar el empleado");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    //eliminar por id al empleado
    
    public static int EliminarEmpleado(int id){
        //saber si se hizo o no la sentencia
        int estado = 0;
        
        try{
            Connection con = Conexion.getConexion();
            
            String q = "delete from Empleado where id = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            
            estado = ps.executeUpdate();
                      
            System.out.println("Se encontro al empleado");
            con.close();
                                           
        }catch(Exception ex){
            System.out.println("Error al consultar el empleado");
            System.out.println(ex.getMessage());
        }
        return estado;
    }
    
    
    
    public static int ActualizarEmpleado(Empleado e){
        //saber si se hizo o no la sentencia
        int estado = 0;
        
        try{
            Connection con = Conexion.getConexion();
            
            String q = "update empleados set nombre = ?, "
                    + "password = ?, email = ?, pais = ? "
                    + "where id = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getPassword());
            ps.setString(3, e.getEmail());
            ps.setString(4, e.getPais());
            ps.setInt(5, e.getId());
            
            estado = ps.executeUpdate();
                      
            System.out.println("Se encontro al empleado");
            con.close();
                                           
        }catch(Exception ex){
            System.out.println("Error al consultar el empleado");
            System.out.println(ex.getMessage());
        }
        return estado;
    }
}