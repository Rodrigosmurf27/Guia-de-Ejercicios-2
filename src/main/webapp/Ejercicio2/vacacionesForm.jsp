<--!Manuel Alejandro Chavarria Velasquez-CV211229-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <!-- Bootstrap & FontAwesome CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="/css/style.css">
    <meta charset="UTF-8">
    <title>Cálculo de Vacaciones</title>

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
            justify-content: center;
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
    <h1 class="text-center mb-4">Cálculo de Días de Vacaciones</h1>

    <% if (request.getAttribute("errorGeneral") != null) { %>
    <div class="alert alert-danger w-50 text-center"><%= request.getAttribute("errorGeneral") %></div>
    <% } %>

    <form class="bg-dark text-white p-4 rounded shadow w-50" action="/vacacionesServlet" method="POST">

        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre:</label>
            <input type="text" id="nombre" name="nombre" class="form-control"
                   value="<%= request.getAttribute("nombreValor") != null ? request.getAttribute("nombreValor") : "" %>">
            <% if (request.getAttribute("errorNombre") != null) { %>
            <div class="text-danger"><%= request.getAttribute("errorNombre") %></div>
            <% } %>
        </div>

        <div class="mb-3">
            <label for="apellido" class="form-label">Apellido:</label>
            <input type="text" id="apellido" name="apellido" class="form-control"
                   value="<%= request.getAttribute("apellidoValor") != null ? request.getAttribute("apellidoValor") : "" %>">
            <% if (request.getAttribute("errorApellido") != null) { %>
            <div class="text-danger"><%= request.getAttribute("errorApellido") %></div>
            <% } %>
        </div>

        <div class="mb-3">
            <label for="salario" class="form-label">Salario:</label>
            <input type="text" id="salario" name="salario" class="form-control"
                   value="<%= request.getAttribute("salarioValor") != null ? request.getAttribute("salarioValor") : "" %>">
            <% if (request.getAttribute("errorSalario") != null) { %>
            <div class="text-danger"><%= request.getAttribute("errorSalario") %></div>
            <% } %>
        </div>

        <div class="mb-3">
            <label for="fechaIngreso" class="form-label">Fecha de Ingreso:</label>
            <input type="text" id="fechaIngreso" name="fechaIngreso" class="form-control"
                   value="<%= request.getAttribute("fechaIngresoValor") != null ? request.getAttribute("fechaIngresoValor") : "" %>">
            <% if (request.getAttribute("errorFechaIngreso") != null) { %>
            <div class="text-danger"><%= request.getAttribute("errorFechaIngreso") %></div>
            <% } %>
        </div>

        <div class="text-center">
            <button class="btn btn-primary" type="submit">Calcular Vacaciones</button>
        </div>
    </form>

    <div class="text-center mt-4">
        <a href="/index.jsp" class="btn btn-outline-dark">
            <i class="fas fa-arrow-left"></i> Volver al inicio
        </a>
    </div>
</main>

</body>
</html>
