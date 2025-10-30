package com.grupo_cuatro.glicem_ia.servicios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioPago;
import com.grupo_cuatro.glicem_ia.modelos.Pago;

@Service
public class ServicioPago {

    @Autowired
    private RepositorioPago repo;

    public Pago registrarPago(Integer valor, String descripcion) {
        Pago pago = new Pago(valor, descripcion, LocalDate.now());
        return repo.save(pago);
    }

    public Pago obtenerPagoPorId(Long id) {
    return repo.findById(id).orElse(null);
    }
}