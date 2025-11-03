package com.grupo_cuatro.glicem_ia.servicios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.grupo_cuatro.glicem_ia.modelos.Medicamento;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioMedicamento;

@Service
public class ServicioMedicamento {
    @Autowired
    private final RepositorioMedicamento repositorioMedicamento;

    public ServicioMedicamento(RepositorioMedicamento repositorioMedicamento){
        this.repositorioMedicamento = repositorioMedicamento;
    }

    public Medicamento agregarUno(Medicamento nuevoMedicamento){
        return this.repositorioMedicamento.save(nuevoMedicamento);
    }

    @Scheduled(fixedRate = 60000) //cada minuto
    public void revisarNotificaciones(){
        
    }
}
