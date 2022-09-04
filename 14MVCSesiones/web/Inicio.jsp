<%-- 
    Document   : Inicio
    Created on : 16/05/2022, 04:30:14 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String usuario = "";
    //creamos una sesion para verificar que exista en a bd
    HttpSession sesionusu = request.getSession();
    
    //obtenemos el atributo de la sesion que viene del servlet
    if(sesionusu.getAttribute("usuario")==null){
        //cuando no existe el usuario
        
    
    %>
    <jsp:forward page="index.html">
        <jsp:param name="error" value="Es obligatorio iniciar sesion"/>
    </jsp:forward>
    
    <%
        }else{
            //si hay una sesion
            usuario = (String)sesionusu.getAttribute("usuario");
        }
        %>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        encabezado
        
        menu
        
        <h1>Si existes T_T</h1>
        
        <%
            //obtener los privilegios == 1
            
            /*
            Aqui
            */

            %>
        
        patitas
        
    </body>
</html>
