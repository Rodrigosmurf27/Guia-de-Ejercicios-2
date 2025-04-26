//Emerson Alexander Gudiel Magaña

package com.empresa.servlets;

import com.empresa.beans.RegistroVenta;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

// Define el servlet con nombre y URL de acceso
@WebServlet(name = "ImportadoraServlet", urlPatterns = {"/ImportadoraServlet"})
public class ImportadoraServlet extends HttpServlet {

    // Lista que almacena todas las ventas registradas
    private final List<RegistroVenta> ventas = new ArrayList<>();

    // Lista de marcas válidas que se permiten en el formulario
    private final List<String> marcasPermitidas = Arrays.asList("Nissan", "Toyota", "Kia");

    // Método que procesa los formularios enviados por POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtiene los datos enviados desde el formulario
        String nombre = request.getParameter("nombre");
        String sexo = request.getParameter("sexo");
        String marca = request.getParameter("marca");
        String anioStr = request.getParameter("anio");
        String precioStr = request.getParameter("precio");

        boolean hayErrores = false; // Bandera para controlar si hay errores de validación

        // Validación del campo nombre
        if (nombre == null || nombre.trim().isEmpty()) {
            request.setAttribute("errorNombre", "El nombre es obligatorio.");
            hayErrores = true;
        }

        // Validación del campo sexo
        if (sexo == null || sexo.trim().isEmpty()) {
            request.setAttribute("errorSexo", "El sexo es obligatorio.");
            hayErrores = true;
        }

        // Validación del campo marca y que sea una marca válida
        if (marca == null || marca.trim().isEmpty() || !marcasPermitidas.contains(marca)) {
            request.setAttribute("errorMarca", "Debe seleccionar una marca válida (Nissan, Toyota o Kia).");
            hayErrores = true;
        }

        // Validación del campo año (formato y rango)
        if (anioStr == null || anioStr.trim().isEmpty()) {
            request.setAttribute("errorAnio", "El año es obligatorio.");
            hayErrores = true;
        }

        // Validación del campo precio
        if (precioStr == null || precioStr.trim().isEmpty()) {
            request.setAttribute("errorPrecio", "El precio es obligatorio.");
            hayErrores = true;
        }

        int anio = 0;       // Variable para almacenar el año ya convertido a entero
        double precio = 0;  // Variable para almacenar el precio convertido a decimal

        // Intenta convertir el año a entero y validar el rango
        try {
            if (anioStr != null && !anioStr.isEmpty()) {
                anio = Integer.parseInt(anioStr);
                if (anio < 2000 || anio > 2025) {
                    request.setAttribute("errorAnio", "El año debe estar entre 2000 y 2025.");
                    hayErrores = true;
                }
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorAnio", "El año debe ser un número válido.");
            hayErrores = true;
        }

        // Intenta convertir el precio a double y validar que sea positivo
        try {
            if (precioStr != null && !precioStr.isEmpty()) {
                precio = Double.parseDouble(precioStr);
                if (precio <= 0) {
                    request.setAttribute("errorPrecio", "El precio debe ser mayor a cero.");
                    hayErrores = true;
                }
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorPrecio", "El precio debe ser un número válido.");
            hayErrores = true;
        }

        // Guardar los valores en atributos para que el formulario no pierda la información al recargar
        request.setAttribute("nombreValor", nombre);
        request.setAttribute("sexoValor", sexo);
        request.setAttribute("marcaValor", marca);
        request.setAttribute("anioValor", anioStr);
        request.setAttribute("precioValor", precioStr);

        // Si hay errores, reenviar al formulario original
        if (hayErrores) {
            request.getRequestDispatcher("/Ejercicio4/registrarVenta.jsp").forward(request, response);
        } else {
            // Si no hay errores, crear el objeto venta y agregarlo a la lista
            RegistroVenta venta = new RegistroVenta(nombre.trim(), sexo.trim(), marca, anio, precio);
            ventas.add(venta);

            // Guardar la lista de ventas y estadísticas como atributos para la vista
            request.setAttribute("ventas", ventas);
            request.setAttribute("estadisticas", calcularEstadisticas());

            // Reenviar a la página de estadísticas
            request.getRequestDispatcher("/Ejercicio4/estadisticasVenta.jsp").forward(request, response);
        }
    }

    // Método que calcula estadísticas generales con base en las ventas registradas
    private Estadisticas calcularEstadisticas() {
        Estadisticas stats = new Estadisticas();

        // Recorre cada venta y acumula información por marca y rango de años
        for (RegistroVenta v : ventas) {
            switch (v.getMarca()) {
                case "Nissan" -> {
                    stats.totalNissan++;
                    stats.sumaNissan += v.getPrecio();
                }
                case "Toyota" -> {
                    stats.totalToyota++;
                    stats.sumaToyota += v.getPrecio();
                }
                case "Kia" -> {
                    stats.totalKia++;
                    stats.sumaKia += v.getPrecio();
                }
            }

            // Clasificación por rango de años
            if (v.getAnio() >= 2000 && v.getAnio() <= 2015) {
                stats.rango2000a2015++;
            } else if (v.getAnio() >= 2016 && v.getAnio() <= 2025) {
                stats.rango2016a2025++;
            }
        }

        return stats; // Devuelve el objeto con los resultados
    }

    // Clase interna que almacena las estadísticas acumuladas
    public static class Estadisticas {
        public int totalNissan = 0, totalToyota = 0, totalKia = 0;
        public double sumaNissan = 0, sumaToyota = 0, sumaKia = 0;
        public int rango2000a2015 = 0, rango2016a2025 = 0;
    }
}
