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

        // Actualizar perfil existente
    public Usuario actualizarUsuario(Long idUsuario, Usuario datosActualizados){
        Usuario usuarioExistente = obtenerPorId(idUsuario);
        if (usuarioExistente == null) return null;

        usuarioExistente.setNombre(datosActualizados.getNombre());
        usuarioExistente.setApellido(datosActualizados.getApellido());
        usuarioExistente.setCorreo(datosActualizados.getCorreo());
        usuarioExistente.setTipoDiabetes(datosActualizados.getTipoDiabetes());
        usuarioExistente.setFechaNacimiento(datosActualizados.getFechaNacimiento());
        usuarioExistente.setContactoEmergencia(datosActualizados.getContactoEmergencia());
        usuarioExistente.setRecibirNotificaciones(datosActualizados.getRecibirNotificaciones());
        usuarioExistente.setModoOscuro(datosActualizados.getModoOscuro());
        usuarioExistente.setImagenPerfil(datosActualizados.getImagenPerfil());


        // Si el usuario quiere cambiar contraseña
        if (datosActualizados.getContrasenia() != null && !datosActualizados.getContrasenia().isEmpty()) {
            String contraseniaEncriptada = BCrypt.hashpw(datosActualizados.getContrasenia(), BCrypt.gensalt());
            usuarioExistente.setContrasenia(contraseniaEncriptada);
        }

        return repositorioUsuario.save(usuarioExistente);
    }

    // Eliminar cuenta
    public void eliminarUsuario(Long idUsuario){
        repositorioUsuario.deleteById(idUsuario);
    }
}



