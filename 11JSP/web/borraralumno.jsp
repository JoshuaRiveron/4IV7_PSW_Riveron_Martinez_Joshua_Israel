<%-- 
    Document   : borraralumno
    Created on : 5/04/2022, 03:39:00 AM
    Author     : aly
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        //aqui tya puedo incorporar java
        Connection con= null;
        Statement set=null;
        ResultSet rs= null;
        
        String username, url, password, driver;
        
        url = "jdbc:mysql://localhost/alumnos";
        username= "root";
        password= "alery050831";
        
        driver="com.mysql.jdbc.Driver";
        
        try{
        //conectamos
            Class.forName(driver);
            con= DriverManager.getConnection(url, username, password);
        
            try{
                int id= Integer.parseInt(request.getParameter("id"));
                String q= "delete drom alumnobatiz where boleta = "+id;
                set = con.createStatement();
                int borrar= set.executeUpdate(q);
                %>
                 <h1>alumno eliminado</h1>
                 <% 
                     
                
                 
                }catch(SQLException es){
                System.out.println("Error al registrar la tabla");
                System.out.println(es.getMessage());
                %>
                <h1>No se pudo eliminar de la tabla</h1>
                <%
            }
        }catch(Exception e){
            System.out.println("Error al conectar la BD");
            System.out.println(e.getMessage());
            %>
            <h1>No conecto con la BD T_T</h1>
            <%
             
       }
        
    %>
        <h1>Hello World!</h1>
    </body>
</html>

