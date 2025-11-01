<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medicamentos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
    <h1>Registro de Medicamentos</h1>
    <p>añade y gestiona los medicamentos que utilizas para tu tratamiento.</p>

    <form:form action="/agregar/medicamento" method="POST" modelAttribute="nuevoMedicamento">
        <div>
            <form:label class="form-label" path="medicamento">
                Nombre del Medicamento
            </form:label>
            <form:input class="form-control" path="medicamento" type="text"/>
            <form:errors class="alert alert-danger mensaje-error" path="medicamento"/>
        </div>
        <div>
            <form:label class="form-label" path="dosis">
                Dosis
            </form:label>
            <form:input class="form-control" path="dosis" type="number"/>
            <form:errors class="alert alert-danger mensaje-error" path="dosis"/>
        </div>
        <div>
            <form:label class="form-label" path="tipo">
                Tipo de Medicamento
            </form:label>
            <form:input class="form-control" path="tipo" type="text"/>
            <form:errors class="alert alert-danger mensaje-error" path="tipo"/>
        </div>
        
        <div>
            <form:label class="form-label" path="fecha">
                Fecha
            </form:label>
            <form:input class="form-control" path="fecha" type="date"/>
            <form:errors class="alert alert-danger mensaje-error" path="fecha"/>
        </div>
        <div>
            <form:label class="form-label" path="hora">
                hora
            </form:label>
            <form:input class="form-control" path="hora" type="time"/>
            <form:errors class="alert alert-danger mensaje-error" path="hora"/>
        </div>
        <div>
            <form:label class="form-label" path="notas">
                Notas adicionales
            </form:label>
            <form:textarea class="form-control" path="notas" />
            <form:errors class="alert alert-danger mensaje-error" path="notas"/>
        </div>
        <div>
            <input type="hidden" name="notificacion" value="false"/>
            <form:checkbox class="form-check-input" path="notificacion"/>
            <form:label class="form-check-label" path="notificacion">
                Activar notificaciones para este medicamento
            </form:label>
            <form:errors class="alert alert-danger mensaje-error" path="notificacion"/>
        </div>

        <button class="btn btn-primary mt-2">
            Registrar Medicamento
        </button>
    </form:form>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>