<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagar Premium - GlicemIA</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Figtree:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Style_prueba.css">

    <style>
        body { background-color: #fdfaf5; font-family: "Figtree", sans-serif; color: #413d3c; }
        .btn-orange { background-color: #f5843a; color: white; border: none; border-radius: 8px; padding: 10px 20px; font-weight: 500; }
        .btn-orange:hover { background-color: #e0702a; }
        .btn-gray { background-color: #e0e0e0; color: #333; border-radius: 8px; padding: 8px 15px; transition: 0.2s; }
        .btn-gray:hover { background-color: #cfcfcf; }
        .nav-link-custom { text-decoration: none; color: #413d3c; margin-right: 1.2rem; font-weight: 500; }
        .nav-link-custom:hover { color: #f5843a; }
        .nav-link-active { color: #f5843a !important; font-weight: 600; }
        .premium-hero { padding-top: 4rem; padding-bottom: 4rem; text-align: center; }
        .premium-hero h1 { font-size: 2.8rem; font-weight: 700; color: #413d3c; }
        .premium-hero .highlight { color: #f5843a; }
        .premium-offer-container { background: #fff; border-radius: 15px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); padding: 3rem; max-width: 900px; margin: -3rem auto 4rem; display: flex; flex-wrap: wrap; }
        .benefits-section { flex: 1; min-width: 300px; padding-right: 2rem; }
        .plan-payment-section { flex: 1; min-width: 350px; padding-left: 2rem; border-left: 1px solid #eee; }
        @media (max-width: 768px) {
            .plan-payment-section { padding-left: 0; border-left: none; border-top: 1px solid #eee; margin-top: 2rem; padding-top: 2rem; }
            .benefits-section { padding-right: 0; }
        }
        .plan-card { border: 1px solid #ddd; border-radius: 10px; padding: 1.5rem; text-align: center; transition: 0.2s; }
        .plan-card.active { border-color: #f5843a; background: #fffaf5; box-shadow: 0 0 0 3px rgba(245,132,58,0.3); }
        .plan-price { font-size: 2.2rem; font-weight: 700; color: #413d3c; }
        .plan-duration { font-size: 0.9rem; color: #777; }
    </style>
</head>
<body>

    <nav class="container-fluid border-bottom">
    <div class="row align-items-center py-2 px-md-5">
        <div class="col-auto d-flex align-items-center">
            <img src="${pageContext.request.contextPath}/img/GlicemIA_icono.png" alt="Icono de GlicemIA"
                 style="width: 30px; height: auto; margin-right: 8px;">
            <h6 class="mb-0" style="font-weight: 600;">Glicem<span style="color: #d2691e;">IA</span></h6>
        </div>
        <div class="col text-end">
            <a href="${pageContext.request.contextPath}/perfil" class="nav-link-custom">Perfil</a>
            <a href="${pageContext.request.contextPath}/glucosa" class="nav-link-custom">Glucosa</a>
            <a href="${pageContext.request.contextPath}/funcionesIA" class="nav-link-custom nav-link-active">Funciones IA</a>
            <a href="${pageContext.request.contextPath}/analisis" class="nav-link-custom">Análisis de Alimentos</a>
            <a href="${pageContext.request.contextPath}/recetas" class="nav-link-custom">Ver Recetas</a>
            <a href="${pageContext.request.contextPath}/medicamentos" class="nav-link-custom">Medicamentos</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-gray">Cerrar Sesión</a>
        </div>
    </div>
</nav>

    <section class="premium-hero container-fluid">
        <h1>Desbloquea todo el potencial de <span class="highlight">GlicemIA Premium</span></h1>
        <p>Toma el control definitivo de tu glucemia con nuestras herramientas de inteligencia artificial más avanzadas.</p>
    </section>

    <div class="premium-offer-container">
        <div class="benefits-section col-md-6">
            <h4 class="mb-4 fw-semibold">Beneficios del Plan Premium</h4>
            <ul class="list-unstyled">
                <li><i class="bi bi-check-circle-fill text-warning me-2"></i> Análisis Predictivo Avanzado</li>
                <li><i class="bi bi-check-circle-fill text-warning me-2"></i> Planes de Comida Dinámicos</li>
                <li><i class="bi bi-check-circle-fill text-warning me-2"></i> Asistente Virtual 24/7</li>
                <li><i class="bi bi-check-circle-fill text-warning me-2"></i> Informes para tu Médico</li>
                <li><i class="bi bi-check-circle-fill text-warning me-2"></i> Acceso a futuras funciones</li>
            </ul>
        </div>

        <div class="plan-payment-section col-md-6">
            <h4 class="mb-4 fw-semibold">Elige tu Plan</h4>
            <div class="d-flex gap-3">
                <div class="plan-card active">
                    <small class="badge bg-warning text-dark">MÁS POPULAR</small>
                    <div class="plan-price">$99.99<span class="plan-duration">/año</span></div>
                </div>
                <div class="plan-card">
                    <div class="plan-price">$9.99<span class="plan-duration">/mes</span></div>
                </div>
            </div>
            <button class="btn btn-orange w-100 mt-4"><i class="bi bi-lock-fill me-2"></i>Suscribirse ahora</button>
            <p class="text-muted small mt-3">Transacción simulada (vista no funcional).</p>
        </div>
    </div>

    <footer class="container-fluid py-4 mt-5 border-top text-center text-muted">
        <p>&copy; 2025 GlicemIA. Todos los derechos reservados.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</body>
</html>
