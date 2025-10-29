package com.grupo_cuatro.glicem_ia.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.grupo_cuatro.glicem_ia.modelos.HistorialChat;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;

public interface RepositorioChat extends CrudRepository<HistorialChat, Long>{
    //TODO: Cambiar a buscar chats por usuario
    List<HistorialChat> findAll();

    HistorialChat findByUsuarioId(Long id);
    List<HistorialChat> findByUsuarioOrderByFechaMensajeAsc(Usuario usuario);
}
