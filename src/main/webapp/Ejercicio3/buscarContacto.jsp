<!-- Kevin Alexander Del Cid Ponce DP191337 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.empresa.beans.Contacto" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="/css/style.css">
    <meta charset="UTF-8">
    <title>Buscar Contacto</title>

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

    <div class="mb-4 d-flex gap-3 justify-content-center">
        <form action="../Ejercicio3/agregarContacto.jsp" method="get">
            <button class="btn btn-primary" type="submit"><i class="fas fa-plus"></i> Agregar Contacto</button>
        </form>
        <form action="../ContactoServlet" method="get">
            <button class="btn btn-primary" type="submit"><i class="fas fa-list"></i> Ver Lista de Contactos</button>
        </form>
        <form action="../Ejercicio3/buscarContacto.jsp" method="get">
            <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i> Buscar Contacto</button>
        </form>
    </div>

    <div class="bg-dark text-white p-4 rounded shadow w-50 text-center">
        <h2 class="mb-4">Buscar Contacto</h2>

        <form action="../ContactoServlet" method="post">
            <input type="hidden" name="accion" value="buscar">

            <div class="mb-3 text-start">
                <label for="nombreBuscar" class="form-label">Nombre a buscar:</label>
                <input type="text" class="form-control" id="nombreBuscar" name="nombreBuscar" required>
            </div>

            <div class="text-center">
                <input type="submit" class="btn btn-success" value="Buscar">
            </div>
        </form>

        <div class="mt-4">
            <%
                Contacto contacto = (Contacto) request.getAttribute("contacto");
                if (contacto != null) {
            %>
            <div class="alert alert-success text-start">
                <p><strong>Nombre:</strong> <%= contacto.getNombre() %></p>
                <p><strong>Teléfono:</strong> <%= contacto.getTelefono() %></p>
                <p><strong>Correo:</strong> <%= contacto.getCorreo() %></p>
            </div>
            <% } else if (request.getAttribute("mensaje") != null) { %>
            <div class="alert alert-warning">
                <%= request.getAttribute("mensaje") %>
            </div>
            <% } else if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
            <% } %>
        </div>

    </div>

    <div class="text-center mt-4">
        <a href="/index.jsp" class="btn btn-outline-dark">
            <i class="fas fa-arrow-left"></i> Volver al inicio
        </a>
    </div>

</main>

</body>
</html>
