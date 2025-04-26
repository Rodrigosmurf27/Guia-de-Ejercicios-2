<!--Emerson Alexander Gudiel Magaña -->

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.empresa.beans.RegistroVenta" %>
<%@ page import="com.empresa.servlets.ImportadoraServlet.Estadisticas" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>

    <!-- Bootstrap & FontAwesome CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="/css/style.css">
    <meta charset="UTF-8">
    <title>Estadísticas de Venta</title>

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

    <h2 class="text-center mb-4">Clientes y Vehículos Vendidos</h2>

    <%
        List<RegistroVenta> ventas = (List<RegistroVenta>) request.getAttribute("ventas");
        Estadisticas e = (Estadisticas) request.getAttribute("estadisticas");
    %>

    <div class="table-responsive w-75 mb-5">
        <table class="table table-dark table-striped table-bordered shadow rounded text-center align-middle">
            <thead class="table-light text-dark">
            <tr>
                <th>Nombre</th>
                <th>Sexo</th>
                <th>Marca</th>
                <th>Año</th>
                <th>Precio</th>
            </tr>
            </thead>
            <tbody>
            <% for (RegistroVenta v : ventas) { %>
            <tr>
                <td><%= v.getNombreCliente() %></td>
                <td><%= v.getSexo() %></td>
                <td><%= v.getMarca() %></td>
                <td><%= v.getAnio() %></td>
                <td>$<%= String.format("%,.2f", v.getPrecio()) %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <h2 class="text-center mb-4">Estadísticas</h2>

    <div class="table-responsive w-50 mb-4">
        <table class="table table-dark table-striped table-bordered shadow rounded text-center align-middle">
            <thead class="table-light text-dark">
            <tr>
                <th>Marca</th>
                <th>Total Vendidos</th>
                <th>Suma Ventas</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Nissan</td>
                <td><%= e.totalNissan %></td>
                <td>$<%= String.format("%,.2f", e.sumaNissan) %></td>
            </tr>
            <tr>
                <td>Toyota</td>
                <td><%= e.totalToyota %></td>
                <td>$<%= String.format("%,.2f", e.sumaToyota) %></td>
            </tr>
            <tr>
                <td>Kia</td>
                <td><%= e.totalKia %></td>
                <td>$<%= String.format("%,.2f", e.sumaKia) %></td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="bg-gray p-3 rounded shadow text-center mb-4 w-50">
        <p><strong>Vehículos entre 2000-2015:</strong> <%= e.rango2000a2015 %></p>
        <p><strong>Vehículos entre 2016-2025:</strong> <%= e.rango2016a2025 %></p>
    </div>

    <div class="d-flex justify-content-center gap-3">
        <a href="/Ejercicio4/registrarVenta.jsp" class="btn btn-primary">
            <i class="fas fa-undo"></i> Registrar Otro
        </a>
        <a href="/index.jsp" class="btn btn-outline-light">
            <i class="fas fa-home"></i> Volver al Inicio
        </a>
    </div>

</main>

</body>
</html>
