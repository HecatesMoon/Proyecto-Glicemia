<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- No se necesita el taglib de 'form' de Spring para este HTML --%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gracias por Apoyarnos - GlicemIA</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/GlicemIA_icono.png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <%-- Ruta ajustada para Spring Boot: asume que Style_prueba.css está en src/main/resources/static/css/ --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Style_prueba.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">

    <style>
        /* Estilos específicos que podrías querer mover a Style_prueba.css */
        body {
            background: linear-gradient(rgb(255, 228, 178), orange);
        }
        #tuApoyo {
            color: #413d3c; /* Color de texto más oscuro */
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
        }
        #iniciaS, #donacion, #cadaCon {
            color: #666; /* Un gris para texto secundario */
            font-size: 1rem;
            line-height: 1.6;
        }
        #donacion {
            font-size: 1.5rem;
            font-weight: 600;
            color: #f5843a; /* Naranja como tu color principal */
            margin-top: 2rem;
            margin-bottom: 1.5rem;
        }
        .iconosNaran {
            font-size: 3rem; /* Iconos más grandes */
            color: #f5843a; /* Naranja */
            margin-bottom: 0.5rem;
        }
        .titColumnDona {
            font-size: 1.1rem;
            font-weight: 600;
            color: #413d3c;
            margin-bottom: 0.3rem;
        }
        .parrafoCol {
            font-size: 0.85rem;
            color: #777;
        }
        #naranjo {
            background-color: #f5843a; /* Botón naranja */
            border-color: #f5843a;
            color: white;
            padding: 12px 20px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 8px;
            transition: background-color 0.2s ease;
        }
        #naranjo:hover {
            background-color: #e0702a; /* Naranja más oscuro al pasar el ratón */
            border-color: #e0702a;
        }
        .material-symbols-outlined.me-2 {
            font-size: 1.5rem; /* Ajusta el tamaño del icono dentro del botón */
        }
    </style>
</head>
<body style="background: linear-gradient(rgb(255, 228, 178), orange);">
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-5 p-5 rounded-5" style="background-color: rgb(255, 255, 255);">

                <div class="text-center">
                    <%-- Ruta ajustada para Spring Boot --%>
                    <img src="${pageContext.request.contextPath}/img/corazon_icono.png" alt="Icono de GlicemIA" class="mb-3" style="width: 100px; height: auto;">
                </div>

                <h3 id="tuApoyo" class="text-center">¡Tu apoyo hace la Diferencia!</h3>

                <%-- Acción del formulario se mantiene como "#", significa que se envía a la misma página --%>
                <%-- Si necesitas que el botón haga POST a un controlador, cambia 'action="#"' a 'action="${pageContext.request.contextPath}/tuRutaDeDonacion"' --%>
                <form method="get" action="${pageContext.request.contextPath}/pagar">
                    <span>
                        <h6 id="iniciaS" class="text-center mb-4">GlicemIA es una herramienta gratuita que ayuda a miles de personas a gestionar su glucemia. Tu donación nos permite seguir mejorando y manteniendo la aplicación para todos.</h6>
                        <hr>
                    </span>

                    <div> <h5 id="donacion" class="text-center mb-4">¿Cómo impacta tu donación?</h5></div>
                    <div class="row text-center">
                        <div class="col">
                            <span class="material-symbols-outlined iconosNaran">developer_mode</span>
                            <h5 class="titColumnDona">Nuevas funciones</h5>
                            <p class="parrafoCol">Desarrollamos herramientas más inteligentes</p>
                        </div>
                        <div class="col">
                            <span class="material-symbols-outlined iconosNaran">dns</span>
                            <h5 class="titColumnDona">Mantenimiento</h5>
                            <p class="parrafoCol">Aseguramos que la app funcione 24/7.</p>
                        </div>
                        <div class="col">
                            <span class="material-symbols-outlined iconosNaran">support_agent</span>
                            <h5 class="titColumnDona">Soporte</h5>
                            <p class="parrafoCol">Ofrecemos ayuda a nuestros usuarios.</p>
                        </div>
                    </div>
                    <hr>

                    <div class="d-grid">
                        <button type="submit" id="naranjo" class="btn btn-primary morado d-flex align-items-center justify-content-center">
                            <span class="material-symbols-outlined me-2">volunteer_activism</span> Hacer una donación
                        </button>
                    </div>
                    <div id="cadaCon" class="text-center mt-3"><p>Cada contribución, por pequeña que sea, es increíblemente valiosa. ¡Gracias por ser parte de nuestra comunidad!</p></div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
