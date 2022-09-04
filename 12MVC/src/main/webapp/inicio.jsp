<%-- 
    Document   : inicio
    Created on : 9/05/2022, 03:57:52 PM
    Author     : Alumno
--%>

<%@page import="java.util.List"%>
<%@page import="mvc.Modelo.Empleado"%>
<%@page import="Controlador.AccionesEmpleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="listageneral">
            <br>
            <table border="2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Pais</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        //tenemos que obtener la lsta de los empleados
                        List<Empleado> lista = AccionesEmpleado.getAllEmpleado();
                        for(Empleado e : lista){
                        %>
                        <tr>
                            <td> <%=e.getId()%> </td>
                            <td> <%=e.getNombre()%> </td>
                            <td> <%=e.getPassword()%> </td>
                            <td> <%=e.getEmail()%> </td>
                            <td> <%=e.getPais()%> </td>
                            <td> <a href="editarempleado.jsp?id=<%=e.getId()%>">ICONOEditar</a></td>
                            <td> <a href="eliminarempleado?id=<%=e.getId()%>">ICONOEliminar</a></td>
                        </tr>
                        }
                        
                </tbody>
            </table>
        </div>
    </body>
</html>
