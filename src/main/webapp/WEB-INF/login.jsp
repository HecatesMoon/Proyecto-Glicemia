<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <link rel="stylesheet" href="/css/Style_prueba.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">
    <title>Login GlicemIA</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/GlicemIA_icono.png">
</head>
<body style="background: linear-gradient(rgb(255, 228, 178), orange);">
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-5 p-5 rounded-5" style="background-color: rgb(255, 255, 255);">

                <div class="text-center">
                    <img src="/img/GlicemIA_icono.png" alt="Icono de GlicemIA" class="mb-3" style="width: 100px; height: auto;">
                </div>

                <h3 id="bienV" class="text-center">Bienvenido a GlicemIA</h3>

                <%--
                  FORMULARIO JSP:
                  Conectado a tu controlador:
                  - action="/procesa/login"
                  - method="POST"
                  - modelAttribute="loginUsuario"
                --%>
                <form:form method="POST" action="/procesa/login" modelAttribute="loginUsuario">
                    <h6 id="iniciaS" class="text-center mb-4">Inicia Sesión para continuar</h6>

                    <%-- CAMPO CORREO --%>
                    <div class="mb-3 input-group">
                        <span class="input-group-text">
                            <i class="bi bi-person-fill"></i>
                        </span>
                        <%-- Etiqueta <form:input> para "correo" --%>
                        <form:input path="correo" class="form-control" placeholder="Tu correo"/>
                    </div>
                    <%-- Etiqueta <form:errors> para mostrar errores de validación --%>
                    <form:errors path="correo" cssClass="alert alert-danger p-1 text-center small"/>

                    <%-- CAMPO CONTRASEÑA --%>
                    <div class="mb-3 input-group">
                        <span class="input-group-text">
                            <i class="bi bi-lock-fill"></i>
                        </span>
                        <%-- Etiqueta <form:input> para "contrasenia" --%>
                        <form:input path="contrasenia" type="password" class="form-control" placeholder="Tu contraseña"/>
                    </div>
                    <%-- Etiqueta <form:errors> para mostrar errores de validación --%>
                    <form:errors path="contrasenia" cssClass="alert alert-danger p-1 text-center small"/>

                    <div id="pNaranjo" class="text-end"> <p style="cursor: pointer; user-select: none;" title="bajo construccion" >¿Olvidaste tu contraseña?</p> </div>

                    <div class="d-grid">
                        <button type="submit" id="naranjo" class="btn btn-primary morado">Iniciar Sesión</button>
                    </div>
                    <div id="noTienesC" class="text-center"><p>¿No tienes una cuenta? <a id="pNaranjo" href="/registro">Registrate</a></p></div>

                </form:form> <%-- Fin del formulario de Spring --%>
            </div>
        </div>
    </div>

    <%-- Script de Bootstrap (del ejemplo JSP) --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

