package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ControladorGlucosa {
    @GetMapping("/glucosa")
    public String glucosa() {
        return "glucosa";
    }
    
}
