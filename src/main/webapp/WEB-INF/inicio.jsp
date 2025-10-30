<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
</head>
<body>
    <h1>GlicemIA</h1>
    <div class="row">
                <nav class="col-4">
                    <div class="row">
                        <a class="col-4" href="/logout"> Logout </a>
                        <a class="col-4" href="/registro"> Registrarse </a>
                    </div>
                </nav>
    </div>
    

    <div>
        <c:choose>
            <c:when test="${not empty sessionScope.id_usuario}">
                <a class="btn btn-primary" href="/glucosa">Empieza a Controlar tu Glucosa Gratis</a>
            </c:when>
            <c:otherwise>
                <a class="btn btn-primary" href="/login">Empieza a Controlar tu Glucosa Gratis</a>
            </c:otherwise>
        </c:choose>
    </div>




</body>
</html>