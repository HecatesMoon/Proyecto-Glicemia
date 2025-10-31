package com.grupo_cuatro.glicem_ia.controladores;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grupo_cuatro.glicem_ia.modelos.AlimentacionDia;
import com.grupo_cuatro.glicem_ia.servicios.ServicioAlimentacionDia;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorAlimentacionDia {
    
    private final ServicioAlimentacionDia servicioAlimentacionDia;

    public ControladorAlimentacionDia(ServicioAlimentacionDia servicioAlimentacionDia){
        this.servicioAlimentacionDia = servicioAlimentacionDia;
    }
    
    //Formulario de registro de alimentación diaria
    @GetMapping("/")
    public String mostrarFormularioAlimentacionDia(Model modelo, HttpSession sesion){
        if (sesion.getAttribute("id_usuario") == null) {
        return "redirect:/login";
    }
        modelo.addAttribute("alimentacion", new AlimentacionDia());
        return "alimentacion/formulario";
    }

    @GetMapping("/comidas")
    public String listarComidasPorUsuario(@RequestParam Long usuarioId,
                                            Model modelo, HttpSession sesion){
        if (sesion.getAttribute("id_usuario") == null) {
        return "redirect:/login";
        }
        List<AlimentacionDia> comidas = servicioAlimentacionDia.listarPorUsuarioId(usuarioId);
        modelo.addAttribute("comidas", comidas);
        return "alimentacion/lista_comidas";
    }

    @GetMapping("/listarPorFecha")
    public String listarPorUsuarioYFecha(@RequestParam Long usuarioId,
                                        @RequestParam String fecha,
                                        Model modelo, HttpSession sesion){ 
    if (sesion.getAttribute("id_usuario") == null) {
        return "redirect:/login";
        }
        LocalDate fechaParseada = LocalDate.parse(fecha);
        List<AlimentacionDia> comidas = servicioAlimentacionDia.listarPorUsuarioYFecha(usuarioId, fechaParseada);
        modelo.addAttribute("comidas", comidas);
        return "alimentacion/lista"; 
    }


    @PostMapping("/guardarComida")
    public String guardarComida(@ModelAttribute AlimentacionDia alimentacionDia){
        servicioAlimentacionDia.guardarAlimentacionDia(alimentacionDia);
        return "redirect:/comidas";
    }


    @DeleteMapping("/eliminar/{idAlimentacion}")
public String eliminarAlimentacion(@PathVariable Long idAlimentacion, HttpSession sesion) {
    if (sesion.getAttribute("id_usuario") == null) {
        return "redirect:/login";
    }
    servicioAlimentacionDia.eliminarAlimentacionDia(idAlimentacion);
    return "redirect:/alimentacion/listar";
}
}
