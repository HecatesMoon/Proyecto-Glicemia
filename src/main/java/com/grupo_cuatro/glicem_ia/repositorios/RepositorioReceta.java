package com.grupo_cuatro.glicem_ia.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grupo_cuatro.glicem_ia.modelos.Receta;

public interface RepositorioReceta extends JpaRepository<Receta, Long >{
    
    Receta save(Receta nuevaReceta);
    List<Receta> findAll();

    List<Receta> findByUsuarioId(Long idUsuario);
}
