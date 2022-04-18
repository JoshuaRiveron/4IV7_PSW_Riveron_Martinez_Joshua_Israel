<%-- 
    Document   : editaralumno
    Created on : 5/04/2022, 11:34:39 PM
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
        <form method="post" name="editar" action="actualizaralumno.jsp">
            
        <%
        //Aquí ya puedo incorporar java
        Connection con = null;
        Statement set = null;
        ResultSet rs = null;
        
        String username, url, password, driver;
        
        url = "jdbc:mysql://localhost/alumnos";
        username = "root";
        password = "alery050831";
        
        driver = "com.mysql.jdbc.Driver";
        
        try{
            //Conectarnos
            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);
            
            try{
                int id = Integer.parseInt(request.getParameter("id"));
                
                String q = "select * from alumnosbatiz order by boleta asc" + "where boleta ="+id;
                
                set = con.createStatement();
                
                rs = set.executeQuery(q);
                
                while(rs.next()){
                
                %>
                <label>Boleta</label>
                <br>
                <input type="hidden" name="boleta2" value="<%=rs.getString("boleta")%>">
                <br>
                
                <label>Nombre</label>
                <br>
                <input type="text" name="nombre2" value="<%=rs.getString("nombre")%>">
                <br>
                
                <label>Apellido Paterno</label>
                <br>
                <input type="text" name="appat2" value="<%=rs.getString("appat")%>">
                <br>
                
                <label>Apellido Materno</label>
                <br>
                <input type="text" name="apmat2" value="<%=rs.getString("apmat")%>">
                <br>
                
                <label>Telefono</label>
                <br>
                <input type="text" name="tel2" value="<%=rs.getString("tel")%>">
                <br>
                
                <br>
                <input typpe="submit" value="Actualizar Datos">
                <br>
                <input type="reset" value="Borrar datos">
                <%
                }
            }catch(SQLException es){
                
                System.out.println("Error al registrar en la tabla");
                System.out.println(es.getMessage());

                %>
                <h1>NO se puede consultar la tabla</h1>
                <%
            }
        }catch(Exception e){

            System.out.println("Error al conectar la BD");
            System.out.println(e.getMessage());

            %>
            <h1>No se conectó con la BD T_T</h1>
            <%
        }
        %>
            </form>
        <a href="index.html">Regresar a Principal</a>
        <br>
        <a href="registroalumno.jsp">Registrar Alumno</a>
    </body>
</html>