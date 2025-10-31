package com.grupo_cuatro.glicem_ia;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication@ComponentScan(
    basePackages = "com.grupo_cuatro.glicem_ia",
    excludeFilters = @ComponentScan.Filter(
        type = org.springframework.context.annotation.FilterType.ASSIGNABLE_TYPE,
        value = com.grupo_cuatro.glicem_ia.controladores.ControladorUsuario.class
    )
)
@EntityScan("com.grupo_cuatro.glicem_ia.modelos")
@EnableJpaRepositories("com.grupo_cuatro.glicem_ia.repositorios")
public class GlicemIaApplication {


	public static void main(String[] args) {
		SpringApplication.run(GlicemIaApplication.class, args);
	}

}
