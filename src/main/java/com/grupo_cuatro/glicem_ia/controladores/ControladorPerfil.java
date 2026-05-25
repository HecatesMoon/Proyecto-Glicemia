package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorPerfil {
    private final ServicioUsuario servicioUsuario;
    public ControladorPerfil(ServicioUsuario servicioUsuario){
        this.servicioUsuario = servicioUsuario;
    }

    // Mostrar perfil
    @GetMapping("/perfil")
    public String verPerfil(HttpSession sesion, Model modelo){
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        if (idUsuario == null) return "redirect:/login";

        Usuario usuario = servicioUsuario.obtenerPorId(idUsuario);
        modelo.addAttribute("usuario", usuario);
        return "perfil"; // tu vista perfil.jsp
    }

    // Actualizar perfil
    @PostMapping("/perfil/actualizar")
    public String actualizarPerfil(@Valid @ModelAttribute("usuario") Usuario usuarioForm,
                                    BindingResult validaciones,
                                    HttpSession sesion,
                                    RedirectAttributes redirectAttributes){
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        if (idUsuario == null) return "redirect:/login";
        
        // Validar correo único si lo cambió
        Usuario usuarioConCorreo = servicioUsuario.obtenerPorCorreo(usuarioForm.getCorreo());
        if (usuarioConCorreo != null && !usuarioConCorreo.getId().equals(idUsuario)) {
            validaciones.rejectValue("correo", "correoDuplicado", "Este correo ya está en uso");
        }

        if (validaciones.hasErrors()) {
            return "perfil";
        }

        Usuario usuarioActualizado = (Usuario) servicioUsuario.actualizarUsuario(idUsuario, usuarioForm);

        if (usuarioActualizado == null){redirectAttributes.addFlashAttribute("usuarioNoExiste", "Ocurrio un error, este usuario no existe");}

        return "redirect:/perfil";
    }

    // Eliminar cuenta
    @PostMapping("/perfil/eliminar")
    public String eliminarCuenta(HttpSession sesion){
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        if (idUsuario != null) {
            servicioUsuario.eliminarUsuario(idUsuario);
            sesion.invalidate();
        }
        return "redirect:/registro";
    }
}



