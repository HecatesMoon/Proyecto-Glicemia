package com.grupo_cuatro.glicem_ia.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.grupo_cuatro.glicem_ia.modelos.Pago;
import com.grupo_cuatro.glicem_ia.servicios.ServicioPago;
import com.grupo_cuatro.glicem_ia.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;

//todo: apuntar a vistas correctas
@Controller
public class ControladorPago {
    
    private final ServicioPago servicioPago;
    private final ServicioUsuario servicioUsuario;

    public ControladorPago (ServicioPago servicioPago, ServicioUsuario servicioUsuario){
        this.servicioPago = servicioPago;
        this.servicioUsuario = servicioUsuario;
    }
    
    @GetMapping("/metodo/pago")
    public String mostrarMetodoDePago(Model modelo, HttpSession session) {
        Long usuarioEnSesion = (Long) session.getAttribute("id_usuario");
        
        if(usuarioEnSesion == null) {
            return "redirect:/login"; // si no está logueado → lo mandamos al login
        }
        
        modelo.addAttribute("pago", new Pago());
        return "pagoPlanes";
    }

    @GetMapping("/pago/voucher/{id}")
        public String mostrarVoucher(@PathVariable("id") Long idUsuario, Model modelo, HttpSession session) {
        Long usuarioEnSesion = (Long) session.getAttribute("id_usuario");
        
        if(usuarioEnSesion == null) {
            return "redirect:/login"; // si no está logueado → lo mandamos al login
        }
        Pago pago = servicioPago.obtenerPagoPorId(idUsuario); // lo hacemos en el servicio

        if (pago == null) {
        return "redirect:/"; // o página de error
        }
        
        if (!pago.getUsuario().getId().equals(usuarioEnSesion)) {
        return "redirect:/"; 
        }
        
        modelo.addAttribute("pago", pago);
        return "voucher";
    }


    @PostMapping("/suscribirse")
    public String procesarSuscripcion(@ModelAttribute("pago") Pago pago, HttpSession session) {
        Long usuarioEnSesion = (Long) session.getAttribute("id_usuario");
        
        if(usuarioEnSesion == null) {
            return "redirect:/login"; // si no está logueado → lo mandamos al login
        }

        pago.setUsuario(servicioUsuario.obtenerPorId(usuarioEnSesion));
        
        Pago pagoGuardado = servicioPago.registrarPago(pago);
        return "redirect:/voucher/" + pagoGuardado.getId();
    }
}
