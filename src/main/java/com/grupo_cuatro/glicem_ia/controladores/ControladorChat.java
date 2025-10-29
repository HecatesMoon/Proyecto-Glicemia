package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.grupo_cuatro.glicem_ia.modelos.ChatPromptDto;
import com.grupo_cuatro.glicem_ia.servicios.ServicioChat;

import jakarta.validation.Valid;

@Controller
public class ControladorChat {
    @Autowired
    private final ServicioChat servicioChat;

    public ControladorChat(ServicioChat servicioChat){
        this.servicioChat = servicioChat;
    }

    @GetMapping("/asistente")
    public String asistente(@ModelAttribute("nuevoPrompt") ChatPromptDto nuevoPrompt, Model modelo){
        modelo.addAttribute("historialChat", servicioChat.obtenerTodos());
        return "asistente";
    }

    @PostMapping("/asistente/enviar")
    public String asistenteEnviar(  @Valid @ModelAttribute("nuevoPrompt") ChatPromptDto nuevoPrompt,
                                    BindingResult validaciones,
                                    Model modelo){
        if (validaciones.hasErrors()) {
            modelo.addAttribute("historialChat", servicioChat.obtenerTodos());
            return "asistente";
        }
        
        return "redirect:/asistente";
    }
}
