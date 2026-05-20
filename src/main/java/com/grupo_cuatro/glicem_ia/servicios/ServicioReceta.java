package com.grupo_cuatro.glicem_ia.servicios;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import com.grupo_cuatro.glicem_ia.modelos.Receta;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioReceta;

@Service
public class ServicioReceta {
    
    private final RepositorioReceta repositorioReceta;

    public ServicioReceta(RepositorioReceta repositorioReceta){
        this.repositorioReceta = repositorioReceta;
    }
    
    public Receta agregarUna(Receta nuevaReceta){
        return this.repositorioReceta.save(nuevaReceta);
    }
    public List<Receta> listarTodas() {
        return  this.repositorioReceta.findAll();
    }

    public Optional<Receta> buscarPorId(Long id){
        return this.repositorioReceta.findById(id);
    }
    
    public Receta obtenerUna(Long idReceta){
        return this.repositorioReceta.findById(idReceta).orElse(null);
    }

    public Receta guardarReceta(Receta receta){
        return this.repositorioReceta.save(receta);
    }

    public void eliminarReceta(Long id){
        repositorioReceta.deleteById(id);
    }

    public Receta actualizarReceta(Receta receta){
        return this.repositorioReceta.save(receta);
    }

    public List<Receta> obtenerRecetasPorUsuarioId(Long idUsuario) {
        return this.repositorioReceta.findByUsuarioId(idUsuario);
    }
}
