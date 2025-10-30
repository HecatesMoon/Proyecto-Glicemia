package com.grupo_cuatro.glicem_ia.modelos;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;


@Entity
@Table(name = "usuarios")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min =3, message = "Por favor proporciona tu nombre")
    private String nombre;

    @Size(min = 3, message = "Por favor proporciona tu apellido")
    private String apellido;

    @Email(message = "Por favor ingresa un correo válido")
    private String correo;

    @Size(min = 8, message = "La contraseña debe tener al menos 8 caracteres")
    private String contrasenia;

    @NotNull(message = "Por favor proporciona tu fecha de nacimiento")
    private LocalDate fechaNacimiento;

    @Size(message = "Proporciona tu tipo de diabetes")
    private String tipoDiabetes;

    private String imagenPerfil;

    private Integer edad;

    private String contactoEmergencia;

    private Boolean recibirNotificaciones = false;

    private Boolean modoOscuro = false;

    @Transient
    private String confirmarContrasenia;
    
    //Esto te devuelve la edad automáticamente, sin guardarla en BD ni actualizarla manualmente.
    @Transient
    public int getEdad() {
    return java.time.Period.between(this.fechaNacimiento, LocalDate.now()).getYears();
    }

    @OneToMany(mappedBy = "usuario", cascade=CascadeType.ALL, fetch = FetchType.LAZY )
    List<Glucosa> glucosa;

    @OneToMany(mappedBy= "usuario", cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	private List<HistorialChat> historialChats;

    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaCreacion;

    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaActualizacion;

    public Usuario(){}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getTipoDiabetes() {
        return tipoDiabetes;
    }

    public void setTipoDiabetes(String tipoDiabetes) {
        this.tipoDiabetes = tipoDiabetes;
    }

    public String getImagenPerfil() {
        return imagenPerfil;
    }

    public void setImagenPerfil(String imagenPerfil) {
        this.imagenPerfil = imagenPerfil;
    }
    
    public Integer getEdadValue() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }


    public String getContactoEmergencia() {
        return contactoEmergencia;
    }

    public void setContactoEmergencia(String contactoEmergencia) {
        this.contactoEmergencia = contactoEmergencia;
    }

    public Boolean getRecibirNotificaciones() {
        return recibirNotificaciones;
    }

    public void setRecibirNotificaciones(Boolean recibirNotificaciones) {
        this.recibirNotificaciones = recibirNotificaciones;
    }

    public Boolean getModoOscuro() {
        return modoOscuro;
    }

    public void setModoOscuro(Boolean modoOscuro) {
        this.modoOscuro = modoOscuro;
    }

    public String getConfirmarContrasenia() {
        return confirmarContrasenia;
    }

    public void setConfirmarContrasenia(String confirmarContrasenia) {
        this.confirmarContrasenia = confirmarContrasenia;
    }

    public List<Glucosa> getGlucosa() {
        return glucosa;
    }

    public void setGlucosa(List<Glucosa> glucosa) {
        this.glucosa = glucosa;
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
