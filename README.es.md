<div align="center">
  <img src="https://github.com/HecatesMoon/Proyecto-Glicemia/blob/chore/cleanup/src/main/resources/static/img/GlicemIA_icono.png?raw=true" alt="GlicemIA Logo" width="150"/>

  # GlicemIA

  Una aplicación web para ayudar a los usuarios a gestionar y monitorear sus niveles de glucosa en sangre,
  desarrollada como proyecto final de bootcamp.

  ![Java](https://img.shields.io/badge/Java-17-orange?style=flat-square&logo=openjdk&logoColor=white)
  ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.6-6DB33F?style=flat-square&logo=springboot)
  ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)
  ![Gemini](https://img.shields.io/badge/Gemini%20API-4285F4?style=flat-square&logo=googlegemini&logoColor=white)
  ![Maven](https://img.shields.io/badge/Maven-C71A36?style=flat-square&logo=apachemaven&logoColor=white)
  ![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white)

  *Read this in [English](README.md)*

  > ⚠️ Este es un prototipo v1.0. Algunas funcionalidades están parcialmente implementadas.
</div>

---

## Funcionalidades

- **Autenticación de usuarios** — registro e inicio de sesión con contraseñas hasheadas (BCrypt)
- **Registro de glucosa** — registra tus niveles actuales de glucosa y visualízalos en un gráfico
- **Gestión de medicamentos** — registra medicamentos con dosis, tipo, horario y notas
- **Chatbot con IA** — asistente impulsado por Gemini enfocado en gestión de glucosa, nutrición, sugerencias de comidas y análisis de mediciones, con historial de chat persistente

## Stack Tecnológico

**Backend:** Java 17 · Spring Boot 3.5.6 · Spring MVC · JPA/Hibernate · BCrypt

**Frontend:** JSP · JSTL · HTML · CSS · JavaScript · Bootstrap

**Base de datos:** MySQL

**Otros:** Google Gemini API · Maven · Variables de entorno

## Cómo ejecutar el proyecto

### Requisitos previos

- Java 17+
- MySQL
- Maven

### Variables de entorno

Crea un archivo `.env` o define las siguientes variables en tu entorno:

```
GEMINI_API_KEY=tu_api_key_de_gemini
DB_USER=tu_usuario_de_base_de_datos
DB_PASS=tu_contraseña_de_base_de_datos
```

### Ejecutar

```bash
git clone https://github.com/HecatesMoon/Proyecto-Glicemia.git
cd Proyecto-Glicemia
mvn spring-boot:run
```

Luego abre `http://localhost:8080` en tu navegador.

## Equipo

| Desarrollador | Rol |
|---|---|
| [@HecatesMoon](https://github.com/HecatesMoon) | Backend |
| [@ESCANORSs99](https://github.com/ESCANORSs99) | Backend |
| [@zucker1567](https://github.com/zucker1567) | Backend |
| [@MaxRivasGit](https://github.com/MaxRivasGit) | Frontend |
| [@Gyanez7](https://github.com/Gyanez7) | Frontend |
| [@Angeles571](https://github.com/Angeles571) | Frontend |
