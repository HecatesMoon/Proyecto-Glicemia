
<%-- Directivas JSP necesarias para que JSTL funcione --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>GlicemIA</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Style_prueba.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        /* Estilos base (Mover a Style_prueba.css) */
        body { background-color: #fdfaf5;}
        .btn-orange { background-color: #f5843a; color: white; border: none; border-radius: 8px; padding: 10px 20px; font-weight: 500;}
        .btn-orange:hover { background-color: #e0702a; color: white; }
        .card { border: 1px solid #eee; box-shadow: 0 2px 5px rgba(0,0,0,0.05); }
        .recipe-card img { height: 200px; object-fit: cover; }
        .partner-logo { background-color: #e9ecef; height: 50px; width: 100px; display: inline-block; margin: 10px; border-radius: 4px; }
        h2, h3, h4, h5, h6 { color: #413d3c; font-family: 'Figtree', sans-serif; }
        p { color: #777; font-family: 'Figtree', sans-serif;}
        .section-title { color: #413d3c; font-weight: 700; margin-bottom: 1rem; }
        .section-subtitle { color: #777; margin-bottom: 2.5rem; }
        .iconosNaran { color: #f5843a; /* Asegúrate de que text-orange o iconosNaran esté definido */ }
    </style>
</head>
<body>

    <nav class="row align-items-center py-2 px-md-5">
        <div class="col-md-3 d-flex align-items-center">
            <img src="${pageContext.request.contextPath}/img/GlicemIA_icono.png" alt="Icono de GlicemIA" style="width: 40px; height: auto; margin-right: 10px;">
            <h4 class="mb-0">Glicem<span style="color: #d2691e;">IA</span></h4>
        </div>
        <div class="col-md-9 text-end">
            <c:choose>
                <c:when test="${not empty sessionScope.id_usuario}">
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-light me-3" style="border-radius: 8px; font-weight: 500;">Cerrar Sesión</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-light me-3" style="border-radius: 8px; font-weight: 500;">Iniciar Sesión</a>
                    <a href="${pageContext.request.contextPath}/registro" class="btn btn-orange" style="border-radius: 8px;">Registrarse</a>
                </c:otherwise>
            </c:choose>
        </div>
        <hr style="margin-top: 10px; color: rgb(200, 200, 200);">
    </nav>

    <section class="container py-5">
        <div class="row align-items-center">
            <div class="col-md-6 mb-4 mb-md-0">
                <h1 style="font-weight: 700; font-size: 2.8rem; color: #413d3c;">Control simple e inteligente de tu glucosa</h1>
                <p class="lead text-muted my-4">Gestiona tu salud con nuestra app intuitiva. Registra tus comidas, monitorea tu glucosa y recibe análisis personalizados para tomar mejores decisiones.</p>
                <a class="btn btn-orange btn-lg" href="${pageContext.request.contextPath}/glucosa">Empieza a Cuidar tu Salud Gratis</a>                    
            </div>
            <div class="col-md-6 text-center">
                <img src="${pageContext.request.contextPath}/img/hero-image-placeholder.png" alt="App GlicemIA en un teléfono" class="img-fluid" style="max-width: 500px;">
            </div>
        </div>
    </section>

    <hr>

    <section class="container py-5 text-center">
        <h2 class="section-title">Quiénes Somos</h2>
        <p class="section-subtitle">Somos un equipo apasionado por la tecnología y la salud, comprometidos en crear herramientas que mejoren tu bienestar.</p>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card h-100 p-4 rounded-5">
                    <div class="card-body">
                        <h5><i class="bi bi-bullseye iconosNaran me-2"></i>Misión</h5>
                        <p>Facilitar el manejo de la glucosa a través de tecnología accesible e información clara.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 p-4 rounded-5">
                    <div class="card-body">
                        <h5><i class="bi bi-eye-fill iconosNaran me-2"></i>Visión</h5>
                        <p>Ser la herramienta líder y de confianza para el monitoreo glucémico personalizado.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 p-4 rounded-5">
                    <div class="card-body">
                        <h5><i class="bi bi-heart-fill iconosNaran me-2"></i>Valores</h5>
                        <p>Empatía, precisión, innovación y compromiso con la salud de nuestros usuarios.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container py-5 text-center" style="background-color: #fff8f0;">
        <h2 class="section-title">Funcionalidades Premium</h2>
        <p class="section-subtitle">Desbloquea análisis avanzados y herramientas personalizadas para un control más profundo.</p>
        <a class="btn btn-orange mb-5" href="${pageContext.request.contextPath}/funcionesIA">Ver Planes Premium</a>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card h-100 p-4 rounded-5">
                    <div class="card-body">
                        <h5><i class="bi bi-file-earmark-pdf-fill iconosNaran me-2"></i>Reportes PDF para tu Médico</h5>
                        <p>Genera informes detallados y fáciles de entender para compartir con tu profesional de salud.</p>
                    </div>
                </div>
            </div>
             <div class="col-md-4 mb-4">
                <div class="card h-100 p-4 rounded-5">
                    <div class="card-body">
                        <h5><i class="bi bi-graph-up-arrow iconosNaran me-2"></i>Análisis Causa/Efecto con IA</h5>
                        <p>Nuestra IA analiza tus registros y te muestra cómo comidas específicas impactan tu glucosa.</p>
                    </div>
                </div>
            </div>
             <div class="col-md-4 mb-4">
                <div class="card h-100 p-4 rounded-5">
                    <div class="card-body">
                        <h5><i class="bi bi-bell-fill iconosNaran me-2"></i>Alertas y Recordatorios Avanzados</h5>
                        <p>Recibe notificaciones inteligentes sobre niveles altos/bajos y personaliza más recordatorios.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container py-5 text-center">
        <h2 class="section-title">Cocina Saludable con Nuestra Comunidad</h2>
        <p class="section-subtitle">Descubre recetas deliciosas y aptas para el control glucémico compartidas por otros usuarios.</p>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card recipe-card h-100">
                    <img src="${pageContext.request.contextPath}/img/recipe1-placeholder.jpg" class="card-img-top" alt="Ensalada">
                    <div class="card-body">
                        <h5 class="card-title">Ensalada de Verano con Quinoa</h5>
                        <p class="card-text">Ligera, fresca y llena de nutrientes.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card recipe-card h-100">
                    <img src="${pageContext.request.contextPath}/img/recipe2-placeholder.jpg" class="card-img-top" alt="Tostadas">
                    <div class="card-body">
                        <h5 class="card-title">Tostadas de Aguacate y Huevo</h5>
                        <p class="card-text">Un desayuno completo y balanceado.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card recipe-card h-100">
                    <img src="${pageContext.request.contextPath}/img/recipe3-placeholder.jpg" class="card-img-top" alt="Salmón">
                    <div class="card-body">
                        <h5 class="card-title">Salmón al Horno con Espárragos</h5>
                        <p class="card-text">Una cena elegante y saludable.</p>
                    </div>
                </div>
            </div>
        </div>

        <c:choose>  <!-- todo:decidir si /recetario sera con cuenta o abierto -->
            <c:when test="${not empty sessionScope.id_usuario}">
                <a class="btn btn-orange mt-4" href="${pageContext.request.contextPath}/recetas">Explora el Recetario</a>
            </c:when>
            <c:otherwise>
                <a class="btn btn-orange mt-4" href="${pageContext.request.contextPath}/login">Explora el Recetario</a>
            </c:otherwise>
        </c:choose>
    </section>

    <section class="container py-5 text-center" style="background-color: #f8f9fa;">
         <h2 class="section-title">Con el Apoyo de Nuestros Socios</h2>
        <p class="section-subtitle">Colaboramos con organizaciones comprometidas con la salud y el bienestar.</p>
        <div>
            <img style="height: 80px;" src="${pageContext.request.contextPath}/img/partner-logo1.png" class="partner-logo">
            <img style="height: 80px;" src="${pageContext.request.contextPath}/img/partner-logo2.png" class="partner-logo">
            <img style="height: 80px;" src="${pageContext.request.contextPath}/img/partner-logo3.png" class="partner-logo">
            <img style="height: 80px;" src="${pageContext.request.contextPath}/img/partner-logo4.png" class="partner-logo">
            <img style="height: 80px;" src="${pageContext.request.contextPath}/img/partner-logo5.png" class="partner-logo">
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
                 <a href="${pageContext.request.contextPath}/donaciones" class="btn btn-orange">Hacer una Donación</a>
            </div>
        </div>
    </section>

    <footer class="container py-4 mt-5 border-top">
        <div class="row">
            <div class="col-md-4 d-flex align-items-center mb-3 mb-md-0">
                <img src="${pageContext.request.contextPath}/img/GlicemIA_icono.png" alt="Icono GlicemIA" style="width: 30px; height: auto; margin-right: 10px;">
                <span class="text-muted">&copy; 2025 GlicemIA. Todos los derechos reservados.</span>
            </div>
            <div class="col-md-8 text-md-end">
                <a href="#" class="text-muted me-3 text-decoration-none">Términos y Condiciones</a>
                <a href="#" class="text-muted me-3 text-decoration-none">Política de Privacidad</a>
                <a href="#" class="text-muted text-decoration-none">Contacto</a>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

