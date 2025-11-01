package com.grupo_cuatro.glicem_ia.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grupo_cuatro.glicem_ia.modelos.Medicamento;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;

@Repository
public interface RepositorioMedicamento extends JpaRepository<Medicamento, Long>{
    Medicamento save(Medicamento nuevoMedicamento);
    List<Medicamento> findByUsuarioOrderByFechaDesc(Usuario usuario);
}
