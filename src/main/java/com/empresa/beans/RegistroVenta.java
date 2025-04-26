//Emerson Alexander Gudiel Magaña

package com.empresa.beans;

public class RegistroVenta {
    // Atributos privados que almacenan los datos de una venta
    private String nombreCliente; // Nombre del cliente que realizó la compra
    private String sexo;          // Sexo del cliente
    private String marca;         // Marca del vehículo (Nissan, Toyota, Kia)
    private int anio;             // Año del vehículo
    private double precio;        // Precio de la venta

    // Constructor vacío requerido por algunos frameworks y para uso general
    public RegistroVenta() {}

    // Constructor con parámetros para inicializar un objeto con todos los datos
    public RegistroVenta(String nombreCliente, String sexo, String marca, int anio, double precio) {
        this.nombreCliente = nombreCliente;
        this.sexo = sexo;
        this.marca = marca;
        this.anio = anio;
        this.precio = precio;
    }

    // Métodos getter y setter para acceder y modificar cada atributo

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
}
