package com.grupo_cuatro.glicem_ia.repositorios;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.grupo_cuatro.glicem_ia.modelos.AlimentacionDia;

public interface RepositorioAlimentacionDia extends CrudRepository<AlimentacionDia, Long> {
    
    // Buscar todas las comidas de un usuario
    List<AlimentacionDia> findByUsuarioId(Long usuarioId);

    // Buscar comidas de un usuario en una fecha específica
    List<AlimentacionDia> findByUsuarioIdAndFecha(Long usuarioId, LocalDate fecha);
}
    

