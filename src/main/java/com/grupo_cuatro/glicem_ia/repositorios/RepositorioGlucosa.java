package com.grupo_cuatro.glicem_ia.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo_cuatro.glicem_ia.modelos.Glucosa;

@Repository
public interface RepositorioGlucosa extends CrudRepository<Glucosa, Long>{
    Glucosa save(Glucosa nuevoGlucosa);
    List<Glucosa> findAll();
    
} 

