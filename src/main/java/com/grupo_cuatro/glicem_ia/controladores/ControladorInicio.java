package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControladorInicio {
    

    @GetMapping("/inicio")
    public String inicio(){
        return "inicio";
    }


}
