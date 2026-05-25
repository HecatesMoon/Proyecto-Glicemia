<div align="center">
  <img src="https://github.com/HecatesMoon/Proyecto-Glicemia/blob/chore/cleanup/src/main/resources/static/img/GlicemIA_icono.png?raw=true" alt="GlicemIA Logo" width="150"/>

  # GlicemIA

  A web application to help users manage and monitor their blood glucose levels,
  built as a bootcamp final project.

  ![Java](https://img.shields.io/badge/Java-17-orange?style=flat-square&logo=openjdk&logoColor=white)
  ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.6-6DB33F?style=flat-square&logo=springboot)
  ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)
  ![Gemini](https://img.shields.io/badge/Gemini%20API-4285F4?style=flat-square&logo=googlegemini&logoColor=white)
  ![Maven](https://img.shields.io/badge/Maven-C71A36?style=flat-square&logo=apachemaven&logoColor=white)
  ![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white)

*Read this in [Spanish](README.es.md)*

  > ⚠️ This is a v1.0 prototype. Some features are partially implemented.
</div>

---

## Features

- **User authentication** — registration and login with hashed passwords (BCrypt)
- **Glucose tracking** — log current glucose readings and visualize them in a chart
- **Medication management** — register medications with dosage, type, schedule, and notes
- **AI Chatbot** — Gemini-powered assistant focused on glucose management, nutrition, meal suggestions, and measurement analysis, with persistent chat history

## Tech Stack

**Backend:** Java 17 · Spring Boot 3.5.6 · Spring MVC · JPA/Hibernate · BCrypt

**Frontend:** JSP · JSTL · HTML · CSS · JavaScript · Bootstrap

**Database:** MySQL

**Other:** Google Gemini API · Maven · Environment variables

## Getting Started

### Prerequisites

- Java 17+
- MySQL
- Maven

### Environment variables

Create a `.env` file or set the following variables in your environment:

```
GEMINI_API_KEY=your_gemini_api_key
DB_USER=your_database_user
DB_PASS=your_database_password
```

### Run

```bash
git clone https://github.com/HecatesMoon/Proyecto-Glicemia.git
cd Proyecto-Glicemia
mvn spring-boot:run
```

Then open `http://localhost:8080` in your browser.

## Team

| Developer | Role |
|---|---|
| [@HecatesMoon](https://github.com/HecatesMoon) | Backend |
| [@ESCANORSs99](https://github.com/ESCANORSs99) | Backend |
| [@zucker1567](https://github.com/zucker1567) | Backend |
| [@MaxRivasGit](https://github.com/MaxRivasGit) | Frontend |
| [@Gyanez7](https://github.com/Gyanez7) | Frontend |
| [@Angeles571](https://github.com/Angeles571) | Frontend |
