package com.grupo_cuatro.glicem_ia.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grupo_cuatro.glicem_ia.modelos.Usuario;



@Repository
public interface RepositorioUsuario extends JpaRepository<Usuario, Long> {
    Usuario findByCorreo(String correo);

    Usuario save(Usuario nuevoUsuario);

    
}
