//Rodrigo Alberto Velasco Herrera -VH192433

package com.empresa.beans;

/**
 * Clase JavaBean que representa un servicio ofrecido por la empresa.
 */
public class Servicio {
    // Identificador único del servicio
    private int id;

    // Tipo de servicio (ej. Lavado, Mantenimiento, etc.)
    private String tipo;

    // Precio del servicio
    private double precio;

    // Constructor vacío requerido para frameworks y beans
    public Servicio() {}

    // Getter y Setter para el ID
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Getter y Setter para el tipo de servicio
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    // Getter y Setter para el precio del servicio
    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
}

