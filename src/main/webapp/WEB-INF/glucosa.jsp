<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Glucosa - GlicemIA</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">

    <%-- Rutas corregidas para la carpeta 'static' --%>
    <link rel="stylesheet" href="<c:url value='/css/Style_prueba.css'/>">

    <%-- Estilos del HTML original --%>
    <style>
        body { background-color: #fdfaf5; font-family: "Figtree", sans-serif; color: #413d3c; }
        .btn-orange { background-color: #f5843a; color: white; border: none; border-radius: 8px; padding: 10px 20px; font-weight: 500; }
        .btn-orange:hover { background-color: #e0702a; color: white; }
        .btn-gray { background-color: #e0e0e0; color: #333; border: none; border-radius: 8px; transition: 0.2s; padding: 8px 15px; }
        .btn-gray:hover { background-color: #cfcfcf; color: #000; }
        .feature-card { border-radius: 12px; padding: 2rem; background-color: #fff; box-shadow: 0 2px 8px rgba(0,0,0,0.05); text-align: center; }
        .highlight { color: #f5843a; }
        .icon-bg { background-color: #fff1e6; border-radius: 50%; width: 60px; height: 60px; display: flex; align-items: center; justify-content: center; font-size: 28px; color: #f5843a; margin: 0 auto 10px; }
        .nav-link-custom { text-decoration: none; color: #413d3c; margin-right: 1.2rem; font-weight: 500; transition: color 0.2s; }
        .nav-link-custom:hover { color: #f5843a; }
        .nav-link-active { color: #f5843a !important; font-weight: 600; }
        .card-glicemia { background-color: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); padding: 1.5rem; margin-bottom: 2rem; }
        .card-glicemia .card-title { font-size: 1.3rem; font-weight: 600; margin-bottom: 1.2rem; }
        .card-premium, .card-donacion { border-radius: 15px; padding: 1.5rem; text-align: center; margin-bottom: 2rem; box-shadow: 0 4px 15px rgba(0,0,0,0.08); }
        .card-premium { background-color: #fce8d5; }
        .card-donacion { background-color: #fff; border: 1px solid #eee; }
        .card-premium .icon-bg-lg { background-color: #f5843a; border-radius: 50%; width: 70px; height: 70px; display: flex; align-items: center; justify-content: center; font-size: 36px; color: white; margin: 0 auto 15px; }
        .card-donacion .icon-bg-lg { background-color: #fff1e6; border-radius: 50%; width: 70px; height: 70px; display: flex; align-items: center; justify-content: center; font-size: 36px; color: #f5843a; margin: 0 auto 15px; }
        .input-group-custom .form-control { border-top-right-radius: 0.375rem; border-bottom-right-radius: 0.375rem; }
        .input-group-custom .input-group-text { border-top-left-radius: 0.375rem; border-bottom-left-radius: 0.375rem; background-color: #e9ecef; border-color: #ced4da; }
        .chart-card { background-color: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); padding: 1.5rem; height: 400px; display: flex; flex-direction: column; justify-content: space-between; }
        .macro-card { background-color: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); padding: 1.5rem; margin-bottom: 1.5rem; }
        .macro-item { display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; }
        .macro-value { font-size: 1.8rem; font-weight: 700; color: #f5843a; }
        .impact-card { background-color: #fce8d5; border-radius: 15px; padding: 1.5rem; height: 100%; display: flex; align-items: center; }
        .impact-card .icon { font-size: 2.5rem; color: #f5843a; margin-right: 15px; }
        .impact-card .text strong { color: #f5843a; font-size: 1.2rem; }
        .sponsored-card { background-color: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); padding: 1.5rem; text-align: center; height: 100%; }
        .sponsored-card .icon-img { max-width: 80px; height: auto; margin-bottom: 1rem; }
        .sponsored-card h5 { font-weight: 600; font-size: 1.1rem; }
        .sponsored-card p { font-size: 0.9rem; color: #777; }
        /* Estilo para los mensajes de error de Spring Form */
        .error-text { color: #dc3545; font-size: 0.875em; margin-top: 0.25rem; }
    </style>
</head>
<body>

    <nav class="container-fluid border-bottom">
        <div class="row align-items-center py-2 px-md-5">
            <div class="col-md-3 d-flex align-items-center">
                <img src="<c:url value='/img/GlicemIA_icono.png'/>" alt="Icono de GlicemIA" style="width: 40px; height: auto; margin-right: 10px;">
                <h4 class="mb-0">Glicem<span style="color: #d2691e;">IA</span></h4>
            </div>
            <div class="col-md-9 text-end">
                <a href="<c:url value='/perfil'/>" class="nav-link-custom">Perfil</a>
                <a href="<c:url value='/glucosa'/>" class="nav-link-custom nav-link-active">Glucosa</a>
                <a href="<c:url value='/funcionesIA'/>" class="nav-link-custom">Funciones IA</a>
                <a href="<c:url value='/analisisAlimentos'/>" class="nav-link-custom">Análisis de Alimentos</a>
                <a href="<c:url value='/verRecetas'/>" class="nav-link-custom">Ver Recetas</a>
                <a href="<c:url value='/logout'/>" class="btn btn-gray">Cerrar Sesión</a>
            </div>
        </div>
    </nav>

    <div class="container-fluid py-4 px-md-5">

        <%-- Mensaje de éxito del JSP original --%>
        <c:if test="${not empty mensajeExito}">
            <div class="alert alert-success alert-dismissible fade show boton" role="alert">
                ${mensajeExito}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
            </div>
        </c:if>

        <div class="row">
            <div class="col-md-4">
                <h3 class="mb-4">GlicemIA: Registro y Análisis</h3>
                <p class="text-muted mb-4">Registra tus datos de glucosa y alimentación.</p>

                <%-- Tarjetas laterales del HTML --%>
                <div class="card-premium mb-4">
                    <div class="icon-bg-lg mx-auto mb-3">
                        <i class="bi bi-star-fill"></i>
                    </div>
                    <h5 class="mb-2" style="font-weight: 600;">Hazte Premium</h5>
                    <p class="text-muted mb-3">Potencia tu control bajo el análisis de IA de GlicemIA.</p>
                    <a href="<c:url value='/planesPremium'/>" class="btn btn-orange">Saber Más</a>
                </div>

                <div class="card-donacion mb-4">
                    <div class="icon-bg-lg mx-auto mb-3">
                        <i class="bi bi-heart-fill"></i>
                    </div>
                    <h5 class="mb-2" style="font-weight: 600;">Apoya Nuestro Proyecto</h5>
                    <p class="text-muted mb-3">Tu donación nos ayuda a seguir mejorando GlicemIA.</p>
                    <a href="<c:url value='/donacion'/>" class="btn btn-orange">Realizar Donación</a>
                </div>

                <%-- FORMULARIO DE GLUCOSA (FUSIONADO) --%>
                <div class="card-glicemia">
                    <h5 class="card-title">Registro de Glucosa</h5>

                    <%-- Formulario del JSP con estilos del HTML --%>
                    <form:form action="/agregar/glucosa" method="POST" modelAttribute="nuevoGlucosa">
                        <div class="row mb-3">
                            <div class="col-6">
                                <form:label path="valorMgDl" class="form-label">Valor (mg/dL)</form:label>
                                <form:input path="valorMgDl" class="form-control" placeholder="Ej: 110"/>
                                <form:errors path="valorMgDl" cssClass="error-text"/>
                            </div>
                            <div class="col-6">
                                <form:label path="valorMmolL" class="form-label">Valor (mmol/L)</form:label>
                                <form:input path="valorMmolL" class="form-control" placeholder="Ej: 6.1"/>
                                <form:errors path="valorMmolL" cssClass="error-text"/>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-6">
                                <form:label path="fecha" class="form-label">Fecha</form:label>
                                <form:input path="fecha" type="date" class_="form-control"/>
                                <form:errors path="fecha" cssClass="error-text"/>
                            </div>
                            <div class="col-6">
                                <form:label path="hora" class="form-label">Hora</form:label>
                                <form:input path="hora" type="time" class="form-control"/>
                                <form:errors path="hora" cssClass="error-text"/>
                            </div>
                        </div>
                        <div class="mb-4">
                            <form:label path="momentoMedicion" class="form-label">Momento de la medición</form:label>
                            <form:select path="momentoMedicion" class="form-select">
                                <form:option value="" label="-- Selecciona una opción --"/>
                                <form:option value="ayuna" label="Ayuna"/>
                                <form:option value="preprondial" label="Preprandial (Antes de comer)"/>
                                <form:option value="posprandia" label="Postprandial (Después de comer)"/>
                                <form:option value="precolacion" label="Precolación (Antes de snack)"/>
                                <form:option value="postcolacion" label="Postcolación (Después de snack)"/>
                                <form:option value="otro" label="Otro"/>
                            </form:select>
                            <form:errors path="momentoMedicion" cssClass="error-text"/>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-orange">Guardar Medición</button>
                        </div>
                    </form:form>
                </div>

                <%-- FORMULARIO DE ALIMENTACIÓN (CONVERTIDO A SPRING FORM) --%>
                <div class="card-glicemia">
                    <h5 class="card-title">Registro de Alimentación</h5>
                    <%-- Asumiendo que el modelAttribute será 'nuevoAlimento' --%>
                    <form:form action="/registrar" method="POST" modelAttribute="nuevoRegistro">
                        <div class="mb-3">
                            <form:label path="tipoComida" class="form-label">Tipo de comida</form:label>
                            <form:select path="tipoComida" class="form-select">
                                <form:option value="Desayuno" label="Desayuno"/>
                                <form:option value="Almuerzo" label="Almuerzo"/>
                                <form:option value="Cena" label="Cena"/>
                                <form:option value="Merienda" label="Merienda"/>
                                <form:option value="Otro" label="Otro"/>
                            </form:select>
                            <form:errors path="tipoComida" cssClass="error-text"/>
                        </div>
                        <div class="mb-3">
                            <form:label path="descripcion" class="form-label">Descripción</form:label>
                            <div class="input-group">
                                <form:input path="descripcion" class="form-control" placeholder="Describe lo que comiste... Ej: 2 tostadas..."/>
                                <button class="btn btn-orange" type="button"><i class="bi bi-lightning-fill me-1"></i>Generar con IA</button>
                            </div>
                            <form:errors path="descripcion" cssClass="error-text"/>
                        </div>
                        <div class="row mb-4">
                            <div class="col-6">
                                <form:label path="fecha" class="form-label">Fecha</form:label>
                                <form:input path="fecha" type="date" class="form-control"/>
                                <form:errors path="fecha" cssClass="error-text"/>
                            </div>
                            <div class="col-6">
                                <form:label path="hora" class="form-label">Hora</form:label>
                                <form:input path="hora" type="time" class="form-control"/>
                                <form:errors path="hora" cssClass="error-text"/>
                            </div>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-orange">Guardar Comida</button>
                        </div>
                    </form:form>
                </div>
            </div>

            <div class="col-md-8">
                <h3 class="mb-4">Análisis de Glucosa</h3>
                <p class="text-muted mb-4">Visualiza tu tendencia y el impacto de tus comidas.</p>

                <%-- GRÁFICO (Se mantiene el placeholder del HTML) --%>
                <div class="chart-card mb-4">
                    <h5 class="card-title">Tendencia de Glucosa</h5>
                    <div class="chart-placeholder text-center py-5">
                        <img src="https://via.placeholder.com/600x200/f8f9fa/dee2e6?text=Gr%C3%A1fico+de+Glucosa+aqu%C3%AD" alt="Gráfico de Tendencia de Glucosa" class="img-fluid">
                    </div>
                    <div class="d-flex justify-content-between text-muted small mt-3">
                        <span>Lunes</span>
                        <span>Martes</span>
                        <span>Miércoles</span>
                        <span>Jueves</span>
                        <span>Viernes</span>
                        <span>Sábado</span>
                        <span>Domingo</span>
                    </div>
                </div>

                <h3 class="mb-4 mt-5">Análisis IA de Comida</h3>

                <%-- Resto del contenido del HTML --%>
                <div class="row mb-4">
                    <div class="col-md-7">
                        <div class="macro-card h-100">
                            <h5 class="card-title mb-4">Estimación de Macronutrientes</h5>
                            <div class="row">
                                <div class="col macro-item">
                                    <span class="macro-value">45%</span>
                                    <small>Carbs</small>
                                </div>
                                <div class="col macro-item">
                                    <span class="macro-value">35%</span>
                                    <small>Grasas</small>
                                </div>
                                <div class="col macro-item">
                                    <span class="macro-value">20%</span>
                                    <small>Proteínas</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="impact-card h-100">
                            <i class="bi bi-exclamation-triangle-fill icon"></i>
                            <div class="text">
                                <h5 class="card-title mb-1">Impacto Glucémico Estimado</h5>
                                <p class="mb-0"><strong>Alto</strong> <br>Esta comida podría elevar significativamente tus niveles de glucosa.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="sponsored-card">
                            <img src="<c:url value='/img/partner-logo1.png'/>" alt="Logo BienestarTotal" class="icon-img">
                            <h5 class="mb-2">Patrocinado por BienestarTotal</h5>
                            <p class="mb-3">Glucómetros precisos para ti<br>Controla tu diabetes, vive tu vida.</p>
                            <a href="<c:url value='/bienestarTotal'/>" class="btn btn-orange">Ver glucómetros</a>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="sponsored-card">
                             <img src="<c:url value='/img/partner-logo5.png'/>" alt="Logo SaborSalud" class="icon-img">
                            <h5 class="mb-2">Patrocinado por SaborSalud</h5>
                            <p class="mb-3">Alimentos de bajo índice glucémico<br>Come delicioso y cuida tu salud.</p>
                            <a href="<c:url value='/saborSalud'/>" class="btn btn-orange">Ver alimentos</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="container-fluid py-4 mt-5 border-top">
        <div class="row px-md-5">
            <div class="col-md-4 d-flex align-items-center mb-3 mb-md-0">
                <img src="<c:url value='/img/GlicemIA_icono.png'/>" alt="Icono GlicemIA" style="width: 30px; height: auto; margin-right: 10px;">
                <span class="text-muted">&copy; 2025 GlicemIA. Todos los derechos reservados.</span>
            </div>
            <div class="col-md-8 text-md-end">
                <a href="<c:url value='/terminos'/>" class="text-muted me-3 text-decoration-none">Términos y Condiciones</a>
                <a href="<c:url value='/politicaPrivacidad'/>" class="text-muted me-3 text-decoration-none">Política de Privacidad</a>
                <a href="<c:url value='/contacto'/>" class="text-muted text-decoration-none">Contacto</a>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <%-- SCRIPTS DEL JSP ORIGINAL --%>
    <script>
        /* Conversor mg <-> mmol */
        document.addEventListener("DOMContentLoaded", function () {
            const mgInput = document.querySelector('[name="valorMgDl"]');
            const mmolInput = document.querySelector('[name="valorMmolL"]');

            if (mgInput && mmolInput) {
                mgInput.addEventListener("input", function () {
                    const mgValue = parseFloat(mgInput.value);
                    if (!isNaN(mgValue)) {
                        const mmolValue = (mgValue * 0.0555).toFixed(2);
                        mmolInput.value = mmolValue;
                    } else {
                        mmolInput.value = "";
                    }
                });

                mmolInput.addEventListener("input", function () {
                    const mmolValue = parseFloat(mmolInput.value);
                    if (!isNaN(mmolValue)) {
                        const mgValue = (mmolValue / 0.0555).toFixed(0);
                        mgInput.value = mgValue;
                    } else {
                        mgInput.value = "";
                    }
                });
            }
        });

        /* Ocultar alerta de éxito después de 10 seg */
        setTimeout(() => {
            const alerta = document.querySelector('.boton');
            if (alerta) {
                alerta.style.display = 'none';
            }
        }, 10000); // 10 segundos
    </script>
</body>
</html>
