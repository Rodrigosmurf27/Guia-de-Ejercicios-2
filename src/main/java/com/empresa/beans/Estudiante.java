//Joel Ernersto Aguilar Cruz - AC223047
// Paquete donde se encuentra la clase. Ayuda a organizar el proyecto.
package com.empresa.beans;

// Definición de la clase Estudiante
public class Estudiante {
    // Declaración de atributos privados del estudiante
    // Esto sigue el principio de encapsulamiento de la POO.
    private String carnet, nombres, apellidos, direccion, telefono, email, fechaNacimiento;

    // Métodos públicos "getter" y "setter" para acceder y modificar cada atributo

    // Retorna el valor del atributo carnet
    public String getCarnet() { return carnet; }

    // Asigna un valor al atributo carnet
    public void setCarnet(String carnet) { this.carnet = carnet; }

    // Retorna el valor del atributo nombres
    public String getNombres() { return nombres; }

    // Asigna un valor al atributo nombres
    public void setNombres(String nombres) { this.nombres = nombres; }

    // Retorna el valor del atributo apellidos
    public String getApellidos() { return apellidos; }

    // Asigna un valor al atributo apellidos
    public void setApellidos(String apellidos) { this.apellidos = apellidos; }

    // Retorna el valor del atributo direccion
    public String getDireccion() { return direccion; }

    // Asigna un valor al atributo direccion
    public void setDireccion(String direccion) { this.direccion = direccion; }

    // Retorna el valor del atributo telefono
    public String getTelefono() { return telefono; }

    // Asigna un valor al atributo telefono
    public void setTelefono(String telefono) { this.telefono = telefono; }

    // Retorna el valor del atributo email
    public String getEmail() { return email; }

    // Asigna un valor al atributo email
    public void setEmail(String email) { this.email = email; }

    // Retorna el valor del atributo fechaNacimiento
    public String getFechaNacimiento() { return fechaNacimiento; }

    // Asigna un valor al atributo fechaNacimiento
    public void setFechaNacimiento(String fechaNacimiento) { this.fechaNacimiento = fechaNacimiento; }
}
