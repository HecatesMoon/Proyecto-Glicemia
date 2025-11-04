package com.grupo_cuatro.glicem_ia.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grupo_cuatro.glicem_ia.modelos.Glucosa;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;

@Repository
public interface RepositorioGlucosa extends JpaRepository<Glucosa, Long> {
    Glucosa save(Glucosa nuevaGlucosa);
    List<Glucosa> findByUsuarioOrderByFechaDesc(Usuario usuario);
    
}



