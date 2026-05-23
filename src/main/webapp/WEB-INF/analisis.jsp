<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Análisis de Alimentos - GlicemIA</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/GlicemIA_icono.png">

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Style_prueba.css">

    <style>
        /* Estilos base reutilizados (asegúrate de que estos estén en Style_prueba.css) */
        body { background-color: #fdfaf5; font-family: "Figtree", sans-serif; color: #413d3c; }
        .btn-orange { background-color: #f5843a; color: white; border: none; border-radius: 8px; padding: 10px 20px; font-weight: 500; }
        .btn-orange:hover { background-color: #e0702a; color: white; }
        .btn-gray { background-color: #e0e0e0; color: #333; border: none; border-radius: 8px; transition: 0.2s; padding: 8px 15px; }
        .btn-gray:hover { background-color: #cfcfcf; color: #000; }
        .nav-link-custom { text-decoration: none; color: #413d3c; margin-right: 1.2rem; font-weight: 500; transition: color 0.2s; }
        .nav-link-custom:hover { color: #f5843a; }
        .nav-link-active { color: #f5843a !important; font-weight: 600; }

        /* Estilos específicos para esta vista */
        .card-general {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            height: 100%; /* Asegura que las tarjetas tengan altura uniforme si están en un row */
        }
        .card-general .card-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #413d3c;
            margin-bottom: 1rem;
        }

        /* Card de Acceso Premium */
        .card-premium-access {
            background-color: #fff1e6; /* Fondo naranja claro */
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 1.5rem;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
        }
        .card-premium-access .icon-wrapper {
            background-color: #f5843a;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            flex-shrink: 0;
        }
        .card-premium-access .icon-wrapper i {
            color: white;
            font-size: 1.5rem;
        }
        .card-premium-access h6 {
            font-weight: 600;
            color: #413d3c;
            margin-bottom: 0.2rem;
        }
        .card-premium-access p {
            font-size: 0.9rem;
            color: #777;
            margin-bottom: 0;
        }
        .card-premium-access .btn-premium-action {
            background-color: #f5843a;
            color: white;
            border-radius: 8px;
            padding: 8px 15px;
            font-weight: 500;
            margin-left: auto; /* Empuja el botón a la derecha */
        }
        .card-premium-access .btn-premium-action:hover {
            background-color: #e0702a;
        }

        /* Alertas de Patrones */
        .alert-pattern {
            border-radius: 10px;
            padding: 1rem 1.2rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: flex-start;
            border: none; /* Quitamos el borde por defecto de Bootstrap */
        }
        .alert-pattern.alert-warning {
            background-color: #fff8e1; /* Amarillo muy claro */
            color: #ffc107; /* Amarillo oscuro */
        }
        .alert-pattern.alert-danger {
            background-color: #fef1f2; /* Rojo muy claro */
            color: #dc3545; /* Rojo oscuro */
        }
        .alert-pattern i {
            font-size: 1.5rem;
            margin-right: 0.8rem;
            flex-shrink: 0;
        }
        .alert-pattern h6 {
            font-weight: 600;
            margin-bottom: 0.2rem;
            color: #413d3c; /* Color del texto del título de la alerta */
        }
        .alert-pattern p {
            font-size: 0.9rem;
            margin-bottom: 0;
            color: #777;
        }
        .alert-pattern .alert-icon {
            color: #f5843a; /* Icono en naranja para destacar */
        }

        /* Tabla de Historial de Registros */
        .table-responsive-custom {
            overflow-x: auto; /* Para scroll horizontal en móviles */
        }
        .table-records {
            width: 100%;
            border-collapse: separate; /* Para que border-radius funcione */
            border-spacing: 0; /* Elimina espacio entre celdas */
            border-radius: 10px; /* Bordes redondeados de la tabla */
            overflow: hidden; /* Oculta el contenido que sobresale del borde redondeado */
        }
        .table-records thead {
            background-color: #f7f7f7;
            border-bottom: 1px solid #eee;
        }
        .table-records th, .table-records td {
            padding: 12px 15px;
            vertical-align: middle;
            border-bottom: 1px solid #eee;
        }
        .table-records th {
            font-weight: 600;
            color: #555;
            font-size: 0.9rem;
        }
        .table-records tbody tr:last-child td {
            border-bottom: none;
        }
        .table-records .date-time {
            font-size: 0.9rem;
            color: #888;
        }
        .table-records .description {
            font-weight: 500;
            color: #413d3c;
        }
        .table-records .macro-percentage {
            font-weight: 600;
            color: #f5843a;
        }
        .table-records .macro-percentage.carbs { color: #f5843a; } /* Color para Carbs */
        .table-records .macro-percentage.fats { color: #6c757d; } /* Gris para Grasas */
        .table-records .macro-percentage.proteins { color: #28a745; } /* Verde para Proteínas */

        /* Gráficos de línea */
        .chart-container-lg {
            height: 300px; /* Altura fija para los gráficos de línea */
            width: 100%;
        }
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
                <c:choose>
                    <c:when test="${not empty sessionScope.id_usuario}">
                        <a href="${pageContext.request.contextPath}/perfil" class="nav-link-custom">Perfil</a>
                        <a href="${pageContext.request.contextPath}/glucosa" class="nav-link-custom">Glucosa</a>
                        <a href="${pageContext.request.contextPath}/funcionesIA" class="nav-link-custom">Funciones IA</a>
                        <a href="${pageContext.request.contextPath}/analisis" class="nav-link-custom nav-link-active">Análisis de Alimentos</a>
                        <a href="${pageContext.request.contextPath}/recetas" class="nav-link-custom">Ver Recetas</a>
                        <a href="${pageContext.request.contextPath}/medicamentos" class="nav-link-custom">Medicamentos</a>
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-gray">Cerrar Sesión</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-light me-3" style="border-radius: 8px; font-weight: 500;">Iniciar Sesión</a>
                        <a href="${pageContext.request.contextPath}/registro" class="btn btn-orange" style="border-radius: 8px;">Registrarse</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>

    <div class="container-fluid py-4 px-md-5">
        <h3 class="mb-1" style="font-weight: 700; color: #413d3c;">Análisis de Alimentos</h3>
        <p class="text-muted mb-4">Revisa tu historial de comidas, su análisis y las alertas generadas.</p>

        <div class="row mb-5">
            <div class="col-lg-8">
                <div class="card-premium-access mb-4">
                    <div class="icon-wrapper">
                        <i class="bi bi-award-fill"></i>
                    </div>
                    <div>
                        <h6>Accede a Analisis Avanzado con Premium</h6>
                        <p>Conecta tus datos de glucosa para obtener tendencias y predicciones personalizadas basadas en tu alimentación. ¡Mejora tu control hoy!</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/funcionesIA" class="btn btn-premium-action">Actualizar a Premium</a>
                </div>

                <h5 class="mb-3" style="font-weight: 600;">Alertas de Patrones</h5>
                <div class="alert-pattern alert-danger" role="alert">
                    <i class="bi bi-arrow-up-circle-fill alert-icon"></i>
                    <div>
                        <h6>Alto consumo de carbohidratos en cenas</h6>
                        <p>Se ha detectado un patrón de cenas con más del 50% de carbohidratos en los últimos 7 días. Esto podría estar afectando tus niveles de glucosa matutinos.</p>
                    </div>
                </div>
                <div class="alert-pattern alert-warning" role="alert">
                    <i class="bi bi-exclamation-triangle-fill alert-icon"></i>
                    <div>
                        <h6>Bajo consumo de proteínas en almuerzos</h6>
                        <p>Tus almuerzos tienen en promedio menos del 20% de proteínas. Considera aumentarlas para mayor saciedad y mejor control glucémico.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card-general">
                    <h5 class="card-title">Distribucion Promedio</h5>
                    <div style="height: 250px; display: flex; align-items: center; justify-content: center;">
                        <canvas id="macroDistributionChart"></canvas>
                    </div>
                    <div class="d-flex justify-content-center mt-3 small text-muted">
                        <div class="me-3"><span class="badge" style="background-color: #f5843a;"></span> Carbohidratos</div>
                        <div class="me-3"><span class="badge" style="background-color: #6c757d;"></span> Grasas</div>
                        <div><span class="badge" style="background-color: #28a745;"></span> Proteínas</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-general">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="card-title mb-0">Historial de Registros</h5>
                <div class="d-flex align-items-center">
                    <div class="dropdown me-2">
                        <button class="btn btn-light dropdown-toggle" type="button" id="dropdownTipos" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-funnel me-2"></i>Todos los tipos
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownTipos">
                            <li><a class="dropdown-item" href="#">Desayuno</a></li>
                            <li><a class="dropdown-item" href="#">Almuerzo</a></li>
                            <li><a class="dropdown-item" href="#">Cena</a></li>
                            <li><a class="dropdown-item" href="#">Merienda</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Ver Todos</a></li>
                        </ul>
                    </div>
                    <div class="input-group me-2" style="width: 180px;">
                        <input type="text" class="form-control" placeholder="mm/dd/yyyy">
                        <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                    </div>
                    <button class="btn btn-orange">
                        <i class="bi bi-box-arrow-down me-2"></i>Exportar
                    </button>
                    <!-- todo: exportar? -->
                </div>
            </div>

            <div class="table-responsive-custom">
                <table class="table table-records">
                    <thead>
                        <tr>
                            <th>Fecha y Hora</th>
                            <th>Descripción</th>
                            <th>Carbs</th>
                            <th>Grasas</th>
                            <th>Proteínas</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div>23/07/2024</div>
                                <div class="date-time">08:15 AM - Desayuno</div>
                            </td>
                            <td class="description">2 tostadas de pan integral con aguacate y un huevo revuelto.</td>
                            <td class="macro-percentage carbs">40%</td>
                            <td class="macro-percentage fats">35%</td>
                            <td class="macro-percentage proteins">25%</td>
                        </tr>
                        <tr>
                            <td>
                                <div>22/07/2024</div>
                                <div class="date-time">02:30 PM - Almuerzo</div>
                            </td>
                            <td class="description">Pechuga de pollo a la plancha con quinoa y brócoli al vapor.</td>
                            <td class="macro-percentage carbs">30%</td>
                            <td class="macro-percentage fats">20%</td>
                            <td class="macro-percentage proteins">50%</td>
                        </tr>
                        <tr>
                            <td>
                                <div>22/07/2024</div>
                                <div class="date-time">08:00 PM - Cena</div>
                            </td>
                            <td class="description">Sopa de lentejas con verduras.</td>
                            <td class="macro-percentage carbs">55%</td>
                            <td class="macro-percentage fats">15%</td>
                            <td class="macro-percentage proteins">30%</td>
                        </tr>
                        <tr>
                            <td>
                                <div>21/07/2024</div>
                                <div class="date-time">04:00 PM - Snack</div>
                            </td>
                            <td class="description">Un puñado de almendras y una manzana.</td>
                            <td class="macro-percentage carbs">35%</td>
                            <td class="macro-percentage fats">50%</td>
                            <td class="macro-percentage proteins">15%</td>
                        </tr>
                        </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="card-general">
                    <h5 class="card-title">Consumo de Carbohidratos (Últimos 7 días)</h5>
                    <div class="chart-container-lg">
                        <canvas id="carbsWeeklyChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card-general">
                    <h5 class="card-title">Consumo de Proteínas (Últimos 7 días)</h5>
                    <div class="chart-container-lg">
                        <canvas id="proteinsWeeklyChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- DONACIÓN -->
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

<!-- FOOTER -->
<footer class="container py-4 mt-5 border-top">
    <div class="row">
        <div class="col-md-4 d-flex align-items-center mb-3 mb-md-0">
            <img src="${pageContext.request.contextPath}/img/GlicemIA_icono.png" alt="Icono GlicemIA"
                 style="width: 30px; height: auto; margin-right: 10px;">
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

    <script>
        // Gráfico de Distribución Promedio (Donut Chart)
        const macroDistributionCtx = document.getElementById('macroDistributionChart').getContext('2d');
        new Chart(macroDistributionCtx, {
            type: 'doughnut',
            data: {
                labels: ['Carbohidratos', 'Grasas', 'Proteínas'],
                datasets: [{
                    data: [45, 30, 25], // Datos hardcodeados, reemplazar con datos JSP
                    backgroundColor: ['#f5843a', '#6c757d', '#28a745'],
                    borderColor: '#fff',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false // Oculta la leyenda del gráfico, la mostraremos abajo de forma personalizada
                    }
                }
            }
        });

        // Gráfico de Consumo de Carbohidratos (Línea)
        const carbsWeeklyCtx = document.getElementById('carbsWeeklyChart').getContext('2d');
        new Chart(carbsWeeklyCtx, {
            type: 'line',
            data: {
                labels: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'], // Días de la semana
                datasets: [{
                    label: 'Carbohidratos (%)',
                    data: [40, 45, 38, 50, 42, 48, 55], // Datos hardcodeados, reemplazar con datos JSP
                    borderColor: '#f5843a',
                    backgroundColor: 'rgba(245, 132, 58, 0.2)', // Fondo suave
                    fill: true,
                    tension: 0.4,
                    pointRadius: 4,
                    pointBackgroundColor: '#f5843a',
                    pointBorderColor: '#fff',
                    pointHoverRadius: 6
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 100,
                        title: {
                            display: true,
                            text: '%'
                        }
                    },
                    x: {
                        title: {
                            display: false
                        }
                    }
                }
            }
        });

        // Gráfico de Consumo de Proteínas (Línea)
        const proteinsWeeklyCtx = document.getElementById('proteinsWeeklyChart').getContext('2d');
        new Chart(proteinsWeeklyCtx, {
            type: 'line',
            data: {
                labels: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'], // Días de la semana
                datasets: [{
                    label: 'Proteínas (%)',
                    data: [25, 20, 28, 22, 30, 25, 20], // Datos hardcodeados, reemplazar con datos JSP
                    borderColor: '#28a745', // Color verde
                    backgroundColor: 'rgba(40, 167, 69, 0.2)', // Fondo suave
                    fill: true,
                    tension: 0.4,
                    pointRadius: 4,
                    pointBackgroundColor: '#28a745',
                    pointBorderColor: '#fff',
                    pointHoverRadius: 6
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 100,
                        title: {
                            display: true,
                            text: '%'
                        }
                    },
                    x: {
                        title: {
                            display: false
                        }
                    }
                }
            }
        });

        // Script para el input de fecha en el historial (simula un datepicker básico)
        document.addEventListener('DOMContentLoaded', function() {
            const dateInput = document.querySelector('.input-group input[type="text"]');
            if (dateInput) {
                // Puedes integrar un datepicker real aquí si lo deseas
                // Por ahora, solo es un placeholder visual
            }
        });
    </script>

</body>
</html>
