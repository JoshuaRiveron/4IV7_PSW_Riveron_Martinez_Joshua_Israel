<%-- 
    Document   : actualizaralumno
    Created on : 6/04/2022, 12:41:35 AM
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
                String nom, appat, apmat, tel;
                int bol;
                        
                 nom= request.getParameter("nombre2");
                 appat= request.getParameter("appat2");
                 apmat= request.getParameter("apmat2");
                 tel= request.getParameter("tel2");
                 bol= Integer.parseInt(request.getParameter("boleta2"));
                 
                 set= con.createStatement();
                 
                 String q= "update alumnobatiz set nombre='"+nom+"', "
                 + "appat= '"+appat+"', apmat='"+apmat+"', "
                 + "telefono='"+tel+"' "
                 + "where boleta="+bol+" ";
                   
                 
                 int registro= set.executeUpdate(q);
                 
                 %>
                 <h1>Registro exitoso</h1>
                 <% 
                     
                
                 
                }catch(SQLException es){
                System.out.println("Error al registrar la tabla");
                System.out.println(es.getMessage());
                %>
                <h1>No se pudo actualizar en la tabla</h1>
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
