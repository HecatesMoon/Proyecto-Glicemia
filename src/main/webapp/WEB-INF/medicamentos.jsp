<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Medicamentos - GlicemIA</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Figtree:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Style_prueba.css">

    <style>
        body { background-color: #fdfaf5; font-family: "Figtree", sans-serif; color: #413d3c; }
        .btn-orange { background-color: #f5843a; color: white; border: none; border-radius: 8px; padding: 10px 20px; font-weight: 500; }
        .btn-orange:hover { background-color: #e0702a; color: white; }
        .btn-gray { background-color: #e0e0e0; color: #333; border: none; border-radius: 8px; padding: 8px 15px; }
        .btn-gray:hover { background-color: #cfcfcf; color: #000; }
        .nav-link-custom { text-decoration: none; color: #413d3c; margin-right: 1.2rem; font-weight: 500; transition: color 0.2s; }
        .nav-link-custom:hover { color: #f5843a; }
        .nav-link-active { color: #f5843a !important; font-weight: 600; }

        .card-meds { background-color: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); padding: 1.5rem; margin-bottom: 2rem; }
        .card-title-header { font-size: 1.3rem; font-weight: 600; color: #413d3c; margin-bottom: 1.2rem; }

        .btn-export-pdf { background-color: #fff1e6; color: #f5843a; border: 1px solid #f5843a; border-radius: 8px; padding: 10px 20px; font-weight: 500; transition: 0.2s; }
        .btn-export-pdf:hover { background-color: #f5843a; color: white; }

        .med-list-card { background-color: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); padding: 1.5rem; }
        .list-title { font-size: 1.3rem; font-weight: 600; color: #f5843a; margin-bottom: 1.2rem; }
        .med-item { background-color: #fdfaf5; border-radius: 10px; padding: 1rem 1.2rem; margin-bottom: 0.8rem; border: 1px solid #eee; display: flex; justify-content: space-between; align-items: center; }
        .med-item:hover { border-color: #f5843a; box-shadow: 0 2px 8px rgba(0,0,0,0.05); }

        .mensaje-error { font-size: 0.85rem; margin-top: 3px; }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="container-fluid border-bottom">
        <div class="row align-items-center py-2 px-md-5">
            <div class="col-auto d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/img/GlicemIA_icono.png" alt="GlicemIA" style="width: 30px; margin-right: 8px;">
                <h6 class="mb-0 fw-bold">Glicem<span style="color: #d2691e;">IA</span></h6>
            </div>
            <div class="col text-end">
                <a href="${pageContext.request.contextPath}/perfil" class="nav-link-custom">Perfil</a>
                <a href="${pageContext.request.contextPath}/glucosa" class="nav-link-custom">Glucosa</a>
                <a href="${pageContext.request.contextPath}/funcionesIA" class="nav-link-custom">Funciones IA</a>
                <a href="${pageContext.request.contextPath}/analisis" class="nav-link-custom">Análisis de Alimentos</a>
                <a href="${pageContext.request.contextPath}/recetas" class="nav-link-custom">Ver Recetas</a>
                <a href="${pageContext.request.contextPath}/medicamentos" class="nav-link-custom nav-link-active">Medicamentos</a>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-gray">Cerrar Sesión</a>
            </div>
        </div>
    </nav>

    <c:if test="${not empty mensajeExito}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${mensajeExito}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>

<c:if test="${not empty mensajeError}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        ${mensajeError}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>

<c:if test="${not empty mensajeAgregaExito}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${mensajeAgregaExito}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>


    <!-- Contenido principal -->
    <div class="container-fluid py-4 px-md-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h3 class="fw-bold">Registro de Medicamentos</h3>
                <p class="text-muted mb-0">Añade y gestiona los medicamentos que utilizas para tu tratamiento.</p>
            </div>
            <button class="btn btn-export-pdf">
                <i class="bi bi-box-arrow-down me-2"></i>Exportar a PDF
            </button>
        </div>

        <div class="row">
            <!-- Formulario -->
            <div class="col-md-7">
                <div class="card-meds">
                    <h5 class="card-title-header">Añadir Nuevo Medicamento</h5>

                    <form:form action="${pageContext.request.contextPath}/agregar/medicamento" method="POST" modelAttribute="nuevoMedicamento">
                        <div class="mb-3">
                            <form:label path="medicamento" class="form-label">Nombre del Medicamento</form:label>
                            <form:input path="medicamento" class="form-control" type="text" placeholder="Ej: Metformina"/>
                            <form:errors path="medicamento" cssClass="alert alert-danger mensaje-error"/>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <form:label path="dosis" class="form-label">Dosis</form:label>
                                <form:input path="dosis" class="form-control" type="number" placeholder="Ej: 500 mg"/>
                                <form:errors path="dosis" cssClass="alert alert-danger mensaje-error"/>
                            </div>
                            <div class="col-md-6">
                                <form:label path="tipo" class="form-label">Tipo de Medicamento</form:label>
                                <form:input path="tipo" class="form-control" type="text" placeholder="Ej: Pastilla"/>
                                <form:errors path="tipo" cssClass="alert alert-danger mensaje-error"/>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <form:label path="fecha" class="form-label">Fecha</form:label>
                                <form:input path="fecha" class="form-control" type="date"/>
                                <form:errors path="fecha" cssClass="alert alert-danger mensaje-error"/>
                            </div>
                            <div class="col-md-6">
                                <form:label path="hora" class="form-label">Hora</form:label>
                                <form:input path="hora" class="form-control" type="time"/>
                                <form:errors path="hora" cssClass="alert alert-danger mensaje-error"/>
                            </div>
                        </div>

                        <div class="mb-3">
                            <form:label path="notas" class="form-label">Notas adicionales</form:label>
                            <form:textarea path="notas" class="form-control" rows="3" placeholder="Ej: Tomar con el desayuno"/>
                            <form:errors path="notas" cssClass="alert alert-danger mensaje-error"/>
                        </div>

                        <div class="form-check mb-4">
                            <form:checkbox path="notificacion" class="form-check-input"/>
                            <form:label path="notificacion" class="form-check-label">Activar notificación</form:label>
                            <form:errors path="notificacion" cssClass="alert alert-danger mensaje-error"/>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-orange">
                                <i class="bi bi-plus-circle me-2"></i>Registrar Medicamento
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>

            <!-- Lista de medicamentos -->
            <div class="col-md-5">
                <div class="med-list-card">
                    <h5 class="list-title"><i class="bi bi-plus-square me-2"></i>Mi Lista</h5>
                    <c:forEach var="med" items="${registrosMedicamentos}">
                        <div class="med-item">
                            <div class="med-info">
                                <div class="med-name">${med.medicamento}</div>
                                <div class="med-details">${med.dosis} - ${med.tipo}</div>
                                <p class="med-notes">${med.notas}</p>
                            </div>
                            <form action="${pageContext.request.contextPath}/eliminar/medicamento/${med.id}" method="post">
                                <button class="delete-btn" type="submit"><i class="bi bi-trash"></i></button>
                            </form>
                        </div>
                    </c:forEach>
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

    <footer class="container-fluid py-4 mt-5 border-top text-muted text-center">
        <p class="mb-0">&copy; 2025 GlicemIA — Todos los derechos reservados.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
