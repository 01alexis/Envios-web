<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Envios </h1>

         <form action="del" method="get">
         
               <input type="hidden" id="idEnvios" name="idEnvios" value="${envios.idEnvios}" />
               
               <strong>¿Desea Eliminar el dato?</strong>
               <br/>
               <button type="submit">Guardar</button>
               
               <button onclick="window.location.href='/enviosweb/envios/findAll';return false ;">
               Cancelar
               </button>
         </form>
        
</body>
</html>