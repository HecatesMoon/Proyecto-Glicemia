package com.grupo_cuatro.glicem_ia.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo_cuatro.glicem_ia.modelos.AlimentacionDia;
import com.grupo_cuatro.glicem_ia.modelos.Glucosa;
import com.grupo_cuatro.glicem_ia.modelos.Medicamento;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioAlimentacionDia;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioGlucosa;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioMedicamento;
import com.grupo_cuatro.glicem_ia.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorPRUEBAS {

    private final RepositorioGlucosa repositorioGlucosa;
    @Autowired
    private ServicioUsuario servicioUsuario;

    private final RepositorioMedicamento repositorioMedicamento;
    private final RepositorioAlimentacionDia repositorioAlimentacionDia;

    public ControladorPRUEBAS(RepositorioMedicamento repositorioMedicamento,
                                RepositorioAlimentacionDia repositorioAlimentacionDia, RepositorioGlucosa repositorioGlucosa) {
        this.repositorioMedicamento = repositorioMedicamento;
        this.repositorioAlimentacionDia = repositorioAlimentacionDia;
        this.repositorioGlucosa = repositorioGlucosa;
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
public String mostrarAnalisisDeAlimentos(Model model) {
    if (!model.containsAttribute("nuevaAlimentacion")) {
        model.addAttribute("nuevaAlimentacion", new AlimentacionDia());
    }
    return "analisis";
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

}



