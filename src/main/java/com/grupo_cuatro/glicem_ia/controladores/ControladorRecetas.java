package com.grupo_cuatro.glicem_ia.controladores;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.grupo_cuatro.glicem_ia.modelos.Receta;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.servicios.ServicioReceta;
import com.grupo_cuatro.glicem_ia.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorRecetas {

    private final ServicioReceta servicioReceta;
    private final ServicioUsuario servicioUsuario;
    
    public ControladorRecetas(ServicioReceta servicioReceta,
                            ServicioUsuario servicioUsuario){
        this.servicioReceta = servicioReceta;
        this.servicioUsuario = servicioUsuario;
    }



    @GetMapping("/recetas")
    public String mostrarRecetas(Model modelo, HttpSession sesion){
        if (sesion.getAttribute("id_usuario")== null) {
            return "redirect:/login";
        }
        List<Receta> listaRecetas = servicioReceta.listarTodas();
        modelo.addAttribute("listaRecetas", listaRecetas);
        return "recetas";
    }



    @GetMapping("/formulario/receta")
    public String formularioReceta(@ModelAttribute("nuevaReceta") Receta nuevaReceta, HttpSession sesion){
        if (sesion.getAttribute("id_usuario") == null) {
            return "redirect:/login";
        }
        return "formularioReceta";
    }



    @GetMapping("/detalle/receta/{idReceta}")
    public String detalleReceta(Model modelo, @PathVariable Long idReceta, HttpSession sesion){
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        if (sesion.getAttribute("id_usuario") == null) {
            return "redirect:/login";
        }
        Receta receta = this.servicioReceta.obtenerUna(idReceta);
        boolean esCreador = receta.getUsuario().getId().equals(idUsuario);
        modelo.addAttribute("esCreador", esCreador);
        modelo.addAttribute("receta", receta);
        return "detalleReceta";
    }



    @GetMapping("/formulario/editar/receta/{idReceta}")
    public String editarReceta(Model modelo, @PathVariable Long idReceta, HttpSession sesion){
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        if (sesion.getAttribute("id_usuario") == null) {
            return "redirect:/login";
        }
        Receta receta = this.servicioReceta.obtenerUna(idReceta);
        if (!receta.getUsuario().getId().equals(idUsuario)) {
            return "redirect:/recetas";
            
        }
        modelo.addAttribute("receta", receta);
        return "editarReceta";
    }



    @GetMapping("/misRecetas")
    public String misRecetas(HttpSession sesion, Model modelo) {
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        if (idUsuario == null) {
            return "redirect:/login";
        }
        List<Receta> misRecetas = servicioReceta.obtenerRecetasPorUsuarioId(idUsuario);
        modelo.addAttribute("misRecetas", misRecetas);
        return "misRecetas";
    }


    @PostMapping("/agregar/receta")
    public String agregarReceta(@Valid @ModelAttribute("nuevaReceta") Receta nuevaReceta,
                                @RequestParam("archivoImagen") MultipartFile archivo,
                                BindingResult validaciones,
                                HttpSession sesion) {

        // 1. Verificar sesión
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        if (idUsuario == null) {
            return "redirect:/login";
        }

        // 2. Validaciones
        if (validaciones.hasErrors()) {
            return "formularioReceta";
        }

        // 3. Asignar usuario a la receta
        Usuario usuario = servicioUsuario.obtenerPorId(idUsuario);
        nuevaReceta.setUsuario(usuario);

        // 4. Guardar imagen si se sube una
        if (!archivo.isEmpty()) {
            try {
                String nombreArchivo = archivo.getOriginalFilename();
                Path ruta = Paths.get("src/main/resources/static/uploads/" + nombreArchivo);

                Files.createDirectories(ruta.getParent()); // crea la carpeta si no existe
                Files.write(ruta, archivo.getBytes());      // guarda el archivo

                nuevaReceta.setImagenReceta(nombreArchivo);

            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("⚠ Error al guardar la imagen");
            }
        }

        // 5. Guardar receta
        servicioReceta.agregarUna(nuevaReceta);

        return "redirect:/recetas";
    }    



    @DeleteMapping("/eliminar/receta/{idReceta}")
    public String eliminarReceta(@PathVariable Long idReceta, HttpSession sesion){
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        if (sesion.getAttribute("id_usuario") == null) {
            return "redirect:/login";
        }
        Receta receta = this.servicioReceta.obtenerUna(idReceta);
        if (!receta.getUsuario().getId().equals(idUsuario)) {
            return "redirect:/recetas";
        }

        servicioReceta.eliminarReceta(idReceta);
        return "redirect:/misRecetas";
    }



    @PutMapping("/actualizar/receta/{idReceta}")
    public String actualizatReceta(@Valid @ModelAttribute("receta") Receta receta,
                                    BindingResult validaciones, @PathVariable Long idReceta,
                                    HttpSession sesion){
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        if (sesion.getAttribute("id_usuario") == null) {
            return "redirect:/login";
        }
        if (validaciones.hasErrors()) {
            return "editarReceta";
        }
        Receta recetaExiste = servicioReceta.obtenerUna(idReceta);
        if (!recetaExiste.getUsuario().getId().equals(idUsuario)) {
            return "redirect:/recetas";
        }

        Usuario usuario = this.servicioUsuario.obtenerPorId(idUsuario);
        receta.setUsuario(usuario);
        receta.setId(idReceta);
        this.servicioReceta.actualizarReceta(receta);
        return "redirect:/misRecetas";
    }
}
