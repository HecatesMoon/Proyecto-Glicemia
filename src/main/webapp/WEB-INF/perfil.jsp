<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%-- Necesario para las etiquetas de formulario de Spring --%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Usuario - GlicemIA</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/GlicemIA_icono.png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"> <%-- Para los iconos de Bootstrap --%>
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

        /* Estilos específicos para la vista de perfil */
        .profile-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        .profile-header h1 {
            font-size: 2.2rem;
            font-weight: 700;
            color: #413d3c;
            margin-bottom: 0.5rem;
        }
        .profile-header p {
            color: #777;
            font-size: 1rem;
            margin-bottom: 2rem;
        }

        .card-profile {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            padding: 2rem;
            margin-bottom: 1.5rem;
        }
        .card-profile .card-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: #413d3c;
            margin-bottom: 1.5rem;
        }

        .avatar-section {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
        }
        .avatar-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #f5843a; /* Borde naranja para el avatar */
            padding: 2px;
            margin-right: 1rem;
            position: relative;
        }
        .avatar-edit-icon {
            position: absolute;
            bottom: 0;
            right: 0;
            background-color: #f5843a;
            color: white;
            border-radius: 50%;
            width: 25px;
            height: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.8rem;
            cursor: pointer;
            border: 2px solid white; /* Borde blanco para resaltar */
        }
        .user-info h5 {
            font-weight: 600;
            color: #413d3c;
            margin-bottom: 0;
        }
        .user-info p {
            font-size: 0.9rem;
            color: #777;
        }

        .form-label-custom {
            font-size: 0.95rem;
            font-weight: 500;
            color: #555;
            margin-bottom: 0.3rem;
        }
        .form-control-custom, .form-select-custom {
            border-radius: 8px;
            padding: 0.7rem 1rem;
            border: 1px solid #ddd;
            font-size: 0.95rem;
        }
        .form-control-custom:focus, .form-select-custom:focus {
            border-color: #f5843a;
            box-shadow: 0 0 0 0.25rem rgba(245, 132, 58, 0.25);
        }

        .checkbox-label {
            font-size: 0.95rem;
            color: #555;
            margin-left: 0.5rem;
        }
        .form-check-input:checked {
            background-color: #f5843a;
            border-color: #f5843a;
        }
        .form-check-input:focus {
            box-shadow: 0 0 0 0.25rem rgba(245, 132, 58, 0.25);
        }

        /* Botones de acción del formulario */
        .profile-actions {
            display: flex;
            justify-content: flex-end;
            gap: 0.8rem;
            margin-top: 2rem;
        }
        .btn-cancel {
            background-color: #e0e0e0;
            color: #333;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
        }
        .btn-cancel:hover {
            background-color: #cfcfcf;
        }

        /* Zona de Peligro */
        .card-danger-zone {
            background-color: #fef1f2; /* Fondo rojo muy claro */
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            padding: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .card-danger-zone h5 {
            font-weight: 600;
            color: #dc3545; /* Rojo oscuro */
            margin-bottom: 0.3rem;
        }
        .card-danger-zone p {
            font-size: 0.9rem;
            color: #dc3545;
            margin-bottom: 0;
        }
        .btn-delete-account {
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            flex-shrink: 0; /* Evita que el botón se encoja */
        }
        .btn-delete-account:hover {
            background-color: #c82333;
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
                <a href="${pageContext.request.contextPath}/perfil" class="nav-link-custom nav-link-active">Perfil</a>
                <a href="${pageContext.request.contextPath}/glucosa" class="nav-link-custom">Glucosa</a>
                <a href="${pageContext.request.contextPath}/funcionesIA" class="nav-link-custom">Funciones IA</a>
                <a href="${pageContext.request.contextPath}/analisis" class="nav-link-custom">Análisis de Alimentos</a>
                <a href="${pageContext.request.contextPath}/recetas" class="nav-link-custom">Ver Recetas</a>
                <a href="${pageContext.request.contextPath}/medicamentos" class="nav-link-custom">Medicamentos</a>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-gray">Cerrar Sesión</a>
            </div>
        </div>
    </nav>

    <div class="profile-container">
        <div class="profile-header">
            <h1>Perfil de Usuario</h1>
            <p>Administra tu información personal y configuraciones de la cuenta.</p>
        </div>

        <%-- Card Principal de Perfil --%>
<div class="card-profile">
    <%-- Sección del Avatar y Email --%>
    <div class="avatar-section">
        <div class="user-info">
            <h5><c:out value="${usuario.nombre} ${usuario.apellido}"/></h5> <%-- Aquí sigue mostrando ambos --%>
            <p><c:out value="${usuario.correo}"/></p>
        </div>
    </div>

    <%-- Formulario de Actualización de Perfil --%>
    <form:form action="${pageContext.request.contextPath}/perfil/actualizar" method="post" modelAttribute="usuario">
        <h4 class="card-title">Información Personal</h4>

        <form:hidden path="id"/> <%-- Asegúrate de enviar el ID del usuario --%>

        <div class="row mb-3">
            <div class="col-md-6">
                <%-- CAMBIO AQUÍ: Label para Nombre --%>
                <label for="nombre" class="form-label-custom">Nombre</label>
                <form:input path="nombre" class="form-control form-control-custom" id="nombre"/> <%-- id="nombre" para que coincida --%>
                <form:errors path="nombre" cssClass="text-danger small"/>
            </div>
            <div class="col-md-6">
                <%-- NUEVO CAMPO: Apellido --%>
                <label for="apellido" class="form-label-custom">Apellido</label>
                <form:input path="apellido" class="form-control form-control-custom" id="apellido"/>
                <form:errors path="apellido" cssClass="text-danger small"/>
            </div>
        </div>

        <div class="row mb-3"> <%-- Este div estaba originalmente, pero es mejor separarlo si son campos diferentes --%>
            <div class="col-md-6">
                <label for="fechaNacimiento" class="form-label-custom">Fecha de Nacimiento</label>
                <form:input path="fechaNacimiento" type="date" class="form-control form-control-custom" id="fechaNacimiento"/>
                <form:errors path="fechaNacimiento" cssClass="text-danger small"/>
            </div>
        </div>
        <%-- ... el resto de tu formulario ... --%>
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="tipoDiabetes" class="form-label-custom">Tipo de Diabetes</label>
                        <form:select path="tipoDiabetes" class="form-select form-select-custom" id="tipoDiabetes">
                            <form:option value="Tipo 1" label="Tipo 1"/>
                            <form:option value="Tipo 2" label="Tipo 2"/>
                            <form:option value="Gestacional" label="Gestacional"/>
                            <form:option value="Prediabetes" label="Prediabetes"/>
                            <form:option value="Control Preventivo" label="Control Preventivo"/>
                        </form:select>
                        <form:errors path="tipoDiabetes" cssClass="text-danger small"/>
                    </div>
                    <div class="col-md-6">
                        <label for="contactoEmergencia" class="form-label-custom">Contacto de Emergencia</label>
                        <form:input path="contactoEmergencia" type="text" class="form-control form-control-custom" id="contactoEmergencia" placeholder="+1234567890"/>
                        <form:errors path="contactoEmergencia" cssClass="text-danger small"/>
                    </div>
                </div>

                <h4 class="card-title mt-4">Configuración de la Cuenta</h4>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="correo" class="form-label-custom">Correo Electrónico</label>
                        <form:input path="correo" type="email" class="form-control form-control-custom" id="correo"/>
                        <form:errors path="correo" cssClass="text-danger small"/>
                    </div>
                    <div class="col-md-6">
                        <label for="nuevaContrasenia" class="form-label-custom">Cambiar Contraseña</label>
                        <input type="password" name="nuevaContrasenia" class="form-control form-control-custom" id="nuevaContrasenia" placeholder="Nueva contraseña"/>
                        <%-- NOTA: La contraseña no se debe vincular directamente a 'usuario.password' para evitar que se envíe vacía/hash al backend si no se cambia.
                                 Deberías tener una lógica en el backend para actualizarla solo si este campo no está vacío. --%>
                    </div>
                </div>

                <div class="mb-4">
                    <div class="form-check">
                        <form:checkbox path="recibirNotificaciones" class="form-check-input" id="recibirNotificaciones"/>
                        <label class="form-check-label checkbox-label" for="recibirNotificaciones">Recibir notificaciones por correo</label>
                    </div>
                    <div class="form-check">
                        <form:checkbox path="modoOscuro" class="form-check-input" id="modoOscuro"/>
                        <label class="form-check-label checkbox-label" for="modoOscuro">Activar modo oscuro por defecto</label>
                    </div>
                </div>

                <c:if test="${not empty usuarioNoExiste}">
                    <div class="alert alert-danger text-danger">${usuarioNoExiste}</div>
                </c:if>

                <div class="profile-actions">
                    <a href="${pageContext.request.contextPath}/glucosa" class="btn btn-cancel">Cancelar</a>
                    <button type="submit" class="btn btn-orange">Guardar Cambios</button>
                </div>
            </form:form>
        </div>

        <%-- Card Zona de Peligro --%>
        <div class="card-danger-zone">
            <div>
                <h5>Zona de Peligro</h5>
                <p>Eliminar cuenta: Esta acción es permanente y no se puede deshacer.</p>
            </div>
            <form action="${pageContext.request.contextPath}/perfil/eliminar" method="post" onsubmit="return mostrarConfirmacionEliminar();">
                <button type="submit" class="btn btn-delete-account">Eliminar mi Cuenta</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        function mostrarConfirmacionEliminar() {
            return confirm("¿Estás seguro? Esta acción no se puede deshacer.");
        }
    </script>
</body>
</html>
