<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <style>
        body {
            background-color: #e6e6fa; /* Color de fondo lavanda */
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            color: #4682b4; /* Azul más oscuro */
            font-size: 3.5em; /* Tamaño de fuente más grande */
            text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.5); /* Sombra pronunciada */
            margin: 20px; /* Margen llamativo */
            animation: bounce 2s infinite;
            cursor: pointer; /* Cambia el cursor al pasar sobre el texto */
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-30px);
            }
            60% {
                transform: translateY(-15px);
            }
        }
    </style>
    <script>
        function redirectToLink() {
            window.location.href = "http://localhost:8080/enviosweb/envios/findAll";
        }
    </script>
</head>
<body>
    <h1 onclick="redirectToLink()">HOLA MUNDO CAMALEON SABROSO</h1>
</body>
</html>


