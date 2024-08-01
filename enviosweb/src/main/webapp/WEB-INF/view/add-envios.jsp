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

         <form action="add" method="post">
         
               <input type="hidden" id="idenvios" name="idenvios" value="${envios.idEnvios}" />
               FechaEnvio
               <input type="Date" id="fechaEnvio" name="fechaEnvio" value="${envios.fechaEnvio}" />
               <br/>
               idPedido
               <input type="hidden" id="idPedido" name="idPedido" value="${envios.idPedido}" />
               <br/>
               idSucursalorigen
               <input type="hidden" id="idSucursalOrigen" name="idSucursalOrigen" value="${envios.idSucursalOrigen}" />
               <br/>
               IdSucursalDestino
               <input type="hidden" id="idSucursalDestino" name="idSucursalDestino" value="${cliente.idSucursalDestino}" />
               <br/>
               <button type="submit">Guardar</button>
               
               <button onclick="window.location.href='/enviosweb/envios/findAll';return false ;">
               Cancelar
               </button>
       
         </form>

</body>
</html>

