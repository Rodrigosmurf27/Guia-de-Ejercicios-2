//Manuel Alejandro Chavarria Velasquez-CV211229
package com.empresa.servlets;

import com.empresa.beans.Persona;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/VacacionesServlet")
public class vacacionesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String salarioStr = request.getParameter("salario");
        String fechaIngresoStr = request.getParameter("fechaIngreso");

        // Variables para manejar errores
        String errorNombre = null;
        String errorApellido = null;
        String errorSalario = null;
        String errorFechaIngreso = null;
        boolean hayErrores = false;

        // Validar nombre
        try {
            validarNombre(nombre);
        } catch (Exception e) {
            errorNombre = e.getMessage();
            hayErrores = true;
        }

        // Validar apellido
        try {
            validarApellido(apellido);
        } catch (Exception e) {
            errorApellido = e.getMessage();
            hayErrores = true;
        }

        // Validar y convertir salario
        double salario = 0;
        try {
            salario = validarYConvertirSalario(salarioStr);
        } catch (Exception e) {
            errorSalario = e.getMessage();
            hayErrores = true;
        }

        // Validar y convertir fecha
        Date fechaIngreso = null;
        try {
            fechaIngreso = validarYConvertirFecha(fechaIngresoStr);
        } catch (Exception e) {
            errorFechaIngreso = e.getMessage();
            hayErrores = true;
        }

        // Si hay errores  volve al formulario
        if (hayErrores) {
            request.setAttribute("errorNombre", errorNombre);
            request.setAttribute("errorApellido", errorApellido);
            request.setAttribute("errorSalario", errorSalario);
            request.setAttribute("errorFechaIngreso", errorFechaIngreso);

            // Mantiene los valores ingresados para no perderlos
            request.setAttribute("nombreValor", nombre);
            request.setAttribute("apellidoValor", apellido);
            request.setAttribute("salarioValor", salarioStr);
            request.setAttribute("fechaIngresoValor", fechaIngresoStr);

            request.getRequestDispatcher("/Ejercicio2/vacacionesForm.jsp").forward(request, response);
            return;
        }

        // Si no hay errores, procesasa la información
        try {
            Persona persona = new Persona(nombre, apellido, salario, fechaIngreso);
            int diasVacaciones = persona.calcularDiasVacaciones();

            request.setAttribute("persona", persona);
            request.setAttribute("diasVacaciones", diasVacaciones);
            request.getRequestDispatcher("/Ejercicio2/vacacionesResult.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorGeneral", "Error al calcular vacaciones: " + e.getMessage());
            request.getRequestDispatcher("/Ejercicio2/vacacionesForm.jsp").forward(request, response);
        }
    }
    //validaciones
    private void validarNombre(String nombre) throws Exception {
        if (nombre == null || nombre.trim().isEmpty()) {
            throw new Exception("El nombre es requerido");
        }
        if (!nombre.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑ\\s]+")) {
            throw new Exception("Solo letras y espacios permitidos");
        }
    }

    private void validarApellido(String apellido) throws Exception {
        if (apellido == null || apellido.trim().isEmpty()) {
            throw new Exception("El apellido es requerido");
        }
        if (!apellido.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑ\\s]+")) {
            throw new Exception("Solo letras y espacios permitidos");
        }
    }

    private double validarYConvertirSalario(String salarioStr) throws Exception {
        if (salarioStr == null || salarioStr.trim().isEmpty()) {
            throw new Exception("El salario es requerido");
        }

        try {
            double salario = Double.parseDouble(salarioStr);
            if (salario <= 0) {
                throw new Exception("El salario debe ser mayor que cero");
            }
            return salario;
        } catch (NumberFormatException e) {
            throw new Exception("El salario debe ser un número válido");
        }
    }

    private Date validarYConvertirFecha(String fechaStr) throws Exception {
        if (fechaStr == null || fechaStr.trim().isEmpty()) {
            throw new Exception("La fecha de ingreso es requerida");
        }

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            sdf.setLenient(false); // Validación estricta de fecha
            return sdf.parse(fechaStr);
        } catch (ParseException e) {
            throw new Exception("Formato de fecha inválido. Use YYYY-MM-DD");
        }
    }
}