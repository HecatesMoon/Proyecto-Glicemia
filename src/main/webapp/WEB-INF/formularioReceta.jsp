<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario Receta</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/GlicemIA_icono.png">
</head>
<body>
    <h1>Comparte Receta</h1>
    <form:form action="/formulario/receta" method="POST" modelAttribute="nuevaReceta">
        <div>
            <form:label path="nombreReceta" >
                nombre Receta
            </form:label>
            <form:input class="form-control" path="nombreReceta" type="text" />
            <form:errors class="alert alert-danger mensaje-error" path="nombreReceta"/>
        </div>
        <div>
            <form:label path="descripcionReceta" >
                descripcion Receta
            </form:label>
            <form:input class="form-control" path="descripcionReceta" type="text" />
            <form:errors class="alert alert-danger mensaje-error" path="descripcionReceta"/>
        </div>
        <div>
            <form:label path="tiempoPreparacion" >
                tiempo de Preparacion
            </form:label>
            <form:input class="form-control" path="tiempoPreparacion" type="text" />
            <form:errors class="alert alert-danger mensaje-error" path="tiempoPreparacion"/>
        </div>
    </form:form>
</body>
</html>