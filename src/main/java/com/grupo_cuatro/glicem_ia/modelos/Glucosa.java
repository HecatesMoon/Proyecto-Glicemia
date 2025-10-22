package com.grupo_cuatro.glicem_ia.modelos;

import java.time.LocalDate;
import java.time.LocalTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

@Entity
public class Glucosa {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "El valor en mg/dL es obligatorio")
    @Min(value = 1, message = "El valor mínimo permitido es 1 mg/dL")
    @Max(value = 500, message = "El valor máximo permitido es 500 mg/dL")
    private Integer valorMgDl;

    private Double valorMmolL;

    private LocalDate fecha;

    @NotNull(message = "La hora de medición es obligatoria")
    private LocalTime hora;

    
}
