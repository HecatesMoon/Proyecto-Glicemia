package com.grupo_cuatro.glicem_ia.servicios;

import org.springframework.stereotype.Service;
import java.time.LocalDate;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioPago;
import com.grupo_cuatro.glicem_ia.modelos.Pago;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;

@Service
public class ServicioPago {

    private final RepositorioPago repositorioPago;

    ServicioPago (RepositorioPago repositorioPago){
        this.repositorioPago = repositorioPago;
    }

    public Pago crearPago(Usuario usuario, String plan, 
                        String numeroTarjeta, 
                        String fechaVencimiento, String cvc) {
        Pago pago = new Pago();
        pago.setUsuario(usuario);
        pago.setPlan(plan);
        pago.setNumeroTarjeta(numeroTarjeta);
        pago.setFechaVencimiento(fechaVencimiento);
        pago.setCvc(cvc);
        pago.setFechaActivacion(LocalDate.now());
        pago.setActivo(true);
        return repositorioPago.save(pago);
    }

    public Pago obtenerPagoPorId(Long idUsuario) {
        return repositorioPago.findById(idUsuario).orElse(null);
    }

    public Pago registrarPago(Pago pago) {
        pago.setFechaActivacion(LocalDate.now());
        pago.setActivo(true);
        return repositorioPago.save(pago);
    }
}