<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
    <h1>Iniciar Sesion</h1>
    <div class="row">
                <form:form class="col-6" action="/procesa/login" method="POST" modelAttribute="loginUsuario">
                    <div>
                        <form:label class="form-label" path="correo">
                            Correo: 
                        </form:label>
                        <form:input class="form-control" path="correo" type="text"/>
                        <form:errors class="alert alert-danger mensaje-error" path="correo"/>
                    </div>
                    <div>
                        <form:label class="form-label" path="contrasenia">
                            Contraseña: 
                        </form:label>
                        <form:input class="form-control" path="contrasenia" type="password"/>
                        <form:errors class="alert alert-danger mensaje-error" path="contrasenia"/>
                    </div>
                    <button class="btn btn-primary mt-2">
                        Iniciar Sesión
                    </button>
                </form:form>
                <h2>
                    ¿No tienes una cuenta? <a href="/registro"> registrate</a>
                </h2>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>