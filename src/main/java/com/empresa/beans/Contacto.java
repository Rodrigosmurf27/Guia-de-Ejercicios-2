//Kevin Alexander Del Cid Ponce DP191337
package com.empresa.beans;

public class Contacto {
    private String nombre;
    private String telefono;
    private String correo;

    public Contacto() {
    }

    // Constructor
    public Contacto(String nombre, String telefono, String correo) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
    }

// GETTERS Y SETTERS

    // Obtiene el nombre
    public String getNombre() {
        return nombre;
    }

    // Actualiza el nombre
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    // Obtiene el teléfono
    public String getTelefono() {
        return telefono;
    }

    // Actualiza el teléfono
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    // Obtiene el correo
    public String getCorreo() {
        return correo;
    }

    // Actualiza el correo
    public void setCorreo(String correo) {
        this.correo = correo;
    }
}
