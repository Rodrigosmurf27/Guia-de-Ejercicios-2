<!-- Joel Ernersto Aguilar Cruz - AC223047 -->
<%@ page import="com.empresa.beans.Estudiante" %>
<jsp:useBean id="estudiante" scope="request" class="com.empresa.beans.Estudiante" />

<!DOCTYPE html>
<html lang="es">
<head>

    <!-- Bootstrap & FontAwesome CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="/css/style.css">
    <meta charset="UTF-8">
    <title>Datos del Estudiante</title>

    <style>
        body {
            background-color: lightslategray;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        main {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: start;
            padding-top: 20px;
        }
    </style>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="/index.jsp"><i class="fas fa-car"></i> Proyectos Java Web</a>
        <button class="btn btn-primary navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/index.jsp"><i class="fas fa-home"></i> Inicio</a></li>
                <li class="nav-item"><a class="nav-link" href="/Ejercicio1/fichaEstudiante.jsp"><i class="fas fa-user-graduate"></i> Ejercicio 1</a></li>
                <li class="nav-item"><a class="nav-link" href="/Ejercicio2/vacacionesForm.jsp"><i class="fas fa-umbrella-beach"></i> Ejercicio 2</a></li>
                <li class="nav-item"><a class="nav-link" href="/Ejercicio3/listarContactos.jsp"><i class="fas fa-address-book"></i> Ejercicio 3</a></li>
                <li class="nav-item"><a class="nav-link" href="/Ejercicio4/registrarVenta.jsp"><i class="fas fa-car-side"></i> Ejercicio 4</a></li>
                <li class="nav-item"><a class="nav-link" href="/Ejercicio5/formulario.jsp"><i class="fas fa-users"></i> Ejercicio 5</a></li>
            </ul>
        </div>
    </div>
</nav>

<main>

    <h2 class="text-center mb-4">Datos del Estudiante</h2>

    <div class="table-responsive w-75">
        <table class="table table-dark table-striped table-bordered shadow rounded text-center align-middle">
            <tbody>
            <tr><th>Carnet</th><td><%= estudiante.getCarnet() %></td></tr>
            <tr><th>Nombres</th><td><%= estudiante.getNombres() %></td></tr>
            <tr><th>Apellidos</th><td><%= estudiante.getApellidos() %></td></tr>
            <tr><th>Dirección</th><td><%= estudiante.getDireccion() %></td></tr>
            <tr><th>Teléfono</th><td><%= estudiante.getTelefono() %></td></tr>
            <tr><th>Email</th><td><%= estudiante.getEmail() %></td></tr>
            <tr><th>Fecha Nacimiento</th><td><%= estudiante.getFechaNacimiento() %></td></tr>
            </tbody>
        </table>
    </div>

    <div class="d-flex justify-content-center gap-3">
        <a href="/Ejercicio1/fichaEstudiante.jsp" class="btn btn-primary">
            <i class="fas fa-undo"></i> Registrar otro Estudiante
        </a>
        <a href="/index.jsp" class="btn btn-outline-light">
            <i class="fas fa-home"></i> Volver al Inicio
        </a>
    </div>

</main>

</body>
</html>
