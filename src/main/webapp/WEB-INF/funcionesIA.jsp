<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Funciones IA - GlicemIA</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">

    <%-- Ruta relativa para el CSS personalizado (asume que el JSP está en el mismo nivel o uno superior al directorio 'css') --%>
    <%-- Si tu JSP está en /WEB-INF/jsp/ y tu CSS en /static/css/, esto DEBE ser así: /css/Style_prueba.css --%>
    <%-- NO una ruta relativa como "css/Style_prueba.css" porque el contexto de la URL puede variar --%>
    <%-- La ruta raíz del contexto "/" es la forma más "relativa" estable para recursos estáticos --%>
    <link rel="stylesheet" href="/css/Style_prueba.css">

    <style>
        body { background-color: #fdfaf5; font-family: "Figtree", sans-serif; color: #413d3c; }
        .btn-orange { background-color: #f5843a; color: white; border: none; border-radius: 8px; padding: 10px 20px; font-weight: 500; }
        .btn-orange:hover { background-color: #e0702a; color: white; }
        .btn-gray { background-color: #e0e0e0; color: #333; border-radius: 8px; transition: 0.2s; }
        .btn-gray:hover { background-color: #cfcfcf; color: #000; }
        .feature-card { border-radius: 12px; padding: 2rem; background-color: #fff; box-shadow: 0 2px 8px rgba(0,0,0,0.05); text-align: center; }
        .highlight { color: #f5843a; }
        .icon-bg { background-color: #fff1e6; border-radius: 50%; width: 60px; height: 60px; display: flex; align-items: center; justify-content: center; font-size: 28px; color: #f5843a; margin: 0 auto 10px; }
        .nav-link-custom { text-decoration: none; color: #413d3c; margin-right: 1.2rem; font-weight: 500; transition: color 0.2s; }
        .nav-link-custom:hover { color: #f5843a; }
        .nav-link-active { color: #f5843a !important; font-weight: 600; }
    </style>
</head>
<body>

    <nav class="container-fluid border-bottom">
        <div class="row align-items-center py-2 px-md-5">
            <div class="col-auto d-flex align-items-center">
                <%-- Ruta relativa al contexto de la aplicación para imágenes estáticas --%>
                <img src="/img/GlicemIA_icono.png" alt="Icono de GlicemIA" style="width: 30px; height: auto; margin-right: 8px;">
                <h6 class="mb-0" style="font-weight: 600;">Glicem<span style="color: #d2691e;">IA</span></h6>
            </div>
            <div class="col text-end">
                <%-- Rutas relativas para los controladores --%>
                <a href="perfil" class="nav-link-custom">Perfil</a>
                <a href="glucosa" class="nav-link-custom">Glucosa</a>
                <a href="funcionesIA" class="nav-link-custom nav-link-active">Funciones IA</a>
                <a href="analisis" class="nav-link-custom">Análisis de Alimentos</a>
                <a href="recetas" class="nav-link-custom">Ver Recetas</a>
                <a href="medicamentos" class="nav-link-custom">Medicamentos</a>
                <a href="logout" class="btn btn-gray">Cerrar Sesión</a>
            </div>
        </div>
    </nav>

    <section class="container text-center mt-5">
        <p class="text-warning fw-semibold mb-2">⚡ Herramientas Premium</p>
        <h1 class="fw-bold">Potencia tu control con <span class="highlight">GlicemIA</span></h1>
        <p class="text-muted mb-5">Descubre nuestras herramientas de inteligencia artificial diseñadas para ayudarte a gestionar tu glucemia de forma proactiva.</p>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="feature-card">
                    <div class="icon-bg"><i class="bi bi-egg-fried"></i></div>
                    <h5 class="fw-bold">Generador de Planes de Comidas</h5>
                    <p>Crea planes de alimentación personalizados que se ajustan a tus necesidades y preferencias.</p>
                    <%-- Rutas de controlador pendientes, se deja como '#' o el nombre relativo si ya existe un controlador --%>
                    <a class="btn btn-orange" href="pagar">Crear mi plan</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <div class="icon-bg"><i class="bi bi-graph-up"></i></div>
                    <h5 class="fw-bold">Análisis Predictivo de Tendencias</h5>
                    <p>Anticípate a las subidas y bajadas de glucosa con análisis predictivo.</p>
                    <%-- Rutas de controlador pendientes --%>
                    <a class="btn btn-orange" href="analisis">Analizar tendencias</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <div class="icon-bg"><i class="bi bi-robot"></i></div>
                    <h5 class="fw-bold">Asistente Virtual GlicemIA</h5>
                    <p>Chatea con nuestro asistente IA para resolver dudas y recibir consejos.</p>
                    <%-- Rutas de controlador pendientes --%>
                    <a class="btn btn-orange" href="asistente">Iniciar chat</a>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5 mt-5" style="background-color: #fff8f0;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 mb-4 mb-md-0">
                    <h3 class="fw-bold mb-3">Análisis Predictivo de Tendencias</h3>
                    <p>GlicemIA analiza tus registros históricos para identificar patrones y predecir futuros niveles de glucosa.</p>
                    <ul>
                        <li>Alertas proactivas antes de que salgas de rango.</li>
                        <li>Identificación de patrones alimenticios.</li>
                        <li>Recomendaciones inteligentes.</li>
                    </ul>
                    <%-- Rutas de controlador pendientes --%>
                    <a class="btn btn-orange" href="analisis-predictivo">Activar Análisis Predictivo</a>
                </div>
                <div class="col-md-6">
                    <div class="feature-card text-center">
                        <h6 class="fw-bold mb-3">Predicción de Glucosa (Próximas 3 horas)</h6>
                        <div class="p-4 border rounded bg-light text-muted">Gráfico de tendencias aquí</div>
                        <div class="alert alert-warning mt-3 mb-0">⚠️ Se predice un pico de glucosa en 90 minutos.</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 mb-4 mb-md-0">
                    <h3 class="fw-bold mb-3">Asistente Virtual Interactivo</h3>
                    <p>¿Dudas sobre qué comer o cómo interpretar tu glucosa? Nuestro asistente virtual te responde 24/7.</p>
                    <ul>
                        <li>Respuestas inmediatas y confiables.</li>
                        <li>Soporte emocional en momentos difíciles.</li>
                        <li>Integrado con tus datos personales.</li>
                    </ul>
                    <%-- Rutas de controlador pendientes --%>
                    <a class="btn btn-orange" href="chat-ia">Chatear con GlicemIA</a>
                </div>
                <div class="col-md-6">
                    <div class="feature-card text-start">
                        <div class="mb-3">
                            <div class="text-end bg-orange text-white p-2 rounded" style="background-color:#f5843a; display:inline-block;">¿Es seguro comer mango si tengo diabetes?</div>
                        </div>
                        <div class="bg-light p-3 rounded">
                            ¡Hola! Sí, puedes comer mango con moderación.
                            Una porción de media taza (unos 80 g) es adecuada.
                            Te recomiendo combinarlo con yogur griego para minimizar el impacto en tu glucosa. ¡Disfruta!
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container py-5">
        <div class="row align-items-center">
            <div class="col-md-2 text-center mb-3 mb-md-0">
                <i class="bi bi-gift-fill" style="font-size: 4rem; color: #f5843a;"></i>
            </div>
            <div class="col-md-7">
                <h3 class="section-title">Apoya nuestra misión, transforma vidas</h3>
                <p>GlicemIA es gratuita gracias al apoyo de usuarios como tú. Tu donación nos permite seguir innovando y ayudando a más personas.</p>
            </div>
            <div class="col-md-3 text-center text-md-end">
                <%-- Ruta relativa para la donación.html estática o controlador --%>
                <a href="donacion" class="btn btn-orange">Hacer una Donación</a>
            </div>
        </div>
    </section>

    <footer class="container py-4 mt-5 border-top">
        <div class="row">
            <div class="col-md-4 d-flex align-items-center mb-3 mb-md-0">
                <%-- Ruta relativa al contexto de la aplicación para imágenes estáticas --%>
                <img src="/img/GlicemIA_icono.png" alt="Icono GlicemIA" style="width: 30px; height: auto; margin-right: 10px;">
                <span class="text-muted">&copy; 2025 GlicemIA. Todos los derechos reservados.</span>
            </div>
            <div class="col-md-8 text-md-end">
                <%-- Rutas relativas para los controladores --%>
                <a href="terminos" class="text-muted me-3 text-decoration-none">Términos y Condiciones</a>
                <a href="privacidad" class="text-muted me-3 text-decoration-none">Política de Privacidad</a>
                <a href="contacto" class="text-muted text-decoration-none">Contacto</a>
            </div>
        </div>
    </footer>

    <%-- Bootstrap JS --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
