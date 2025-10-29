<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Glucosa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
    <h1>Glucosa</h1>
    <div class="row">
                <nav class="col-4">
                    <div class="row">
                        <a class="col-4" href="/Perfil"> Perfil </a>
                        <a class="col-4" href="/glucosa"> Glucosa </a>
                        <a class="col-4" href="/funcionesIA">Funciones IA</a>
                        <a class="col-4" href="/Alimento">Analisis de alimento</a>
                        <a class="col-4" href="/logout"> Logout </a>
                    </div>
                </nav>
    </div>
    <div>
        <h2>GlicemIA:Registro y Análisi con IA</h2>
        <div class="row">
                <c:if test="${not empty mensajeExito}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${mensajeExito}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <form:form class="col-6" action="/agregar/glucosa" method="POST" modelAttribute="nuevoGlucosa">
                    <div>
                        <form:label class="form-label" path="valorMgDl">
                            Valor en mg/dL: 
                        </form:label>
                        <form:input class="form-control" path="valorMgDl" type="text"/>
                        <form:errors class="alert alert-danger mensaje-error" path="valorMgDl"/>
                    </div>

                    <div>
                        <form:label class="form-label" path="valorMmolL">
                            Valor en mmol/L: 
                        </form:label>
                        <form:input class="form-control" path="valorMmolL" type="text"/>
                        <form:errors class="alert alert-danger mensaje-error" path="valorMmolL"/>
                    </div>

                    <div>
                        <form:label class="form-label" path="fecha">
                            fecha: 
                        </form:label>
                        <form:input class="form-control" path="fecha" type="date"/>
                        <form:errors class="alert alert-danger mensaje-error" path="fecha"/>
                    </div>
                    <div>
                        <form:label class="form-label" path="hora">
                            hora: 
                        </form:label>
                        <form:input class="form-control" path="hora" type="time"/>
                        <form:errors class="alert alert-danger mensaje-error" path="hora"/>
                    </div>
                    <div>
                        <form:label class="form-label" path="momentoMedicion">
                            Momento de la medición: 
                        </form:label>
                        <form:select class="form-control" path="momentoMedicion">
                            <!-- puedes cambiar los nombres en label="aquicambiasNombre" -->
                            <form:option value="" label="-- Selecciona una opción --"/>
                            <form:option value="ayuna" label="Ayuna"/>
                            <form:option value="preprondial" label="Prepondrial"/>
                            <form:option value="posprandia" label="Posprandia"/>
                            <form:option value="precolacion" label="Precolacion"/>
                            <form:option value="postcolacion" label="Postcolación"/>
                        </form:select>
                        <form:errors class="alert alert-danger mensaje-error" path="momentoMedicion"/>
                    </div>
    
                    
                    <button class="btn btn-primary mt-2">
                        Guardar Medición
                    </button>
                </form:form>
    
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const mgInput = document.querySelector('[name="valorMgDl"]');
                const mmolInput = document.querySelector('[name="valorMmolL"]');

                mgInput.addEventListener("input", function () {
                    const mgValue = parseFloat(mgInput.value);
                    if (!isNaN(mgValue)) {
                        const mmolValue = (mgValue * 0.0555).toFixed(2);
                        mmolInput.value = mmolValue;
                    } else {
                        mmolInput.value = "";
                    }
                });
            });
        </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>