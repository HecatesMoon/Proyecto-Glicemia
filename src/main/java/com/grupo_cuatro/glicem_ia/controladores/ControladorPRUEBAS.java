package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo_cuatro.glicem_ia.modelos.Medicamento;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioMedicamento;
import com.grupo_cuatro.glicem_ia.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorPRUEBAS {
    @Autowired
    private ServicioUsuario servicioUsuario;

    private final RepositorioMedicamento repositorioMedicamento;

    ControladorPRUEBAS(RepositorioMedicamento repositorioMedicamento){
        this.repositorioMedicamento = repositorioMedicamento;
    }

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

