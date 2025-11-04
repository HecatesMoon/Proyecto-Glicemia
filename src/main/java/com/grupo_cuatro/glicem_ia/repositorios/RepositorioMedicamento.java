package com.grupo_cuatro.glicem_ia.repositorios;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grupo_cuatro.glicem_ia.modelos.Medicamento;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;

@Repository
public interface RepositorioMedicamento extends JpaRepository<Medicamento, Long>{
    Medicamento save(Medicamento nuevoMedicamento);

    // Para mostrar el historial del usuario
    List<Medicamento> findByUsuarioOrderByFechaDesc(Usuario usuario);

    List<Medicamento> findByNotificacionTrueAndFechaAndHora(LocalDate fecha, LocalTime hora);
}
