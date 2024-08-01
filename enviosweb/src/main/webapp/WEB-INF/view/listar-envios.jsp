<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
        <h1> Envios </h1>
        
        <button onclick="window.location.href='/enviosweb/envios/findOne?opcion=1';return false ;">
         Agregar
        </button>
        
        <table>
           <thead>
                <tr>
                    <th> idEnvios</th>
                    <th> fechaEnvio</th>
                    <th> idPedido</th>
                    <th> idSucursalOrigen</th>
                    <th> idSucursalDestino</th>
               
               </tr>
        </thead>
        <tbody>
           <c:forEach var="item" items="${envios}">
                <tr> 
                    <td> ${item.idEnvios}</td>
                    <td> ${item.fechaEnvio}</td>
                    <td> ${item.idPedido}</td>
                    <td> ${item.idSucursalOrigen}</td>
                    <td> ${item.idSucursalDestino}</td>
                    <td> 
                          <button onclick="window.location.href='/enviosweb/envios/findOne?idEnvios=${item.idEnvios}&opcion=1';return false">
                          Actualizar
                          </button>
                          <button onclick="window.location.href='/enviosweb/envios/findOne?idEnvios=${item.idEnvios}&opcion=2';return false">
                          Eliminar
                          </button>             
                    </td>
               
               </tr>
            </c:forEach>
          </tbody>
        </table>

</body>
</html>