package com.grupo_cuatro.glicem_ia.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.grupo_cuatro.glicem_ia.modelos.Pago;

@Repository
public interface RepositorioPago extends JpaRepository<Pago, Long> {
}