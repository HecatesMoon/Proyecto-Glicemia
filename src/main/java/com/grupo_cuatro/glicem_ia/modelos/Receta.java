package com.grupo_cuatro.glicem_ia.modelos;


import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "recetas")
public class Receta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank(message = "El nombre de la receta es obligatirio")
    private String nombreReceta;
    
    @Size(min = 10, message = "La descripción debe tener al menos 10 caracteres")
    private String descripcionReceta;
    
    @NotNull(message = "El tiempo de preparación es obligatorio")
    private Integer tiempopreparacion;
    
    @NotNull(message = "El tiempo de cocción es obligatorio")
    private Integer tiempoCoccion;

    private String imagenReceta;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaCreacion;

    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaActualizacion;

    public Receta() {}

    

        public Long getId() {
        return id;
    }



    public void setId(Long id) {
        this.id = id;
    }



    public String getNombreReceta() {
        return nombreReceta;
    }



    public void setNombreReceta(String nombreReceta) {
        this.nombreReceta = nombreReceta;
    }



    public String getDescripcionReceta() {
        return descripcionReceta;
    }



    public void setDescripcionReceta(String descripcionReceta) {
        this.descripcionReceta = descripcionReceta;
    }



    public Integer getTiempopreparacion() {
        return tiempopreparacion;
    }



    public void setTiempopreparacion(Integer tiempopreparacion) {
        this.tiempopreparacion = tiempopreparacion;
    }



    public Integer getTiempoCoccion() {
        return tiempoCoccion;
    }



    public void setTiempoCoccion(Integer tiempoCoccion) {
        this.tiempoCoccion = tiempoCoccion;
    }



    public String getImagenReceta() {
        return imagenReceta;
    }



    public void setImagenReceta(String imagenReceta) {
        this.imagenReceta = imagenReceta;
    }



    public Usuario getUsuario() {
        return usuario;
    }



    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }



    public Date getFechaCreacion() {
        return fechaCreacion;
    }



    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }



    public Date getFechaActualizacion() {
        return fechaActualizacion;
    }



    public void setFechaActualizacion(Date fechaActualizacion) {
        this.fechaActualizacion = fechaActualizacion;
    }



    @PrePersist
    protected void onCreate() {
        this.fechaCreacion = new Date();
        this.fechaActualizacion = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.fechaActualizacion = new Date();
    }



    
    
}
