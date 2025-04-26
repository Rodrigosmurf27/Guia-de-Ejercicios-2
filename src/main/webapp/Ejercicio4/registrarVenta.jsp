<!--Emerson Alexander Gudiel Magaña -->

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <!-- Bootstrap & FontAwesome CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="/css/style.css">
    <meta charset="UTF-8">
    <title>Registrar Venta</title>

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

    <div class="bg-dark text-white p-4 rounded shadow w-50">
        <h2 class="text-center mb-4">Registro de Venta de Vehículo</h2>

        <form action="../ImportadoraServlet" method="post">

            <div class="mb-3 text-start">
                <label for="nombre" class="form-label">Nombre completo:</label>
                <input type="text" class="form-control" id="nombre" name="nombre"
                       value="<%= request.getAttribute("nombreValor") != null ? request.getAttribute("nombreValor") : "" %>">
                <% if (request.getAttribute("errorNombre") != null) { %>
                <div class="text-danger"><%= request.getAttribute("errorNombre") %></div>
                <% } %>
            </div>

            <div class="mb-3 text-start">
                <label for="sexo" class="form-label">Sexo:</label>
                <select class="form-select" id="sexo" name="sexo">
                    <option value="">Seleccione...</option>
                    <option value="Masculino" <%= "Masculino".equals(request.getAttribute("sexoValor")) ? "selected" : "" %>>Masculino</option>
                    <option value="Femenino" <%= "Femenino".equals(request.getAttribute("sexoValor")) ? "selected" : "" %>>Femenino</option>
                </select>
                <% if (request.getAttribute("errorSexo") != null) { %>
                <div class="text-danger"><%= request.getAttribute("errorSexo") %></div>
                <% } %>
            </div>

            <div class="mb-3 text-start">
                <label for="marca" class="form-label">Marca:</label>
                <select class="form-select" id="marca" name="marca">
                    <option value="">Seleccione...</option>
                    <option value="Nissan" <%= "Nissan".equals(request.getAttribute("marcaValor")) ? "selected" : "" %>>Nissan</option>
                    <option value="Toyota" <%= "Toyota".equals(request.getAttribute("marcaValor")) ? "selected" : "" %>>Toyota</option>
                    <option value="Kia" <%= "Kia".equals(request.getAttribute("marcaValor")) ? "selected" : "" %>>Kia</option>
                </select>
                <% if (request.getAttribute("errorMarca") != null) { %>
                <div class="text-danger"><%= request.getAttribute("errorMarca") %></div>
                <% } %>
            </div>

            <div class="mb-3 text-start">
                <label for="anio" class="form-label">Año:</label>
                <input type="number" class="form-control" id="anio" name="anio" min="2000" max="2025"
                       value="<%= request.getAttribute("anioValor") != null ? request.getAttribute("anioValor") : "" %>">
                <% if (request.getAttribute("errorAnio") != null) { %>
                <div class="text-danger"><%= request.getAttribute("errorAnio") %></div>
                <% } %>
            </div>

            <div class="mb-3 text-start">
                <label for="precio" class="form-label">Precio:</label>
                <input type="number" class="form-control" id="precio" name="precio" step="0.01" min="0.01"
                       value="<%= request.getAttribute("precioValor") != null ? request.getAttribute("precioValor") : "" %>">
                <% if (request.getAttribute("errorPrecio") != null) { %>
                <div class="text-danger"><%= request.getAttribute("errorPrecio") %></div>
                <% } %>
            </div>

            <div class="text-center">
                <input type="submit" class="btn btn-success" value="Registrar Venta">
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
