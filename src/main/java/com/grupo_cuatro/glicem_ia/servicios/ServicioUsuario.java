package com.grupo_cuatro.glicem_ia.servicios;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioUsuario;

@Service
public class ServicioUsuario {
    @Autowired
    private final RepositorioUsuario repositorioUsuario;

    public ServicioUsuario(RepositorioUsuario repositorioUsuario){
        this.repositorioUsuario = repositorioUsuario;
    }

    public Usuario obtenerPorCorreo(String correo){
        return repositorioUsuario.findByCorreo(correo);
    }

    public Usuario agregarUno(Usuario nuevoUsuario){
        String contraseniaEncriptada = BCrypt.hashpw(nuevoUsuario.getContrasenia(), BCrypt.gensalt());
        nuevoUsuario.setContrasenia(contraseniaEncriptada);
        return this.repositorioUsuario.save(nuevoUsuario);
    }

    public Usuario obtenerPorId(Long idUsuario){
        return this.repositorioUsuario.findById(idUsuario).orElse(null);
    }
}
