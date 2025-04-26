<!-- Rodrigo Alberto Velasco Herrera -VH192433 -->
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/css/style.css">
    <meta charset="UTF-8">
    <title>Registrar Cliente</title>
</head>
<body style="background-color: lightslategray;">

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

<main class="d-flex flex-column align-items-center justify-content-start pt-4">

    <div class="bg-dark text-white p-4 rounded shadow w-50">

        <h2 class="text-center mb-4">Registrar Cliente</h2>

        <% if (request.getAttribute("errorGeneral") != null) { %>
        <div class="alert alert-danger text-center">
            <%= request.getAttribute("errorGeneral") %>
        </div>
        <% } %>

        <form action="../../ClienteServlet" method="post">

            <%-- Nombres --%>
            <div class="mb-3">
                <label for="nombres" class="form-label">Nombres:</label>
                <input type="text" class="form-control" id="nombres" name="nombres"
                       value="<%= request.getAttribute("nombresValor") != null ? request.getAttribute("nombresValor") : "" %>">
                <% if (request.getAttribute("errorNombres") != null) { %>
                <div class="text-danger"><%= request.getAttribute("errorNombres") %></div>
                <% } %>
            </div>

            <%-- Apellidos --%>
            <div class="mb-3">
                <label for="apellidos" class="form-label">Apellidos:</label>
                <input type="text" class="form-control" id="apellidos" name="apellidos"
                       value="<%= request.getAttribute("apellidosValor") != null ? request.getAttribute("apellidosValor") : "" %>">
                <% if (request.getAttribute("errorApellidos") != null) { %>
                <div class="text-danger"><%= request.getAttribute("errorApellidos") %></div>
                <% } %>
            </div>

            <%-- VIP --%>
            <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="vip" name="vip"
                    <%= request.getAttribute("vipValor") != null && (boolean) request.getAttribute("vipValor") ? "checked" : "" %>>
                <label class="form-check-label" for="vip">VIP</label>
            </div>

            <%-- Marca --%>
            <div class="mb-3">
                <label for="marca" class="form-label">Marca:</label>
                <input type="text" class="form-control" id="marca" name="marca"
                       value="<%= request.getAttribute("marcaValor") != null ? request.getAttribute("marcaValor") : "" %>">
                <% if (request.getAttribute("errorMarca") != null) { %>
                <div class="text-danger"><%= request.getAttribute("errorMarca") %></div>
                <% } %>
            </div>

            <%-- Modelo --%>
            <div class="mb-3">
                <label for="modelo" class="form-label">Modelo:</label>
                <input type="text" class="form-control" id="modelo" name="modelo"
                       value="<%= request.getAttribute("modeloValor") != null ? request.getAttribute("modeloValor") : "" %>">
                <% if (request.getAttribute("errorModelo") != null) { %>
                <div class="text-danger"><%= request.getAttribute("errorModelo") %></div>
                <% } %>
            </div>

            <%-- Año --%>
            <div class="mb-3">
                <label for="year" class="form-label">Año:</label>
                <input type="number" class="form-control" id="year" name="year" min="1900" max="2025"
                       value="<%= request.getAttribute("yearValor") != null ? request.getAttribute("yearValor") : "" %>">
                <% if (request.getAttribute("errorYear") != null) { %>
                <div class="text-danger"><%= request.getAttribute("errorYear") %></div>
                <% } %>
            </div>

            <%-- Servicio --%>
            <div class="mb-3">
                <label for="servicio" class="form-label">Tipo de servicio:</label>
                <select class="form-select" id="servicio" name="servicio">
                    <option value="">Seleccione...</option>
                    <option value="1" <%= "1".equals(request.getAttribute("servicioValor")) ? "selected" : "" %>>Motocicleta - $2.75</option>
                    <option value="2" <%= "2".equals(request.getAttribute("servicioValor")) ? "selected" : "" %>>Sedan - $3.50</option>
                    <option value="3" <%= "3".equals(request.getAttribute("servicioValor")) ? "selected" : "" %>>Camioneta - $4.00</option>
                    <option value="4" <%= "4".equals(request.getAttribute("servicioValor")) ? "selected" : "" %>>Microbús - $5.00</option>
                    <option value="5" <%= "5".equals(request.getAttribute("servicioValor")) ? "selected" : "" %>>Autobús - $7.00</option>
                </select>
                <% if (request.getAttribute("errorServicio") != null) { %>
                <div class="text-danger"><%= request.getAttribute("errorServicio") %></div>
                <% } %>
            </div>

            <div class="text-center">
                <input type="submit" class="btn btn-success" value="Registrar">
            </div>

        </form>

    </div>

    <div class="text-center mt-4">
        <a href="/index.jsp" class="btn btn-outline-dark">
            <i class="fas fa-arrow-left"></i> Volver al inicio
        </a>
    </div>

</main>

</body>
</html>

