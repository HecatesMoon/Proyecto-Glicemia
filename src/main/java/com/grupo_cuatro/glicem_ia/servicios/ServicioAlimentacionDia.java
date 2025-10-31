package com.grupo_cuatro.glicem_ia.servicios;

import java.time.LocalDate;
import java.util.List;


import org.springframework.stereotype.Service;

import com.grupo_cuatro.glicem_ia.modelos.AlimentacionDia;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioAlimentacionDia;

@Service
public class ServicioAlimentacionDia {

    private final RepositorioAlimentacionDia repositorioAlimentacionDia;

    public ServicioAlimentacionDia(RepositorioAlimentacionDia repositorioAlimentacionDia){
        this.repositorioAlimentacionDia = repositorioAlimentacionDia;
    }

    public AlimentacionDia guardarAlimentacionDia(AlimentacionDia alimentacionDia) {
        return repositorioAlimentacionDia.save(alimentacionDia);
    }


    public List<AlimentacionDia> listarPorUsuarioId(Long usuarioId) {
        return repositorioAlimentacionDia.findByUsuarioId(usuarioId);
    }

    public List<AlimentacionDia> listarPorUsuarioYFecha(Long usuarioId, LocalDate fecha) {
        return repositorioAlimentacionDia.findByUsuarioIdAndFecha(usuarioId, fecha);
    }

    public void eliminarAlimentacionDia(Long id){
        repositorioAlimentacionDia.deleteById(id);
    }


}
