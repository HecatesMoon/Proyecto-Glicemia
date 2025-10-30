package com.grupo_cuatro.glicem_ia.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.grupo_cuatro.glicem_ia.modelos.Pago;

@Repository
public interface RepositorioPago extends CrudRepository<Pago, Long> {
}