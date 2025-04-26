<--!Manuel Alejandro Chavarria Velasquez-CV211229-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.empresa.beans.Persona, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>

    <!-- Bootstrap & FontAwesome CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="/css/style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Resultado de Vacaciones</title>

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
    <div class="bg-dark text-white p-4 rounded shadow w-50 text-center">
        <h1 class="mb-4">Resultado de Cálculo de Vacaciones</h1>

        <%
            Persona persona = (Persona) request.getAttribute("persona");
            Integer diasVacaciones = (Integer) request.getAttribute("diasVacaciones");
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        %>

        <div class="mb-3">
            <p><strong>Nombre completo:</strong> <%= persona.getNombre() %> <%= persona.getApellido() %></p>
            <p><strong>Salario:</strong> $<%= String.format("%,.2f", persona.getSalario()) %></p>
            <p><strong>Fecha de ingreso:</strong> <%= sdf.format(persona.getFechaIngreso()) %></p>
            <p><strong>Días de vacaciones correspondientes:</strong> <%= diasVacaciones %> días</p>
        </div>

        <div class="d-flex justify-content-center gap-3">
            <a href="/Ejercicio2/vacacionesForm.jsp" class="btn btn-primary">
                <i class="fas fa-undo"></i> Calcular Otro
            </a>
            <a href="/index.jsp" class="btn btn-outline-light">
                <i class="fas fa-home"></i> Volver al Inicio
            </a>
        </div>
    </div>
</main>

</body>
</html>
