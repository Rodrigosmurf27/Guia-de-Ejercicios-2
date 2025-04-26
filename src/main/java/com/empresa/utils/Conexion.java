//Rodrigo Alberto Velasco Herrera -VH192433
package com.empresa.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    // Datos de conexión a la base de datos
    private static final String URL = "jdbc:mysql://localhost:3306/carcleandb?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "smurf";

    // Método para obtener una conexión a la base de datos
    public static Connection obtenerConexion() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Cargar el driver JDBC de MySQL
        } catch (ClassNotFoundException e) {
            throw new SQLException("No se encontró el driver MySQL", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}


