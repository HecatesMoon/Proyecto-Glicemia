package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.grupo_cuatro.glicem_ia.servicios.ServicioChat;

@Controller
public class ControladorChat {
    @Autowired
    private final ServicioChat servicioChat;

    public ControladorChat(ServicioChat servicioChat){
        this.servicioChat = servicioChat;
    }

    @GetMapping("/asistente")
    public String asistente(){
        return "asistente";
    }
}
