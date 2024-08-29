<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Envios</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Georgia', serif;
        }
        h1 {
            text-align: center;
            color: #007bff;
            margin-top: 20px;
            animation: fadeIn 1s;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        button {
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }
        button:hover {
            transform: scale(1.05);
        }
        .btn-agregar {
            background-color: #007bff;
            color: white;
        }
        .btn-agregar:hover {
            background-color: #0056b3;
        }
        .btn-cancelar {
            background-color: #dc3545; /* Rojo para cancelar */
            color: white;
        }
        .btn-cancelar:hover {
            background-color: #c82333;
        }
        .btn-actualizar {
            background-color: #28a745; /* Verde para actualizar */
            color: white;
        }
        .btn-actualizar:hover {
            background-color: #218838;
        }
        .btn-eliminar {
            background-color: #dc3545; /* Rojo para eliminar */
            color: white;
        }
        .btn-eliminar:hover {
            background-color: #c82333;
        }
        .table-container {
            width: 80%;
            margin: 20px auto;
            max-height: 705px; /* Altura máxima ajustada al 90% de 784px */
            overflow-y: auto;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            opacity: 0;
            transform: translateY(20px);
            animation: scrollIn 0.5s forwards;
        }
        @keyframes scrollIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        th {
            background-color: #007bff;
            color: white;
            padding: 10px;
            position: sticky;
            top: 0;
            z-index: 10;
        }
        td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .highlight {
            background-color: #d4edda;
        }
        .search-container {
            text-align: center;
            margin-bottom: 20px;
        }
        .no-results {
            color: red;
            text-align: center;
            margin-top: 20px;
            display: none;
        }
    </style>
</head>
<body>
    <h1>Envios</h1>
    
    <!-- Contenedor de búsqueda -->
    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Buscar por ID o fecha" oninput="performSearch()">
        <button class="btn-cancelar" onclick="cancelSearch()">
            <i class="fa-solid fa-times"></i> Cancelar
        </button>
    </div>
    
    <div style="text-align: center;">
        <button class="btn-agregar" onclick="window.location.href='/enviosweb/envios/findOne?opcion=1'; return false;">
            <i class="fa-solid fa-plus"></i> Agregar
        </button>
    </div>
    
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>idEnvios</th>
                    <th>fechaEnvio</th>
                    <th>idPedido</th>
                    <th>idSucursalOrigen</th>
                    <th>idSucursalDestino</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="tableBody">
                <c:forEach var="item" items="${envios}">
                    <tr>
                        <td>${item.idEnvios}</td>
                        <td><fmt:formatDate value="${item.fechaEnvio}" pattern="yyyy-MM-dd" /></td>
                        <td>${item.idPedido}</td>
                        <td>${item.idSucursalOrigen}</td>
                        <td>${item.idSucursalDestino}</td>
                        <td> 
                            <button class="btn-actualizar" onclick="window.location.href='/enviosweb/envios/findOne?idEnvios=${item.idEnvios}&opcion=1'; return false;">
                                <i class="fa-solid fa-pen-to-square"></i> Actualizar
                            </button>
                            <button class="btn-eliminar" onclick="window.location.href='/enviosweb/envios/findOne?idEnvios=${item.idEnvios}&opcion=2'; return false;">
                                <i class="fa-solid fa-trash"></i> Eliminar
                            </button>             
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="noResultsMessage" class="no-results">No se encontraron resultados</div>

    <script>
        function performSearch() {
            const searchInput = document.getElementById('searchInput').value.toLowerCase();
            const rows = document.querySelectorAll('#tableBody tr');
            let found = false;

            rows.forEach(row => {
                const cells = row.querySelectorAll('td');
                let rowContainsSearchTerm = false;

                cells.forEach(cell => {
                    if (cell.textContent.toLowerCase().includes(searchInput)) {
                        rowContainsSearchTerm = true;
                    }
                });

                if (rowContainsSearchTerm) {
                    row.classList.add('highlight');
                    row.style.display = ''; // Mostrar la fila
                    found = true;
                } else {
                    row.classList.remove('highlight');
                    row.style.display = 'none'; // Ocultar la fila
                }
            });

            const noResultsMessage = document.getElementById('noResultsMessage');
            if (found) {
                noResultsMessage.style.display = 'none';
            } else {
                noResultsMessage.style.display = 'block';
            }
        }

        function cancelSearch() {
            document.getElementById('searchInput').value = ''; // Limpiar el campo de búsqueda
            performSearch(); // Llamar a la función de búsqueda para restaurar la vista de la tabla

            // Restaurar la visibilidad y desmarcar todas las filas
            const rows = document.querySelectorAll('#tableBody tr');
            rows.forEach(row => {
                row.classList.remove('highlight'); // Desmarcar la fila
                row.style.display = ''; // Mostrar todas las filas
            });

            // Ocultar el mensaje de no resultados
            const noResultsMessage = document.getElementById('noResultsMessage');
            noResultsMessage.style.display = 'none';
        }

        // Inicialmente mostrar todos los resultados
        window.onload = function() {
            const rows = document.querySelectorAll('#tableBody tr');
            rows.forEach(row => row.style.display = ''); // Mostrar todas las filas
        };
    </script>
</body>
</html>