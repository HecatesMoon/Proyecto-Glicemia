package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

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
    @Autowired
    private ServicioUsuario servicioUsuario;

    private final RepositorioMedicamento repositorioMedicamento;

    ControladorMedicamento(RepositorioMedicamento repositorioMedicamento){
        this.repositorioMedicamento = repositorioMedicamento;
    }

    @GetMapping("/medicamentos")
    public String medicamento(Model modelo, HttpSession sesion){
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        Usuario usuario = servicioUsuario.obtenerPorId(idUsuario);

        modelo.addAttribute("nuevoMedicamento", new Medicamento()); //ESTE TIENE QUE SER IGUAL QUE EL DEL AGGERGAR MEDICAMENTO
        modelo.addAttribute("registrosMedicamentos", repositorioMedicamento.findByUsuarioOrderByFechaDesc(usuario));
        return "medicamentos";
    }

    //@PostMapping("/agregar/medicamento")
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

        redirectAttrs.addFlashAttribute("mensajeExito", "Medicamento registrada correctamente.");
        return "medicamentos";
    }

}
