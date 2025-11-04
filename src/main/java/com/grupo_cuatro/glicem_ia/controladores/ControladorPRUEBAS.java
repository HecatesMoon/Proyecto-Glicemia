package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControladorPRUEBAS {

    // 🧠 Muestra la vista principal de Funciones IA
    @GetMapping("/funcionesIA")
    public String mostrarFuncionesIA() {
        return "funcionesIA"; // /WEB-INF/funcionesIA.jsp
    }

    // 💳 Botones: Crear plan, Analizar tendencias, Activar análisis predictivo → llevan a pagar.jsp
    @GetMapping("/pagar")
    public String mostrarVistaPagar() {
        return "pagar"; // /WEB-INF/pagar.jsp
    }

    @GetMapping("/donaciones")
    public String mostrarDonacion() {
        return "donacion"; // /WEB-INF/pagar.jsp
    }

    @GetMapping("/home")
    public String mostrarLanding() {
        return "inicio"; // /WEB-INF/pagar.jsp
    }

    @GetMapping("/analisis")
    public String mostrarAnalisisDeAlimentos() {
        return "analisis"; // /WEB-INF/pagar.jsp
    }

    @GetMapping("/glucosa")
    public String mostrarGlucosa() {
        return "glucosa"; // /WEB-INF/pagar.jsp
    }

}

