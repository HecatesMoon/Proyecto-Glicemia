<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link rel="stylesheet" href="/css/Style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
    <div class="container">
            <div class="row">
                <h1 class="col-6"> Regístrate en GlicemIA</h1>
                <h3>controla tu glicemia de forma inteligente</h3>
                <nav class="col-6">
                    <div class="row">
                        <a class="col-6" href="/login"> Login </a>
                        <a class="col-6" href="/registro"> Registro </a>
                    </div>
                </nav>
            </div>
            <div class="row">
                <h1> Registro </h1>  
            </div> 
            <div class="row">
                <form:form class="col-6" action="/agregar/usuario" method="POST" modelAttribute="nuevoUsuario">
                    <div>
                        <form:label class="form-label" path="nombre">
                            Nombre: 
                        </form:label>
                        <form:input class="form-control" path="nombre" type="text"/>
                        <form:errors class="alert alert-danger mensaje-error" path="nombre"/>
                    </div>
                    <div>
                        <form:label class="form-label" path="apellido">
                            Apellido: 
                        </form:label>
                        <form:input class="form-control" path="apellido" type="text"/>
                        <form:errors class="alert alert-danger mensaje-error" path="apellido"/>
                    </div>
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
                    <div>
                        <form:label class="form-label" path="confirmarContrasenia">
                            Confirmar contraseña: 
                        </form:label>
                        <form:input class="form-control" path="confirmarContrasenia" type="password"/>
                        <form:errors class="alert alert-danger mensaje-error" path="confirmarContrasenia"/>
                    </div>
                    <div>
                        <form:label class="form-label" path="fechaNacimiento">
                            Fecha de nacimiento 
                        </form:label>
                        <form:input class="form-control" path="fechaNacimiento" type="date"/>
                        <form:errors class="alert alert-danger mensaje-error" path="fechaNacimiento"/>
                    </div>

                    <div>
                        <form:label class="form-label" path="tipoDiabetes">
                            Tipo de diabetes 
                        </form:label>
                        <form:select class="form-control" path="tipoDiabetes">
                            <form:option value="" label="-- Selecciona una opción --"/>
                            <form:option value="Tipo 1" label="Tipo 1"/>
                            <form:option value="Tipo 2" label="Tipo 2"/>
                            <form:option value="Gestacional" label="Gestacional"/>
                            <form:option value="Prediabetes" label="Prediabetes"/>
                            <form:option value="Pesquisa" label="Control Preventivo"/>
                        </form:select>
                        <form:errors class="alert alert-danger mensaje-error" path="tipoDiabetes"/>
                    </div>

                    <div>
                        <form:checkbox class="form-check-input" path="aceptaTerminos"/>
                        <form:label class="form-check-label" path="aceptaTerminos">
                            Acepto los <a href="/terminos" target="_blank">términos y condiciones</a>
                        </form:label>
                        <form:errors class="alert alert-danger mensaje-error" path="aceptaTerminos"/>
                    </div>

                    
                    <button class="btn btn-primary mt-2">
                        Registrarse
                    </button>
                </form:form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>