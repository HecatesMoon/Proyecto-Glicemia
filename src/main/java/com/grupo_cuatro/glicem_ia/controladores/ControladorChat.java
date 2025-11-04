package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.grupo_cuatro.glicem_ia.modelos.ChatPromptDto;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.servicios.ServicioChat;
import com.grupo_cuatro.glicem_ia.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorChat {
    @Autowired
    private final ServicioChat servicioChat;
    @Autowired
    private final ServicioUsuario servicioUsuario;

    public ControladorChat(ServicioChat servicioChat, ServicioUsuario servicioUsuario){
        this.servicioChat = servicioChat;
        this.servicioUsuario = servicioUsuario;
    }

    @GetMapping("/asistente")
    public String asistente(@ModelAttribute("nuevoPrompt") ChatPromptDto nuevoPrompt, Model modelo, HttpSession sesion){
        if (sesion.getAttribute("id_usuario") == null) {
        return "redirect:/login";
        }
        Usuario usuario = servicioUsuario.obtenerPorId((Long) sesion.getAttribute("id_usuario"));
        modelo.addAttribute("historialChat", servicioChat.obtenerChatUsuario(usuario));
        return "asistente";
    }

    @PostMapping("/asistente/enviar")
    public String asistenteEnviar(  @Valid @ModelAttribute("nuevoPrompt") ChatPromptDto nuevoPrompt,
                                    BindingResult validaciones,
                                    Model modelo,
                                    HttpSession sesion){
        Usuario usuario = servicioUsuario.obtenerPorId((Long) sesion.getAttribute("id_usuario"));
        // Usuario usuario = servicioUsuario.obtenerPorId( 1L);
        if (validaciones.hasErrors()) {
            modelo.addAttribute("historialChat", servicioChat.obtenerChatUsuario(usuario));;
            return "asistente";
        }

        servicioChat.procesarMensaje(usuario.getId(), nuevoPrompt.getPrompt());
        // servicioChat.procesarMensaje(1L, nuevoPrompt.getPrompt());
        
        return "redirect:/asistente";
    }
}
