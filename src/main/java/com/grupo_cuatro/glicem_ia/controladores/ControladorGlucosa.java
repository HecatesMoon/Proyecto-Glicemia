package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.grupo_cuatro.glicem_ia.modelos.AlimentacionDia;
import com.grupo_cuatro.glicem_ia.modelos.Glucosa;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioGlucosa;

import com.grupo_cuatro.glicem_ia.servicios.ServicioUsuario;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class ControladorGlucosa {
    
    private final ServicioUsuario servicioUsuario;
    private final RepositorioGlucosa repositorioGlucosa;

    ControladorGlucosa(RepositorioGlucosa repositorioGlucosa, ServicioUsuario servicioUsuario) {
        this.repositorioGlucosa = repositorioGlucosa;
        this.servicioUsuario = servicioUsuario;
    }

    @GetMapping("/glucosa")
public String glucosa(Model model, HttpSession sesion) {
    Long idUsuario = (Long) sesion.getAttribute("id_usuario");
    Usuario usuario = servicioUsuario.obtenerPorId(idUsuario);

    // 🧩 Asegurar ambos objetos si la vista tiene dos formularios
    if (!model.containsAttribute("nuevoGlucosa")) {
        model.addAttribute("nuevoGlucosa", new Glucosa());
    }
    if (!model.containsAttribute("nuevaAlimentacion")) {
        model.addAttribute("nuevaAlimentacion", new AlimentacionDia());
    }

    model.addAttribute("registrosGlucosa", repositorioGlucosa.findByUsuarioOrderByFechaDesc(usuario));

    return "glucosa";
}


    @PostMapping("/agregar/glucosa")
    public String postMethodName(@Valid @ModelAttribute("nuevoGlucosa") Glucosa nuevaGlucosa,
                                BindingResult resultado,
                                HttpSession sesion,
                                RedirectAttributes redirectAttrs) {
        if (resultado.hasErrors()) {
            return "glucosa";
        }

        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        Usuario usuario = servicioUsuario.obtenerPorId(idUsuario);

        /* unidireccional  */
        /* nuevaGlucosa.setUsuario(usuario);
        nuevaGlucosa.setValorMmolL(nuevaGlucosa.getValorMgDl() * 0.0555);  */

        nuevaGlucosa.setUsuario(usuario);

        /* conversion bidireccional */
        if (nuevaGlucosa.getValorMgDl() != null && nuevaGlucosa.getValorMmolL() == null) {
            nuevaGlucosa.setValorMmolL(nuevaGlucosa.getValorMgDl() * 0.0555);
        } else if (nuevaGlucosa.getValorMmolL() != null && nuevaGlucosa.getValorMmolL() == null) {
            nuevaGlucosa.setValorMgDl((int) Math.round(nuevaGlucosa.getValorMmolL()/ 0.555 ));

        }

        repositorioGlucosa.save(nuevaGlucosa);

        redirectAttrs.addFlashAttribute("mensajeExito", "Glucosa registrada correctamente.");
        return "redirect:/glucosa";
    }



}
