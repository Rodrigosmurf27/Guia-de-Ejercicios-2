<!-- Joel Ernersto Aguilar Cruz - AC223047 -->
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <!-- Bootstrap & FontAwesome CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="/css/style.css">
    <title>Ficha Estudiante</title>

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
    <h2 class="text-center mb-4">Formulario de Ficha de Estudiante</h2>

    <form class="bg-dark text-white p-4 rounded shadow w-50" action="<%=request.getContextPath()%>/ficha" method="post">

        <%-- Carnet --%>
        <div class="mb-3">
            <label class="form-label">Carnet:</label>
            <input type="text" name="carnet" class="form-control" value="<%= request.getAttribute("carnetValor") != null ? request.getAttribute("carnetValor") : "" %>">
            <% if (request.getAttribute("errorCarnet") != null) { %>
            <div class="text-danger"><%= request.getAttribute("errorCarnet") %></div>
            <% } %>
        </div>

        <%-- Nombres --%>
        <div class="mb-3">
            <label class="form-label">Nombres:</label>
            <input type="text" name="nombres" class="form-control" value="<%= request.getAttribute("nombresValor") != null ? request.getAttribute("nombresValor") : "" %>">
            <% if (request.getAttribute("errorNombres") != null) { %>
            <div class="text-danger"><%= request.getAttribute("errorNombres") %></div>
            <% } %>
        </div>

        <%-- Apellidos --%>
        <div class="mb-3">
            <label class="form-label">Apellidos:</label>
            <input type="text" name="apellidos" class="form-control" value="<%= request.getAttribute("apellidosValor") != null ? request.getAttribute("apellidosValor") : "" %>">
            <% if (request.getAttribute("errorApellidos") != null) { %>
            <div class="text-danger"><%= request.getAttribute("errorApellidos") %></div>
            <% } %>
        </div>

        <%-- Dirección --%>
        <div class="mb-3">
            <label class="form-label">Dirección:</label>
            <input type="text" name="direccion" class="form-control" value="<%= request.getAttribute("direccionValor") != null ? request.getAttribute("direccionValor") : "" %>">
            <% if (request.getAttribute("errorDireccion") != null) { %>
            <div class="text-danger"><%= request.getAttribute("errorDireccion") %></div>
            <% } %>
        </div>

        <%-- Teléfono --%>
        <div class="mb-3">
            <label class="form-label">Teléfono:</label>
            <input type="text" name="telefono" class="form-control" value="<%= request.getAttribute("telefonoValor") != null ? request.getAttribute("telefonoValor") : "" %>">
            <% if (request.getAttribute("errorTelefono") != null) { %>
            <div class="text-danger"><%= request.getAttribute("errorTelefono") %></div>
            <% } %>
        </div>

        <%-- Email --%>
        <div class="mb-3">
            <label class="form-label">Email:</label>
            <input type="email" name="email" class="form-control" value="<%= request.getAttribute("emailValor") != null ? request.getAttribute("emailValor") : "" %>">
            <% if (request.getAttribute("errorEmail") != null) { %>
            <div class="text-danger"><%= request.getAttribute("errorEmail") %></div>
            <% } %>
        </div>

        <%-- Fecha de Nacimiento --%>
        <div class="mb-3">
            <label class="form-label">Fecha de Nacimiento (DD/MM/YYYY):</label>
            <input type="text" name="fechaNacimiento" class="form-control" value="<%= request.getAttribute("fechaNacimientoValor") != null ? request.getAttribute("fechaNacimientoValor") : "" %>">
            <% if (request.getAttribute("errorFechaNacimiento") != null) { %>
            <div class="text-danger"><%= request.getAttribute("errorFechaNacimiento") %></div>
            <% } %>
        </div>

        <div class="text-center">
            <input type="submit" class="btn btn-primary" value="Enviar">
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
