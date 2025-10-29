package com.grupo_cuatro.glicem_ia.modelos;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotNull;

@Entity
public class Glucosa {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "El valor en mg/dL es obligatorio")
    private Integer valorMgDl;

    
    private Double valorMmolL;

    @NotNull(message = "Por favor indique la fecha")
    private LocalDate fecha;

    @NotNull(message = "La hora de medición es obligatoria")
    private LocalTime hora;

    @NotNull(message = "Indique el momento de medición")
    private String momentoMedicion;

    @ManyToOne
    @JoinColumn(name = "id_usuario")
    Usuario usuario;


    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaCreacion;

    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaActualizacion;

    public Glucosa(){}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getValorMgDl() {
        return valorMgDl;
    }

    public void setValorMgDl(Integer valorMgDl) {
        this.valorMgDl = valorMgDl;
    }

    public Double getValorMmolL() {
        return valorMmolL;
    }

    public void setValorMmolL(Double valorMmolL) {
        this.valorMmolL = valorMmolL;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public String getMomentoMedicion() {
        return momentoMedicion;
    }

    public void setMomentoMedicion(String momentoMedicion) {
        this.momentoMedicion = momentoMedicion;
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
    protected void onCreate(){
        this.fechaCreacion = new Date();
        this.fechaActualizacion = new Date();
    }
    
    @PreUpdate
    protected void onUpdate(){
        this.fechaActualizacion = new Date();
    }
}
