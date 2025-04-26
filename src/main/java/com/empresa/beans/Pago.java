//Rodrigo Alberto Velasco Herrera -VH192433

package com.empresa.beans;

import com.empresa.interfaces.IPago;

/**
 * Clase que representa un pago, considerando si el cliente es VIP.
 */
public class Pago implements IPago {
    private double precio;   // Precio base del servicio
    private boolean esVip;   // Indica si el cliente es VIP

    // Constructor que recibe el precio del servicio y si el cliente es VIP
    public Pago(double precio, boolean esVip) {
        this.precio = precio;
        this.esVip = esVip;
    }

    // Calcula el total a pagar con descuento si es VIP (15%)
    @Override
    public double totalPago() {
        return esVip ? precio * 0.85 : precio;
    }
}
