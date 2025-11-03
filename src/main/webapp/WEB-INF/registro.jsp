<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regístrate en GlicemIA</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Style_prueba.css">

    <style>
        /* Estilos base reutilizados (si no están en Style_prueba.css) */
        body {
            background-color: #fdfaf5; /* Fondo claro */
            font-family: "Figtree", sans-serif;
            color: #413d3c;
            display: flex;
            justify-content: center; /* Centra el contenido horizontalmente */
            align-items: center; /* Centra el contenido verticalmente */
            min-height: 100vh; /* Ocupa al menos toda la altura de la ventana */
            margin: 0;
        }
        .btn-orange { background-color: #f5843a; color: white; border: none; border-radius: 8px; padding: 10px 20px; font-weight: 500; }
        .btn-orange:hover { background-color: #e0702a; color: white; }
        .btn-gray { background-color: #e0e0e0; color: #333; border: none; border-radius: 8px; transition: 0.2s; padding: 8px 15px; }

        /* Contenedor principal del formulario */
        .registro-container {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
            padding: 2.5rem 3rem;
            max-width: 550px; /* Ancho máximo para que no sea demasiado grande */
            width: 100%;
            text-align: center;
        }

        .registro-container h1 {
            font-size: 2.2rem;
            font-weight: 700;
            color: #413d3c;
            margin-bottom: 0.5rem;
        }
        .registro-container h3 {
            font-size: 1.1rem;
            color: #777;
            margin-bottom: 2rem;
            font-weight: 400;
        }

        /* Estilos de los campos del formulario */
        .form-label-custom {
            font-size: 0.95rem;
            color: #555;
            text-align: left;
            display: block;
            margin-bottom: 0.4rem;
            font-weight: 500;
        }
        .form-control-custom {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 0.8rem 1rem;
            transition: border-color 0.2s;
        }
        .form-control-custom:focus {
            border-color: #f5843a;
            box-shadow: 0 0 0 0.25rem rgba(245, 132, 58, 0.25);
        }
        .input-group-text-custom {
            background-color: transparent;
            border: 1px solid #ddd;
            border-left: none; /* Se fusiona con el input */
            border-radius: 0 8px 8px 0;
            cursor: pointer;
            padding-right: 1rem;
        }
        .input-group-text-custom i {
            color: #777;
        }

        /* Mensajes de error de Spring Form */
        .mensaje-error {
            font-size: 0.85rem;
            color: #dc3545;
            margin-top: 0.3rem;
            text-align: left;
        }

        /* Botón de Registro */
        .btn-registro {
            width: 100%;
            font-size: 1.1rem;
            font-weight: 600;
            padding: 0.9rem 1.5rem;
            margin-top: 1.5rem;
        }

        /* Separador "O continúa con" */
        .separator {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 2rem 0;
            color: #888;
        }
        .separator::before,
        .separator::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #eee;
        }
        .separator:not(:empty)::before {
            margin-right: .5em;
        }
        .separator:not(:empty)::after {
            margin-left: .5em;
        }

        /* Botones de redes sociales */
        .btn-social {
            width: 100%;
            padding: 0.8rem;
            border-radius: 8px;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.7rem;
            transition: background-color 0.2s;
        }
        .btn-google {
            background-color: #f7f7f7;
            color: #413d3c;
            border: 1px solid #ddd;
        }
        .btn-google:hover {
            background-color: #e0e0e0;
            border-color: #ccc;
        }
        .btn-google img {
            width: 20px;
            height: 20px;
        }
        .btn-facebook {
            background-color: #1877f2;
            color: white;
            border: none;
        }
        .btn-facebook:hover {
            background-color: #156ad8;
        }
        .btn-facebook i {
            font-size: 1.2rem;
        }

        /* Enlace de "Ya tienes una cuenta?" */
        .login-link {
            margin-top: 2rem;
            font-size: 0.95rem;
        }
        .login-link a {
            color: #f5843a;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.2s;
        }
        .login-link a:hover {
            color: #e0702a;
        }
    </style>
</head>
<body>
    <div class="registro-container">
        <h1>Regístrate en Glicem<span style="color: #d2691e;">IA</span></h1>
        <h3>Controla tu glucemia de forma inteligente</h3>

        <form:form action="${pageContext.request.contextPath}/agregar/usuario" method="POST" modelAttribute="nuevoUsuario">
            <div class="row g-3 mb-3">
                <div class="col-md-6 text-start">
                    <form:label class="form-label-custom" path="nombre">Nombre</form:label>
                    <form:input class="form-control form-control-custom" path="nombre" type="text" placeholder="Tu nombre"/>
                    <form:errors class="mensaje-error" path="nombre"/>
                </div>
                <div class="col-md-6 text-start">
                    <form:label class="form-label-custom" path="apellido">Apellido</form:label>
                    <form:input class="form-control form-control-custom" path="apellido" type="text" placeholder="Tu apellido"/>
                    <form:errors class="mensaje-error" path="apellido"/>
                </div>
            </div>

            <div class="mb-3 text-start">
                <form:label class="form-label-custom" path="correo">Correo electrónico</form:label>
                <form:input class="form-control form-control-custom" path="correo" type="email" placeholder="tu.correo@ejemplo.com"/>
                <form:errors class="mensaje-error" path="correo"/>
            </div>

            <div class="mb-3 text-start">
                <form:label class="form-label-custom" path="contrasenia">Contraseña</form:label>
                <div class="input-group">
                    <form:input class="form-control form-control-custom border-end-0" path="contrasenia" type="password" id="contrasenia" placeholder="Crea una contraseña segura"/>
                    <span class="input-group-text input-group-text-custom" id="togglePassword">
                        <i class="bi bi-eye-slash" id="passwordIcon"></i>
                    </span>
                </div>
                <form:errors class="mensaje-error" path="contrasenia"/>
            </div>

            <div class="mb-3 text-start">
                <form:label class="form-label-custom" path="confirmarContrasenia">Confirmar contraseña</form:label>
                <div class="input-group">
                    <form:input class="form-control form-control-custom border-end-0" path="confirmarContrasenia" type="password" id="confirmarContrasenia" placeholder="Vuelve a escribir la contraseña"/>
                    <span class="input-group-text input-group-text-custom" id="toggleConfirmPassword">
                        <i class="bi bi-eye-slash" id="confirmPasswordIcon"></i>
                    </span>
                </div>
                <form:errors class="mensaje-error" path="confirmarContrasenia"/>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-md-6 text-start">
                    <form:label class="form-label-custom" path="fechaNacimiento">Fecha de nacimiento</form:label>
                    <form:input class="form-control form-control-custom" path="fechaNacimiento" type="date" placeholder="DD/MM/AAAA"/>
                    <form:errors class="mensaje-error" path="fechaNacimiento"/>
                </div>
                <div class="col-md-6 text-start">
                    <form:label class="form-label-custom" path="tipoDiabetes">Tipo de diabetes</form:label>
                    <form:select class="form-select form-control-custom" path="tipoDiabetes">
                        <form:option value="" label="Seleccionar tipo"/>
                        <form:option value="Tipo 1" label="Tipo 1"/>
                        <form:option value="Tipo 2" label="Tipo 2"/>
                        <form:option value="Gestacional" label="Gestacional"/>
                        <form:option value="Prediabetes" label="Prediabetes"/>
                        <form:option value="Control Preventivo" label="Control Preventivo"/>
                    </form:select>
                    <form:errors class="mensaje-error" path="tipoDiabetes"/>
                </div>
            </div>



            <button type="submit" class="btn btn-orange btn-registro">Registrarse</button>
        </form:form>

        <div class="separator">O continúa con</div>

        <div class="row g-3">
            <div class="col-md-6">
                <button class="btn btn-social btn-google">
                    <i class="bi bi-google"></i>  Google
                </button>
            </div>
            <div class="col-md-6">
                <button class="btn btn-social btn-facebook">
                    <i class="bi bi-facebook"></i> Facebook
                </button>
            </div>
        </div>

        <p class="login-link">
            ¿Ya tienes una cuenta? <a href="${pageContext.request.contextPath}/login">Inicia sesión</a>
        </p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Script para mostrar/ocultar contraseña
        document.addEventListener('DOMContentLoaded', function() {
            const togglePassword = document.getElementById('togglePassword');
            const password = document.getElementById('contrasenia');
            const passwordIcon = document.getElementById('passwordIcon');

            togglePassword.addEventListener('click', function (e) {
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                passwordIcon.classList.toggle('bi-eye');
                passwordIcon.classList.toggle('bi-eye-slash');
            });

            const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
            const confirmPassword = document.getElementById('confirmarContrasenia');
            const confirmPasswordIcon = document.getElementById('confirmPasswordIcon');

            toggleConfirmPassword.addEventListener('click', function (e) {
                const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
                confirmPassword.setAttribute('type', type);
                confirmPasswordIcon.classList.toggle('bi-eye');
                confirmPasswordIcon.classList.toggle('bi-eye-slash');
            });
        });
    </script>
</body>
</html>
