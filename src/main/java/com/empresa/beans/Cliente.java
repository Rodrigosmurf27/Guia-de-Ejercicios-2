//Rodrigo Alberto Velasco Herrera -VH192433

package com.empresa.beans;

/**
 * Representa a un cliente con sus datos personales y si es VIP o no.
 */
public class Cliente {
    private int id;               // Identificador único del cliente
    private String nombres;       // Nombres del cliente
    private String apellidos;     // Apellidos del cliente
    private boolean vip;          // Indica si el cliente es VIP

    public Cliente() {}

    // Métodos getter y setter para acceder y modificar los atributos

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public boolean isVip() {
        return vip;
    }

    public void setVip(boolean vip) {
        this.vip = vip;
    }
}

