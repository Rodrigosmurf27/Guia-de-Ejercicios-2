//Manuel Alejandro Chavarria Velasquez-CV211229
package com.empresa.beans;

import java.util.Date;
import java.util.concurrent.TimeUnit;
public class Persona {
    private String nombre;
    private String apellido;
    private double salario;
    private Date fechaIngreso;

    // Constructor, getters y setters

    public Persona(String nombre, String apellido, double salario, Date fechaIngreso) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.salario = salario;
        this.fechaIngreso = fechaIngreso;
    }

    // Getters y Setters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    //metodo para calcular días de vacaciones
    public int calcularDiasVacaciones() throws IllegalArgumentException {
        try {
            // Validaciones
            if (fechaIngreso == null) {
                throw new IllegalArgumentException("Fecha de ingreso no proporcionada");
            }

            Date hoy = new Date();
            if (fechaIngreso.after(hoy)) {
                throw new IllegalArgumentException("Fecha de ingreso no puede ser futura");
            }

            // Cálculo preciso con TimeUnit
            long diffInDays = TimeUnit.DAYS.convert(
                    hoy.getTime() - fechaIngreso.getTime(),
                    TimeUnit.MILLISECONDS
            );

            int años = (int) (diffInDays / 365);

            // Lógica de días de vacaciones
            if (años >= 5) return 21;
            if (años >= 3) return 15;
            if (años >= 1) return 10;
            return 0;

        } catch (Exception e) {
            // Loggear error
            System.err.println("Error calculando vacaciones: " + e.getMessage());
            throw e; // Relanzar para manejo superior
        }
    }
}