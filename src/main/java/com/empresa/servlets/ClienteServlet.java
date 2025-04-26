//Rodrigo Alberto Velasco Herrera -VH192433

package com.empresa.servlets;

import com.empresa.beans.*;
import com.empresa.utils.Conexion;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.util.*;

public class ClienteServlet extends HttpServlet {
    // Manejo de envío del formulario (POST)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try (Connection con = Conexion.obtenerConexion()) {
            // Obtener parámetros del formulario
            String nombres = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            boolean vip = request.getParameter("vip") != null;

            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");
            String yearStr = request.getParameter("year");
            String servicioStr = request.getParameter("servicio");

            boolean hayErrores = false;

            // Validación de campos obligatorios
            if (nombres == null || nombres.trim().isEmpty()) {
                request.setAttribute("errorNombres", "El nombre es obligatorio.");
                hayErrores = true;
            }
            if (apellidos == null || apellidos.trim().isEmpty()) {
                request.setAttribute("errorApellidos", "El apellido es obligatorio.");
                hayErrores = true;
            }
            if (marca == null || marca.trim().isEmpty()) {
                request.setAttribute("errorMarca", "La marca es obligatoria.");
                hayErrores = true;
            }
            if (modelo == null || modelo.trim().isEmpty()) {
                request.setAttribute("errorModelo", "El modelo es obligatorio.");
                hayErrores = true;
            }
            if (yearStr == null || yearStr.trim().isEmpty()) {
                request.setAttribute("errorYear", "El año es obligatorio.");
                hayErrores = true;
            }
            if (servicioStr == null || servicioStr.trim().isEmpty()) {
                request.setAttribute("errorServicio", "Debe seleccionar un servicio.");
                hayErrores = true;
            }

            // Validación de año
            int year = 0;
            int servicioId = 0;
            try {
                if (yearStr != null && !yearStr.isEmpty()) {
                    year = Integer.parseInt(yearStr);
                    if (year < 1900 || year > 2025) {
                        request.setAttribute("errorYear", "El año debe estar entre 1900 y 2025.");
                        hayErrores = true;
                    }
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorYear", "El año debe ser numérico.");
                hayErrores = true;
            }

            // Validación de servicio
            try {
                if (servicioStr != null && !servicioStr.isEmpty()) {
                    servicioId = Integer.parseInt(servicioStr);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorServicio", "Tipo de servicio inválido.");
                hayErrores = true;
            }

            // Conservar valores en el formulario
            request.setAttribute("nombresValor", nombres);
            request.setAttribute("apellidosValor", apellidos);
            request.setAttribute("marcaValor", marca);
            request.setAttribute("modeloValor", modelo);
            request.setAttribute("yearValor", yearStr);
            request.setAttribute("servicioValor", servicioStr);
            request.setAttribute("vipValor", vip);

            // Si hay errores, volver al formulario
            if (hayErrores) {
                request.getRequestDispatcher("/Ejercicio5/formulario.jsp").forward(request, response);
            } else {
                // Insertar cliente en la base de datos
                String insertCliente = "INSERT INTO Cliente (nombres, apellidos, vip, servicio_id) VALUES (?, ?, ?, ?)";
                PreparedStatement stmtCliente = con.prepareStatement(insertCliente, Statement.RETURN_GENERATED_KEYS);
                stmtCliente.setString(1, nombres);
                stmtCliente.setString(2, apellidos);
                stmtCliente.setBoolean(3, vip);
                stmtCliente.setInt(4, servicioId);
                stmtCliente.executeUpdate();

                // Obtener ID del cliente insertado
                ResultSet rs = stmtCliente.getGeneratedKeys();
                rs.next();
                int clienteId = rs.getInt(1);

                // Insertar automotor relacionado
                String insertAuto = "INSERT INTO Automotor (marca, modelo, year, cliente_id) VALUES (?, ?, ?, ?)";
                PreparedStatement stmtAuto = con.prepareStatement(insertAuto);
                stmtAuto.setString(1, marca);
                stmtAuto.setString(2, modelo);
                stmtAuto.setInt(3, year);
                stmtAuto.setInt(4, clienteId);
                stmtAuto.executeUpdate();

                // Redirigir a lista de clientes
                response.sendRedirect("ClienteServlet?action=ver");
            }

        } catch (Exception e) {
            // Manejo de errores generales
            request.setAttribute("errorGeneral", "Error al registrar: " + e.getMessage());
            request.getRequestDispatcher("/Ejercicio5/formulario.jsp").forward(request, response);
        }
    }

    // Mostrar lista de clientes (GET)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("ver".equals(action)) {
            try (Connection con = Conexion.obtenerConexion()) {
                // Consulta de clientes y sus datos relacionados
                String sql = "SELECT c.nombres, c.apellidos, c.vip, s.tipo, s.precio, a.marca, a.modelo, a.year " +
                        "FROM Cliente c " +
                        "JOIN Servicio s ON c.servicio_id = s.id " +
                        "JOIN Automotor a ON c.id = a.cliente_id";
                PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                // Armar lista de clientes con información de pago
                List<Map<String, Object>> clientes = new ArrayList<>();
                while (rs.next()) {
                    Map<String, Object> datos = new HashMap<>();
                    datos.put("nombres", rs.getString("nombres"));
                    datos.put("apellidos", rs.getString("apellidos"));
                    datos.put("vip", rs.getBoolean("vip"));
                    datos.put("tipo", rs.getString("tipo"));
                    datos.put("precio", rs.getDouble("precio"));
                    datos.put("marca", rs.getString("marca"));
                    datos.put("modelo", rs.getString("modelo"));
                    datos.put("year", rs.getInt("year"));

                    Pago pago = new Pago(rs.getDouble("precio"), rs.getBoolean("vip"));
                    datos.put("total", pago.totalPago());

                    clientes.add(datos);
                }

                request.setAttribute("clientes", clientes);
                request.getRequestDispatcher("/Ejercicio5/listaClientes.jsp").forward(request, response);
            } catch (Exception e) {
                response.getWriter().println("Error: " + e.getMessage());
            }
        }
    }
}
