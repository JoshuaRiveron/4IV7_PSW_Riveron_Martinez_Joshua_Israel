<%-- 
    Document   : registrarEmpleado
    Created on : 3/05/2022, 08:11:14 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bienvenido al registro de empleados</h1>
        <br>
        <form name="registro" method="post" action="guardarEmpleado">
        <table border="2">
            <tr>
                <td>Nombre</td>
                <td><input type="text" name="nombre"></td>               
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="email"></td>
            </tr>
            <tr>
                <td>Pais</td>
                <td><select name="pais">
                        <option>Mexico</option>
                        <option>India</option>
                        <option>Al que nadie quiere</option>
                        <option>Por ahí</option>
                    </select></td>                   
            </tr>
            <tr>
                <td colspan="2"><input type="submit"
                   value="Registrar Nuevo Empleado"></td>
            </tr>
        </table>
        </form>
        <br>
        <a href="index.html">Regresar a la Pagina Principal</a>
        <br>
        <a href="ConsultarEmpleados">Consultar la lista de empleados</a>
    </body>
</html>
