//Kevin Alexander Del Cid Ponce DP191337
package com.empresa.servlets;

import com.empresa.beans.Contacto;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet(name = "ContactoServlet", urlPatterns = {"/ContactoServlet"})
public class ContactoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Lista para almacenar los contactos en memoria
    private List<Contacto> listaContactos = new ArrayList<>();

    // Maneja las peticiones POST (envío de formularios)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion"); // Obtiene la acción a realizar

        try {
            if (accion != null) {
                switch (accion) {
                    case "agregar":
                        agregarContacto(request, response); // Agrega nuevo contacto
                        break;
                    case "buscar":
                        buscarContacto(request, response); // Busca contacto existente
                        break;
                    default:
                        response.sendRedirect("index.jsp"); // Redirige si acción no reconocida
                        break;
                }
            }
        } catch (Exception e) {
            // Manejo de errores generales
            request.setAttribute("error", "Error al procesar la solicitud: " + e.getMessage());
            request.getRequestDispatcher("/Ejercicio3/agregarContacto.jsp").forward(request, response);
        }
    }

    // Método para agregar un nuevo contacto
    private void agregarContacto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtiene parámetros del formulario
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");

        boolean hayErrores = false;

        // Validaciones del campo nombre
        if (nombre == null || nombre.trim().isEmpty()) {
            request.setAttribute("errorNombre", "El nombre es obligatorio.");
            hayErrores = true;
        } else if (nombre.trim().length() < 2) {
            request.setAttribute("errorNombre", "El nombre debe tener al menos 2 caracteres.");
            hayErrores = true;
        }

        // Validaciones del campo teléfono
        if (telefono == null || telefono.trim().isEmpty()) {
            request.setAttribute("errorTelefono", "El teléfono es obligatorio.");
            hayErrores = true;
        } else if (!telefono.matches("^\\d{4}-\\d{4}$")) {
            request.setAttribute("errorTelefono", "Teléfono inválido (formato esperado: 0000-0000).");
            hayErrores = true;
        }

        // Validaciones del campo correo
        if (correo == null || !correo.matches("^[\\w\\-.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            request.setAttribute("errorCorreo", "El correo es obligatorio.");
            hayErrores = true;
        } else if (!isCorreoValido(correo.trim())) {
            request.setAttribute("errorEmail", "Correo electrónico inválido.");
            hayErrores = true;
        }

        // Verifica si el contacto ya existe
        if (!hayErrores && existeContacto(nombre.trim())) {
            request.setAttribute("errorNombre", "Ya existe un contacto con ese nombre.");
            hayErrores = true;
        }

        // Guarda los valores ingresados para mostrarlos nuevamente en caso de error
        request.setAttribute("nombreValor", nombre);
        request.setAttribute("telefonoValor", telefono);
        request.setAttribute("correoValor", correo);

        if (hayErrores) {
            // Si hay errores, vuelve al formulario
            request.getRequestDispatcher("/Ejercicio3/agregarContacto.jsp").forward(request, response);
        } else {
            // Si no hay errores, agrega el contacto y muestra la lista
            Contacto contacto = new Contacto(nombre.trim(), telefono.trim(), correo.trim());
            listaContactos.add(contacto);

            request.setAttribute("contactos", listaContactos);
            request.getRequestDispatcher("/Ejercicio3/listarContactos.jsp").forward(request, response);
        }
    }

    // Método para buscar un contacto por nombre
    private void buscarContacto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreBuscar = request.getParameter("nombreBuscar");

        // Validación básica
        if (nombreBuscar == null || nombreBuscar.trim().isEmpty()) {
            request.setAttribute("error", "Debe ingresar un nombre para buscar.");
            request.getRequestDispatcher("/Ejercicio3/buscarContacto.jsp").forward(request, response);
            return;
        }

        // Busca el contacto en la lista
        Contacto encontrado = null;
        for (Contacto contacto : listaContactos) {
            if (contacto.getNombre().equalsIgnoreCase(nombreBuscar.trim())) {
                encontrado = contacto;
                break;
            }
        }

        // Establece el resultado en la solicitud
        if (encontrado != null) {
            request.setAttribute("contacto", encontrado);
        } else {
            request.setAttribute("mensaje", "No se encontró un contacto con ese nombre.");
        }

        request.getRequestDispatcher("/Ejercicio3/buscarContacto.jsp").forward(request, response);
    }

    // Maneja las peticiones GET (mostrar lista de contactos)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("contactos", listaContactos);
        request.getRequestDispatcher("/Ejercicio3/listarContactos.jsp").forward(request, response);
    }

    // Valida el formato de correo electrónico
    private boolean isCorreoValido(String correo) {
        String correoRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
        return Pattern.matches(correoRegex, correo);
    }

    // Verifica si ya existe un contacto con el mismo nombre
    private boolean existeContacto(String nombre) {
        for (Contacto contacto : listaContactos) {
            if (contacto.getNombre().equalsIgnoreCase(nombre)) {
                return true;
            }
        }
        return false;
    }
}
