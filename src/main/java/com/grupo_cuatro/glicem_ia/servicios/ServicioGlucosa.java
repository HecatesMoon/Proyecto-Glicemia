package com.grupo_cuatro.glicem_ia.servicios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo_cuatro.glicem_ia.modelos.Glucosa;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioGlucosa;

@Service
public class ServicioGlucosa {
    @Autowired
    private final RepositorioGlucosa repositorioGlucosa;

    public ServicioGlucosa(RepositorioGlucosa repositorioGlucosa){
        this.repositorioGlucosa = repositorioGlucosa;
    }

    public Glucosa agregarUno(Glucosa nuevoGlucosa){
        return this.repositorioGlucosa.save(nuevoGlucosa);
    }


}
