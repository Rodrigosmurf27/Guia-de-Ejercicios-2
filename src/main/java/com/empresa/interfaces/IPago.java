//Rodrigo Alberto Velasco Herrera -VH192433

package com.empresa.interfaces;

/**
 * Interfaz que define el contrato para calcular el pago total.
 * Cualquier clase que implemente esta interfaz debe proporcionar
 * una implementación del método totalPago().
 */
public interface IPago {
    /**
     * Calcula el total a pagar.
     *
     * @return el monto total que debe pagar el cliente.
     */
    double totalPago();
}

