package com.grupo_cuatro.glicem_ia.servicios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo_cuatro.glicem_ia.repositorios.RepositorioChat;

@Service
public class ServicioChat {
    @Autowired
    private final RepositorioChat repositorioChat;

    public ServicioChat (RepositorioChat repositorioChat){
        this.repositorioChat = repositorioChat;
    }

    
}
