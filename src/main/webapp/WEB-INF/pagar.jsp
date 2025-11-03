<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%-- NECESARIO para <form:form> --%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GlicemIA Premium - Pago</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">

    <%-- Tu CSS personalizado. Asegúrate de que la ruta sea correcta --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Style_prueba.css">

    <style>
        /* Estilos base reutilizados */
        body { background-color: #fdfaf5; font-family: "Figtree", sans-serif; color: #413d3c; }
        .btn-orange { background-color: #f5843a; color: white; border: none; border-radius: 8px; padding: 10px 20px; font-weight: 500; }
        .btn-orange:hover { background-color: #e0702a; color: white; }
        .btn-gray { background-color: #e0e0e0; color: #333; border: none; border-radius: 8px; transition: 0.2s; padding: 8px 15px; }
        .btn-gray:hover { background-color: #cfcfcf; color: #000; }
        .nav-link-custom { text-decoration: none; color: #413d3c; margin-right: 1.2rem; font-weight: 500; transition: color 0.2s; }
        .nav-link-custom:hover { color: #f5843a; }
        .nav-link-active { color: #f5843a !important; font-weight: 600; }

        /* Estilos específicos para esta vista (puedes moverlos a tu Style_prueba.css) */
        .premium-hero { padding-top: 4rem; padding-bottom: 4rem; text-align: center; }
        .premium-hero h1 { font-size: 2.8rem; font-weight: 700; color: #413d3c; margin-bottom: 1rem; }
        .premium-hero h1 .highlight { color: #f5843a; }
        .premium-hero p { font-size: 1.1rem; color: #777; max-width: 700px; margin: 0 auto 3rem; }

        .premium-offer-container {
            background-color: #fff; border-radius: 15px; box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 2.5rem 3rem; max-width: 900px; margin: -3rem auto 4rem;
        }

        .benefits-section { border-right: 1px solid #eee; padding-right: 2.5rem; }
        .benefit-item { display: flex; align-items: flex-start; margin-bottom: 1.2rem; }
        .benefit-item .icon { color: #f5843a; font-size: 1.2rem; margin-right: 0.8rem; flex-shrink: 0; line-height: 1.5; }
        .benefit-item p { font-size: 0.95rem; line-height: 1.5; color: #555; margin-bottom: 0; }
        .benefit-item p strong { color: #413d3c; font-weight: 600; }

        .plan-payment-section { padding-left: 2.5rem; }
        .plan-options { display: flex; gap: 1rem; margin-bottom: 2rem; }
        .plan-card {
            border: 1px solid #ddd; border-radius: 10px; padding: 1.5rem 1rem; text-align: center;
            cursor: pointer; flex: 1; position: relative; transition: all 0.2s ease-in-out;
        }
        .plan-card:hover { border-color: #f5843a; }
        .plan-card.active {
            border-color: #f5843a; box-shadow: 0 0 0 3px rgba(245, 132, 58, 0.3); background-color: #fffaf5;
        }
        .plan-card.active .plan-price { color: #f5843a; }
        .plan-card small.badge {
            position: absolute; top: -12px; left: 50%; transform: translateX(-50%); background-color: #f5843a;
        }
        .plan-price { font-size: 2.2rem; font-weight: 700; color: #413d3c; margin-bottom: 0.2rem; }
        .plan-duration { font-size: 0.9rem; color: #777; }
        .plan-discount { font-size: 0.8rem; color: #5cb85c; margin-top: 0.5rem; display: block; }

        .form-label-custom { font-size: 0.9rem; color: #555; margin-bottom: 0.3rem; display: block; font-weight: 500; }
        .form-control-payment { border: 1px solid #ddd; border-radius: 8px; padding: 0.8rem 1rem; }
        .form-control-payment:focus { border-color: #f5843a; box-shadow: 0 0 0 0.25rem rgba(245, 132, 58, 0.25); }
        .btn-subscribe { width: 100%; font-size: 1.1rem; font-weight: 600; padding: 12px; margin-top: 1rem; }
        .terms-text { font-size: 0.85rem; color: #777; margin-top: 1.5rem; text-align: center; }

        @media (max-width: 768px) {
            .benefits-section { border-right: none; padding-right: 0; padding-bottom: 1.5rem; border-bottom: 1px solid #eee; }
            .plan-payment-section { padding-left: 0; padding-top: 1.5rem; }
            .premium-offer-container { padding: 1.5rem; margin-top: -2rem; }
        }
    </style>
</head>
<body>

    <nav class="container-fluid border-bottom">
        <div class="row align-items-center py-2 px-md-5">
            <div class="col-auto d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/img/GlicemIA_icono.png" alt="Icono de GlicemIA" style="width: 30px; height: auto; margin-right: 8px;">
                <h6 class="mb-0" style="font-weight: 600;">Glicem<span style="color: #d2691e;">IA</span></h6>
            </div>
            <div class="col text-end">
                <a href="${pageContext.request.contextPath}/perfil" class="nav-link-custom">Perfil</a>
                <a href="${pageContext.request.contextPath}/glucosa" class="nav-link-custom">Glucosa</a>
                <a href="${pageContext.request.contextPath}/asistente" class="nav-link-custom nav-link-active">Funciones IA Premium</a>
                <a href="${pageContext.request.contextPath}/analisisAlimentos" class="nav-link-custom">Análisis de Alimentos</a>
                <a href="${pageContext.request.contextPath}/verRecetas" class="nav-link-custom">Ver Recetas</a>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-gray">Cerrar Sesión</a>
            </div>
        </div>
    </nav>

    <section class="premium-hero container-fluid">
        <h1>Desbloquea todo el potencial de <br><span class="highlight">GlicemIA Premium</span></h1>
        <p>Toma el control definitivo de tu glucemia con nuestras herramientas de inteligencia artificial más avanzadas.</p>
    </section>

    <div class="premium-offer-container container">
        <div class="row">

            <div class="benefits-section col-md-6">
                <h4 class="mb-4" style="font-weight: 600;">Beneficios del Plan Premium</h4>

                <div class="benefit-item">
                    <i class="bi bi-check-circle-fill icon"></i>
                    <p><strong>Análisis Predictivo Avanzado:</strong> Anticípate a las fluctuaciones de glucosa con hasta 24 horas de antelación.</p>
                </div>
                <div class="benefit-item">
                    <i class="bi bi-check-circle-fill icon"></i>
                    <p><strong>Planes de Comida Dinámicos:</strong> Planes que se ajustan automáticamente según tus registros y actividad.</p>
                </div>
                <div class="benefit-item">
                    <i class="bi bi-check-circle-fill icon"></i>
                    <p><strong>Asistente Virtual 24/7:</strong> Soporte prioritario y respuestas más profundas basadas en tu historial completo.</p>
                </div>
                <div class="benefit-item">
                    <i class="bi bi-check-circle-fill icon"></i>
                    <p><strong>Informes para tu Médico:</strong> Genera informes detallados y fáciles de entender para compartir con tu equipo de salud.</p>
                </div>
                <div class="benefit-item">
                    <i class="bi bi-check-circle-fill icon"></i>
                    <p><strong>Acceso a todas las funciones futuras:</strong> Sé el primero en disfrutar de las nuevas herramientas que lancemos.</p>
                </div>
            </div>

            <div class="plan-payment-section col-md-6">
                <h4 class="mb-4" style="font-weight: 600;">Elige tu Plan</h4>

                <div class="plan-options">
                    <div class="plan-card active" data-plan="anual">
                        <small class="badge rounded-pill text-bg-warning">MÁS POPULAR</small>
                        <div class="plan-price">$99.99<span class="plan-duration">/año</span></div>
                        <small class="plan-discount">Ahorra un 15%</small>
                    </div>

                    <div class="plan-card" data-plan="mensual">
                        <div class="plan-price">$9.99<span class="plan-duration">/mes</span></div>
                    </div>
                </div>

                <h6 class="mb-3" style="font-weight: 600;">Métodos de Pago Seguros</h6>
                <div class="payment-methods d-flex justify-content-center gap-3 mb-4">
                    <i class="bi bi-credit-card-2-front-fill fs-3 text-secondary"></i>
                    <i class="bi bi-paypal fs-3 text-secondary"></i>
                    <i class="bi bi-wallet2 fs-3 text-secondary"></i>
                </div>

                <%-- Formulario de Spring Boot para enlazar con el objeto 'pago' en el controlador --%>
                <form:form action="${pageContext.request.contextPath}/suscribirse" method="post" modelAttribute="pago">

                    <%-- Campo oculto para el plan seleccionado. Deberás añadir 'planSeleccionado' a tu clase Pago --%>
                    <input type="hidden" name="planSeleccionado" id="planSeleccionado" value="anual">

                    <div class="mb-3">
                        <form:label path="numeroTarjeta" class="form-label-custom">Número de Tarjeta</form:label>
                        <form:input path="numeroTarjeta" class="form-control form-control-payment" placeholder="xxxx xxxx xxxx xxxx" required="true"/>
                        <%-- Aquí podrías añadir form:errors para validación --%>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <form:label path="fechaVencimiento" class="form-label-custom">Fecha de Vencimiento</form:label>
                            <form:input path="fechaVencimiento" class="form-control form-control-payment" placeholder="MM/AA" required="true"/>
                            <%-- Aquí podrías añadir form:errors para validación --%>
                        </div>
                        <div class="col-md-6">
                            <form:label path="cvc" class="form-label-custom">CVC</form:label>
                            <form:input path="cvc" class="form-control form-control-payment" placeholder="***" required="true"/>
                            <%-- Aquí podrías añadir form:errors para validación --%>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-orange btn-subscribe"><i class="bi bi-lock-fill me-2"></i>Suscribirse ahora</button>
                    <p class="terms-text">Transacción segura y encriptada. Puedes cancelar en cualquier momento.</p>
                </form:form>
            </div>
        </div>
    </div>

    <footer class="container-fluid py-4 mt-5 border-top">
        <div class="row px-md-5">
            <div class="col-md-4 d-flex align-items-center mb-3 mb-md-0">
                <img src="${pageContext.request.contextPath}/img/GlicemIA_icono.png" alt="Icono GlicemIA" style="width: 30px; height: auto; margin-right: 10px;">
                <span class="text-muted">&copy; 2025 GlicemIA. Todos los derechos reservados.</span>
            </div>
            <div class="col-md-8 text-md-end">
                <a href="${pageContext.request.contextPath}/terminos" class="text-muted me-3 text-decoration-none">Términos y Condiciones</a>
                <a href="${pageContext.request.contextPath}/politicaPrivacidad" class="text-muted me-3 text-decoration-none">Política de Privacidad</a>
                <a href="${pageContext.request.contextPath}/contacto" class="text-muted text-decoration-none">Contacto</a>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Script para manejar la selección de planes
        document.addEventListener('DOMContentLoaded', function() {
            const planCards = document.querySelectorAll('.plan-card');
            const planInput = document.getElementById('planSeleccionado');

            planCards.forEach(card => {
                card.addEventListener('click', function() {
                    // Quita 'active' de todas las tarjetas
                    planCards.forEach(c => c.classList.remove('active'));
                    // Añade 'active' a la tarjeta clickeada
                    this.classList.add('active');
                    // Actualiza el valor del input oculto
                    planInput.value = this.dataset.plan;
                });
            });
        });
    </script>
</body>
</html>
