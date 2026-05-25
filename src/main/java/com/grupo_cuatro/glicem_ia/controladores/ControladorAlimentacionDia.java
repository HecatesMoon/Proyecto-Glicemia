package com.grupo_cuatro.glicem_ia.controladores;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo_cuatro.glicem_ia.modelos.AlimentacionDia;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioAlimentacionDia;
import com.grupo_cuatro.glicem_ia.servicios.ServicioAlimentacionDia;
import com.grupo_cuatro.glicem_ia.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorAlimentacionDia {

    private final RepositorioAlimentacionDia repositorioAlimentacionDia; //todo: repo y servicio?
    private final ServicioAlimentacionDia servicioAlimentacionDia;
    private final ServicioUsuario servicioUsuario;

    public ControladorAlimentacionDia(RepositorioAlimentacionDia repositorioAlimentacionDia,
                                      ServicioAlimentacionDia servicioAlimentacionDia,
                                      ServicioUsuario servicioUsuario) {
        this.repositorioAlimentacionDia = repositorioAlimentacionDia;
        this.servicioAlimentacionDia = servicioAlimentacionDia;
        this.servicioUsuario = servicioUsuario;
    }

    @GetMapping("/analisis")
    public String mostrarAnalisisAlimentacion(Model modelo, HttpSession sesion) {
        if (sesion.getAttribute("id_usuario") == null) {return "redirect:/login";}
        if (!modelo.containsAttribute("nuevaAlimentacion")){
            modelo.addAttribute("nuevaAlimentacion", new AlimentacionDia());
        }
        return "analisis";
    }
    

    //Formulario de registro de alimentación diaria
    @GetMapping("/alimentacion")
    public String mostrarFormularioAlimentacionDia(Model modelo, HttpSession sesion){
        if (sesion.getAttribute("id_usuario") == null) {
        return "redirect:/login";
        }
        modelo.addAttribute("alimentacion", new AlimentacionDia());
        return "alimentacion/formulario"; //todo: no existe
    }

    @GetMapping("/comidas")
    public String listarComidasPorUsuario(@RequestParam Long usuarioId,
                                            Model modelo, HttpSession sesion){
        if (sesion.getAttribute("id_usuario") == null) {
        return "redirect:/login";
        }
        List<AlimentacionDia> comidas = servicioAlimentacionDia.listarPorUsuarioId(usuarioId);
        modelo.addAttribute("comidas", comidas);
        return "alimentacion/lista_comidas"; //todo: no existe
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
        return "alimentacion/lista"; //todo: no existe
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

    @PostMapping("/agregar/alimentacion")
    public String agregarAlimentacion(
            @Valid @ModelAttribute("nuevaAlimentacion") AlimentacionDia nuevaAlimentacion,
            BindingResult resultado,
            HttpSession sesion,
            RedirectAttributes redirectAttrs) {

        if (resultado.hasErrors()) {
            return "redirect:/analisis";
        }

        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        Usuario usuario = servicioUsuario.obtenerPorId(idUsuario);

        nuevaAlimentacion.setUsuario(usuario);
        repositorioAlimentacionDia.save(nuevaAlimentacion);

        redirectAttrs.addFlashAttribute("mensajeAlimExito", "Registro de alimentación agregado correctamente.");
        return "redirect:/analisis";
    }
}
