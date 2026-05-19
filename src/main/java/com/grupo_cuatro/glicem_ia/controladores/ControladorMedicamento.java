package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.grupo_cuatro.glicem_ia.modelos.Medicamento;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioMedicamento;
import com.grupo_cuatro.glicem_ia.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class ControladorMedicamento {

    private final ServicioUsuario servicioUsuario;
    private final RepositorioMedicamento repositorioMedicamento;

    ControladorMedicamento(RepositorioMedicamento repositorioMedicamento, ServicioUsuario servicioUsuario){
        this.repositorioMedicamento = repositorioMedicamento;
        this.servicioUsuario = servicioUsuario;
    }

    @GetMapping("/medicamentos")
    public String medicamento(Model modelo, HttpSession sesion){
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        Usuario usuario = servicioUsuario.obtenerPorId(idUsuario);

        modelo.addAttribute("nuevoMedicamento", new Medicamento()); //ESTE TIENE QUE SER IGUAL QUE EL DEL AGGERGAR MEDICAMENTO
        modelo.addAttribute("registrosMedicamentos", repositorioMedicamento.findByUsuarioOrderByFechaDesc(usuario));
        return "medicamentos";
    }

    @PostMapping("/agregar/medicamento")
    public String postMethodName(@Valid @ModelAttribute("nuevoMedicamento") Medicamento nuevoMedicamento,
                                BindingResult resultado,
                                HttpSession sesion,
                                RedirectAttributes redirectAttrs) {
        
        if (resultado.hasErrors()) {
            return "medicamentos";
            
        }

        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        Usuario usuario = servicioUsuario.obtenerPorId(idUsuario);

        nuevoMedicamento.setUsuario(usuario); //Asignar el usuario al medicamento

        repositorioMedicamento.save(nuevoMedicamento);

        redirectAttrs.addFlashAttribute("mensajeAgregaExito", "Medicamento registrada correctamente.");
        return "redirect:/medicamentos";
    }


    @PostMapping("/eliminar/medicamento/{id}")
        public String eliminarMedicamento(@PathVariable("id") Long id, HttpSession sesion, RedirectAttributes redirectAttrs) {
                                            Long idUsuario = (Long) sesion.getAttribute("id_usuario");
                                            Usuario usuario = servicioUsuario.obtenerPorId(idUsuario);

        Medicamento medicamento = repositorioMedicamento.findById(id).orElse(null);

        if (medicamento != null && medicamento.getUsuario().getId().equals(usuario.getId())) {
            repositorioMedicamento.delete(medicamento);
            redirectAttrs.addFlashAttribute("mensajeExito", "Medicamento eliminado correctamente.");
        } else {
            redirectAttrs.addFlashAttribute("mensajeError", "No se pudo eliminar el medicamento.");
        }

        return "redirect:/medicamentos";

    }
    
}
