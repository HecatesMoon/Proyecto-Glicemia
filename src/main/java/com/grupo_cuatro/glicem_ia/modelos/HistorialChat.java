package com.grupo_cuatro.glicem_ia.modelos;

import java.time.LocalDateTime;

import org.hibernate.annotations.ManyToAny;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="historial_chats")
public class HistorialChat {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "id_usuario")
    // !TODO: conectar con el modelo usuario
    private Usuario usuario;
    @Lob
    private String texto;
    @Column(name = "fecha_del_mensaje")
    private LocalDateTime fechaMensaje;
    @Column(name= "origen_del_mensaje")
    @Enumerated(EnumType.STRING)
    private OrigenMensaje origenMensaje;
    // private Integer costoTokens;

    public HistorialChat (){}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public LocalDateTime getFechaMensaje() {
        return fechaMensaje;
    }

    public void setFechaMensaje(LocalDateTime fechaMensaje) {
        this.fechaMensaje = fechaMensaje;
    }

    public OrigenMensaje getOrigenMensaje() {
        return origenMensaje;
    }

    public void setOrigenMensaje(OrigenMensaje origenMensaje) {
        this.origenMensaje = origenMensaje;
    }

    // public Integer getCostoTokens() {
    //     return costoTokens;
    // }

    // public void setCostoTokens(Integer costoTokens) {
    //     this.costoTokens = costoTokens;
    // }

    
}
