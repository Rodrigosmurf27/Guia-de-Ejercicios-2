//Joel Ernersto Aguilar Cruz - AC223047
// Paquete al que pertenece el servlet
package com.empresa.servlets;

// Importación de la clase Estudiante desde el paquete beans
import com.empresa.beans.Estudiante;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

// Declaración del servlet que extiende HttpServlet para manejar peticiones HTTP
public class FichaEstudianteServlet extends HttpServlet {

    // Método que se ejecuta cuando se recibe una solicitud POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Establece el tipo de contenido de la respuesta
        response.setContentType("text/html;charset=UTF-8");

        // Obtener parámetros del formulario enviado por el usuario
        String carnet = request.getParameter("carnet");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
        String fechaNacimiento = request.getParameter("fechaNacimiento");

        // Variable para controlar si hay errores de validación
        boolean hayErrores = false;

        // Validaciones para cada campo del formulario

        // Valida el carnet (2 letras + 4 números)
        if (carnet == null || !carnet.matches("^[A-Za-z]{2}\\d{4}$")) {
            request.setAttribute("errorCarnet", "Carnet inválido (formato esperado: LLNNNN).");
            hayErrores = true;
        }

        // Valida nombres (no vacíos y máximo 25 caracteres)
        if (nombres == null || nombres.trim().isEmpty() || nombres.length() > 25) {
            request.setAttribute("errorNombres", "Nombres inválidos o demasiado largos.");
            hayErrores = true;
        }

        // Valida apellidos (igual que nombres)
        if (apellidos == null || apellidos.trim().isEmpty() || apellidos.length() > 25) {
            request.setAttribute("errorApellidos", "Apellidos inválidos o demasiado largos.");
            hayErrores = true;
        }

        // Valida dirección (no vacía y máximo 255 caracteres)
        if (direccion == null || direccion.trim().isEmpty() || direccion.length() > 255) {
            request.setAttribute("errorDireccion", "Dirección inválida o demasiado larga.");
            hayErrores = true;
        }

        // Valida teléfono (formato 0000-0000)
        if (telefono == null || !telefono.matches("^\\d{4}-\\d{4}$")) {
            request.setAttribute("errorTelefono", "Teléfono inválido (formato esperado: 0000-0000).");
            hayErrores = true;
        }

        // Valida email (formato básico de correo electrónico)
        if (email == null || !email.matches("^[\\w\\-.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            request.setAttribute("errorEmail", "Correo electrónico inválido.");
            hayErrores = true;
        }

        // Valida fecha de nacimiento (formato DD/MM/YYYY)
        if (fechaNacimiento == null || !fechaNacimiento.matches("^\\d{2}/\\d{2}/\\d{4}$")) {
            request.setAttribute("errorFechaNacimiento", "Fecha de nacimiento inválida (formato esperado: DD/MM/YYYY).");
            hayErrores = true;
        }

        // Guarda los valores en los atributos del request para rellenar el formulario si hay errores
        request.setAttribute("carnetValor", carnet);
        request.setAttribute("nombresValor", nombres);
        request.setAttribute("apellidosValor", apellidos);
        request.setAttribute("direccionValor", direccion);
        request.setAttribute("telefonoValor", telefono);
        request.setAttribute("emailValor", email);
        request.setAttribute("fechaNacimientoValor", fechaNacimiento);

        // Si hay errores, redirige al formulario original mostrando los mensajes
        if (hayErrores) {
            RequestDispatcher rd = request.getRequestDispatcher("/Ejercicio1/fichaEstudiante.jsp");
            rd.forward(request, response);
        } else {
            // Si no hay errores, se crea un objeto Estudiante con los datos recibidos
            Estudiante estudiante = new Estudiante();
            estudiante.setCarnet(carnet);
            estudiante.setNombres(nombres);
            estudiante.setApellidos(apellidos);
            estudiante.setDireccion(direccion);
            estudiante.setTelefono(telefono);
            estudiante.setEmail(email);
            estudiante.setFechaNacimiento(fechaNacimiento);

            // Se guarda el objeto en el request
            request.setAttribute("estudiante", estudiante);

            // Redirige a la página de resultados
            RequestDispatcher rd = request.getRequestDispatcher("/Ejercicio1/resultado.jsp");
            rd.forward(request, response);
        }
    }
}
