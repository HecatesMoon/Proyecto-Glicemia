<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página en Construcción - GlicemIA</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/GlicemIA_icono.png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Style_prueba.css">

    <style>
        body { background-color: #fdfaf5; font-family: "Figtree", sans-serif; color: #413d3c; display: flex; flex-direction: column; min-height: 100vh; }
        .navbar-custom { background-color: #fdfaf5; border-bottom: 1px solid #eee; }
        .main-content { flex-grow: 1; display: flex; align-items: center; justify-content: center; text-align: center; }
        .construction-card { background-color: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); padding: 3rem; max-width: 600px; }
        .construction-card i { font-size: 2rem; color: white;}
        .construction-card h1 { font-weight: 700; color: #413d3c; margin-bottom: 1rem; }
        .construction-card p { color: #777; font-size: 1.1rem; margin-bottom: 2rem; }
        .construction-card i.main-icon {font-size: 5rem; margin-bottom: 1rem; color: #e0702a;}
        .btn-back-to-home { 
            background-color: #f5843a; 
            color: white; 
            border: none; 
            border-radius: 8px; 
            padding: 10px 20px; 
            font-weight: 500; 
            font-size: 1rem; /* Tamaño de fuente normal para el botón */
            display: inline-flex; /* Para que el icono y el texto estén alineados */
            align-items: center;
            justify-content: center;
            text-decoration: none;
        }
        .btn-back-to-home:hover { background-color: #e0702a; color: white; }
        .btn-orange { background-color: #f5843a; color: white; border: none; border-radius: 8px; padding: 10px 20px; font-weight: 500; }
        .btn-orange:hover { background-color: #e0702a; color: white; }
        .btn-gray { background-color: #e0e0e0; color: #333; border: none; border-radius: 8px; transition: 0.2s; padding: 8px 15px; }
        .btn-gray:hover { background-color: #cfcfcf; color: #000; }
        .nav-link-custom { text-decoration: none; color: #413d3c; margin-right: 1.2rem; font-weight: 500; transition: color 0.2s; }
        .nav-link-custom:hover { color: #f5843a; }
        .nav-link-active { color: #f5843a !important; font-weight: 600; }
        .footer-custom { background-color: #fdfaf5; padding-top: 1.5rem; padding-bottom: 1.5rem; border-top: 1px solid #eee; }
        .footer-text { color: #777; }
        .footer-link { color: #777; text-decoration: none; transition: color 0.2s; }
        .footer-link:hover { color: #f5843a; }
    </style>
</head>
<body>

    <nav class="container-fluid border-bottom navbar-custom">
        <div class="row align-items-center py-2 px-md-5">
            <div class="col-md-3 d-flex align-items-center">
                <img src="<c:url value='/img/GlicemIA_icono.png'/>" alt="Icono de GlicemIA" style="width: 40px; height: auto; margin-right: 10px;">
                <h4 class="mb-0">Glicem<span style="color: #d2691e;">IA</span></h4>
            </div>
            <div class="col-md-9 text-end">
                <c:choose>
                    <c:when test="${not empty sessionScope.id_usuario}">
                        <a href="${pageContext.request.contextPath}/perfil" class="nav-link-custom">Perfil</a>
                        <a href="${pageContext.request.contextPath}/glucosa" class="nav-link-custom">Glucosa</a>
                        <a href="${pageContext.request.contextPath}/funcionesIA" class="nav-link-custom">Funciones IA</a>
                        <a href="${pageContext.request.contextPath}/analisis" class="nav-link-custom">Análisis de Alimentos</a>
                        <a href="${pageContext.request.contextPath}/recetas" class="nav-link-custom">Ver Recetas</a>
                        <a href="${pageContext.request.contextPath}/medicamentos" class="nav-link-custom">Medicamentos</a>
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-gray">Cerrar Sesión</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/" class="nav-link-custom">Inicio</a>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-light me-3" style="border-radius: 8px; font-weight: 500;">Iniciar Sesión</a>
                        <a href="${pageContext.request.contextPath}/registro" class="btn btn-orange" style="border-radius: 8px;">Registrarse</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>

    <div class="container main-content">
        <div class="construction-card">
            <i class="bi bi-gear-fill main-icon"></i>
            <h1>¡Página en Construcción!</h1>
            <p>Estamos trabajando arduamente para traerte una experiencia increíble. Esta página estará disponible muy pronto.</p>
            <c:choose>
                <c:when test="${not empty sessionScope.id_usuario}">
                    <a href="${pageContext.request.contextPath}/glucosa" class="btn btn-back-to-home"><i class="bi bi-house-door-fill me-2"></i>Volver al Inicio</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/inicio" class="btn btn-back-to-home"><i class="bi bi-house-door-fill me-2"></i>Volver al Inicio</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <footer class="container-fluid footer-custom">
        <div class="row px-md-5">
            <div class="col-md-4 d-flex align-items-center mb-3 mb-md-0">
                <img src="${pageContext.request.contextPath}/img/GlicemIA_icono.png" alt="Icono GlicemIA"
                     style="width: 30px; height: auto; margin-right: 10px;">
                <span class="footer-text">&copy; 2025 GlicemIA. Todos los derechos reservados.</span>
            </div>
            <div class="col-md-8 text-md-end">
                <a href="#" class="footer-link me-3">Términos y Condiciones</a>
                <a href="#" class="footer-link me-3">Política de Privacidad</a>
                <a href="#" class="footer-link">Contacto</a>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
