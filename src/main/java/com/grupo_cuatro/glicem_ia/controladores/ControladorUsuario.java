package com.grupo_cuatro.glicem_ia.controladores;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
=======
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
>>>>>>> develop

import com.grupo_cuatro.glicem_ia.modelos.LoginUsuario;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
>>>>>>> develop
public class ControladorUsuario {
    @Autowired
    private final ServicioUsuario servicioUsuario;

    public ControladorUsuario(ServicioUsuario servicioUsuario){
        this.servicioUsuario = servicioUsuario;
    }

    @GetMapping("/registro")
    public String registro(@ModelAttribute("nuevoUsuario") Usuario nuevUsuario){
        return "registro";
    }

    @GetMapping("/login")
    public String login(@ModelAttribute("loginUsuario") LoginUsuario loginUsuario){
        return "login";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession sesion){
        sesion.invalidate();
        return "redirect:/login";
    }

    @PostMapping("/agregar/usuario")
    public String agregarUsuario(@Valid @ModelAttribute("nuevoUsuario") Usuario nuevoUsuario,
                                BindingResult validaciones, HttpSession sesion){
    // Validar que las contraseñas coincidan
    if (! nuevoUsuario.getContrasenia().equals(nuevoUsuario.getConfirmarContrasenia())) {
        validaciones.rejectValue("confirmarContrasenia", "contraseniaNoCoincida", "Las contraseñas no coinciden");
    }
    // Validar que el correo del usuario sea unico
    if (this.servicioUsuario.obtenerPorCorreo(nuevoUsuario.getCorreo()) != null) {
        validaciones.rejectValue("correo", "correoDuplicado", "Este correo ta está en uso");
    }
    // Revisar si hay errores de validación
    if (validaciones.hasErrors()) {
        return "registro";
    }
    //Agremos al usuario a la base de datos
    nuevoUsuario = this.servicioUsuario.agregarUno(nuevoUsuario);

    // creamos la sesion del usuario 
    sesion.setAttribute("id_usuario", nuevoUsuario.getId());
    sesion.setAttribute("nombre", nuevoUsuario.getNombre() + " " + nuevoUsuario.getApellido());

    return "redirect:/inicio";
    }

    @PostMapping("/procesa/login")
    public String peocesaLogin(@Valid @ModelAttribute("loginUsuario") LoginUsuario loginUsuario,
                                BindingResult validaciones, HttpSession sesion){
    Usuario usuario = this.servicioUsuario.obtenerPorCorreo(loginUsuario.getCorreo());
    if (usuario == null) {
        validaciones.rejectValue("correo", "correoNoexiste", "credenciales incorrectas");
    }
    else{
        if (! BCrypt.checkpw(loginUsuario.getContrasenia(), usuario.getContrasenia())) {
            validaciones.rejectValue("contrasenia", "credencialesIncorrectas", "credenciales incorrectas");
        }
        if (validaciones.hasErrors()){
            return "login";
        }  
            
        }

    sesion.setAttribute("id_usuario", usuario.getId());
    sesion.setAttribute("nombre", usuario.getNombre() + " " + usuario.getApellido());

    return "redirect:/inicio";
    }
}



