<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%-- Necesitas esto para form:errors --%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asistente Virtual - GlicemIA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Figtree:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body { background-color: #fdfaf5; font-family: "Figtree", sans-serif; color: #413d3c; }
        .chat-container { max-width: 700px; margin: 3rem auto; }
        .chat-header { background-color: #ffe5d3; border-radius: 12px 12px 0 0; padding: 1rem; text-align: center; font-weight: 600; font-size: 1.2rem; }
        .chat-messages { background-color: #fff; border: 1px solid #eee; border-top: none; border-radius: 0 0 12px 12px; height: 400px; overflow-y: auto; padding: 1rem; }
        .message { display: flex; margin-bottom: 1rem; }
        .message.user .bubble { background-color: #fff; color: #413d3c; margin-left: auto; border-radius: 12px 12px 0 12px; border: 1px solid #ddd; } /* Añadido borde para mensajes de usuario */
        .message.bot .bubble { background-color: #f5843a; color: #fff; margin-right: auto; border-radius: 12px 12px 12px 0; }
        .bubble { padding: 0.8rem 1rem; max-width: 75%; }
        .avatar { width: 35px; height: 35px; border-radius: 50%; background-color: #f5843a; display: flex; justify-content: center; align-items: center; color: #fff; font-weight: 600; margin-right: 0.5rem; flex-shrink: 0; }
        .avatar.user { background-color: #a0a0a0; } /* Estilo para avatar de usuario */
        .chat-input { margin-top: 1rem; display: flex; gap: 0.5rem; }
        .chat-input input { flex-grow: 1; border-radius: 8px; border: 1px solid #ccc; padding: 0.5rem 1rem; }
        .chat-input button { background-color: #f5843a; color: #fff; border: none; border-radius: 8px; padding: 0.5rem 1rem; cursor: pointer; }
        .chat-input button:hover { background-color: #e0702a; }
        .error-message { color: red; font-size: 0.85rem; margin-top: 0.2rem; margin-left: 1rem; } /* Estilo para mensajes de error */
        /* Estilos de navegación y botones */
        .btn-orange { background-color: #f5843a; color: white; border: none; border-radius: 8px; padding: 10px 20px; font-weight: 500; }
        .btn-orange:hover { background-color: #e0702a; color: white; }
        .btn-gray { background-color: #e0e0e0; color: #333; border: none; border-radius: 8px; transition: 0.2s; padding: 8px 15px; }
        .btn-gray:hover { background-color: #cfcfcf; color: #000; }
        .nav-link-custom { text-decoration: none; color: #413d3c; margin-right: 1.2rem; font-weight: 500; transition: color 0.2s; }
        .nav-link-custom:hover { color: #f5843a; }
        .nav-link-active { color: #f5843a !important; font-weight: 600; }
    </style>
</head>
<body>
    <nav class="container-fluid border-bottom">
        <div class="row align-items-center py-2 px-md-5">
            <div class="col-md-3 d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/img/GlicemIA_icono.png" alt="Icono de GlicemIA" style="width: 40px; height: auto; margin-right: 10px;">
                <h4 class="mb-0">Glicem<span style="color: #d2691e;">IA</span></h4>
            </div>
            <div class="col-md-9 text-end">
                <a href="${pageContext.request.contextPath}/perfil" class="nav-link-custom">Perfil</a>
                <a href="${pageContext.request.contextPath}/glucosa" class="nav-link-custom">Glucosa</a>
                <a href="${pageContext.request.contextPath}/asistente" class="nav-link-custom nav-link-active">Funciones IA</a> <%-- Ajustado a /asistente --%>
                <a href="${pageContext.request.contextPath}/analisis" class="nav-link-custom">Análisis de Alimentos</a>
                <a href="${pageContext.request.contextPath}/recetas" class="nav-link-custom">Ver Recetas</a> <%-- Asumido /recetas --%>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-gray">Cerrar Sesión</a> <%-- Ajustado a /logout --%>
            </div>
        </div>
    </nav>

    <div class="chat-container">
        <div class="chat-header">
            <i class="bi bi-headset"></i> Asistente Virtual GlicemIA
            <p style="font-weight: 400; font-size: 0.9rem; margin-top: 0.3rem;">Hola, soy tu asistente personal. ¿En qué puedo ayudarte hoy?</p>
        </div>
        <div class="chat-messages" id="chatMessages">
            <c:forEach var="msg" items="${historialChat}">
                <%-- Determina si es mensaje de USUARIO o ASISTENTE --%>
                <c:set var="isUserMessage" value="${msg.origenMensaje eq 'USUARIO'}"/>
                <div class="message ${isUserMessage ? 'user' : 'bot'}">
                    <div class="avatar ${isUserMessage ? 'user' : 'bot'}">
                        <c:choose>
                            <c:when test="${isUserMessage}">👤</c:when>
                            <c:otherwise>🤖</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="bubble"><c:out value="${msg.texto}"/></div>
                </div>
            </c:forEach>
        </div>

        <%-- Formulario de Spring para manejar la validación --%>
        <%-- Importante: El controlador debe añadir 'nuevoPrompt' al modelo en GET y POST con errores --%>
        <form:form action="${pageContext.request.contextPath}/asistente/enviar" method="post" modelAttribute="nuevoPrompt" class="chat-input d-flex flex-column">
            <div class="d-flex w-100">
                <form:input path="prompt" type="text" placeholder="Escribe un mensaje..." required="true" class="form-control" />
                <button type="submit" class="btn btn-primary"><i class="bi bi-send"></i> Enviar</button>
            </div>
            <form:errors path="prompt" cssClass="error-message" /> <%-- Muestra errores de validación --%>
        </form:form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Scroll automático al final del chat al cargar la página
        document.addEventListener('DOMContentLoaded', function() {
            var chatMessages = document.getElementById('chatMessages');
            chatMessages.scrollTop = chatMessages.scrollHeight;
        });
    </script>
</body>
</html>
