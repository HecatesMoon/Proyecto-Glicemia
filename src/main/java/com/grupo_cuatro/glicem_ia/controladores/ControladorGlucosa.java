package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.grupo_cuatro.glicem_ia.modelos.Glucosa;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioGlucosa;

import com.grupo_cuatro.glicem_ia.servicios.ServicioUsuario;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class ControladorGlucosa {
    @Autowired
    private ServicioUsuario servicioUsuario;

    private final RepositorioGlucosa repositorioGlucosa;

    ControladorGlucosa(RepositorioGlucosa repositorioGlucosa) {
        this.repositorioGlucosa = repositorioGlucosa;
    }

    @GetMapping("/glucosa")
    public String glucosa(Model model, HttpSession sesion) {
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        Usuario usuario = servicioUsuario.obtenerPorId(idUsuario);

        model.addAttribute("nuevoGlucosa", new Glucosa());
        model.addAttribute("registrosGlucosa", repositorioGlucosa.findByUsuarioOrderByFechaDesc(usuario));

        return "glucosa";
    }


    @PostMapping("/agregar/glucosa")
    public String postMethodName(@ModelAttribute("nuevoGlucosa") Glucosa nuevaGlucosa,
                                BindingResult resultado,
                                HttpSession sesion,
                                RedirectAttributes redirectAttrs) {
        if (resultado.hasErrors()) {
            return "glucosa";
        }

        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        Usuario usuario = servicioUsuario.obtenerPorId(idUsuario);

        nuevaGlucosa.setUsuario(usuario);
        nuevaGlucosa.setValorMmolL(nuevaGlucosa.getValorMgDl() * 0.0555); 

        repositorioGlucosa.save(nuevaGlucosa);
        
        redirectAttrs.addFlashAttribute("mensajeExito", "Glucosa registrada correctamente.");
        return "redirect:/glucosa";
    }
    
}
