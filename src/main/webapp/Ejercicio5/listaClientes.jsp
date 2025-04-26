<!-- Rodrigo Alberto Velasco Herrera -VH192433 -->
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>

    <!-- Bootstrap & FontAwesome CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="/css/style.css">
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>

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

    <h2 class="text-center mb-4">Clientes Registrados</h2>

    <%
        List<Map<String, Object>> clientes = (List<Map<String, Object>>) request.getAttribute("clientes");
        if (clientes != null && !clientes.isEmpty()) {
    %>

    <div class="table-responsive w-75">
        <table class="table table-dark table-striped table-bordered shadow rounded text-center align-middle">
            <thead class="table-light text-dark">
            <tr>
                <th>Nombre</th>
                <th>Vehículo</th>
                <th>Servicio</th>
                <th>Precio</th>
                <th>Descuento</th>
                <th>Total</th>
            </tr>
            </thead>
            <tbody>
            <% for (Map<String, Object> c : clientes) { %>
            <tr>
                <td><%= c.get("nombres") %> <%= c.get("apellidos") %></td>
                <td><%= c.get("marca") %> <%= c.get("modelo") %> (<%= c.get("year") %>)</td>
                <td><%= c.get("tipo") %></td>
                <td>$<%= String.format("%,.2f", c.get("precio")) %></td>
                <td><%= ((Boolean)c.get("vip")) ? "15%" : "0%" %></td>
                <td>$<%= String.format("%,.2f", c.get("total")) %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <% } else { %>
    <div class="alert alert-warning w-50 text-center">No hay clientes registrados.</div>
    <% } %>

    <div class="d-flex justify-content-center gap-3">
        <a href="/Ejercicio5/formulario.jsp" class="btn btn-primary">
            <i class="fas fa-undo"></i> Crear Otro
        </a>
        <a href="/index.jsp" class="btn btn-outline-light">
            <i class="fas fa-home"></i> Volver al Inicio
        </a>
    </div>

</main>

</body>
</html>
