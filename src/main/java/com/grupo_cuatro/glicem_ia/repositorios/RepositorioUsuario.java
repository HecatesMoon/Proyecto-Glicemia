package com.grupo_cuatro.glicem_ia.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import java.util.List;


@Repository
public interface RepositorioUsuario extends CrudRepository<Usuario, Long> {
    Usuario findByCorreo(String correo);

    Usuario save(Usuario nuevoUsuario);
    
}
