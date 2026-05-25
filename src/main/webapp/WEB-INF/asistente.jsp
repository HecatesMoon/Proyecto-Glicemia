<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asistente Virtual - GlicemIA</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/GlicemIA_icono.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Figtree:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/showdown@2.1.0/dist/showdown.min.js"></script>

    <style>
        body { background-color: #fdfaf5; font-family: "Figtree", sans-serif; color: #413d3c; }
        .chat-container { max-width: 700px; margin: 3rem auto; }
        .chat-header { background-color: #ffe5d3; border-radius: 12px 12px 0 0; padding: 1rem; text-align: center; font-weight: 600; font-size: 1.2rem; }
        .chat-messages { background-color: #fff; border: 1px solid #eee; border-top: none; border-radius: 0 0 12px 12px; height: 400px; overflow-y: auto; padding: 1rem; }
        .message { display: flex; margin-bottom: 1rem; align-items: flex-start; }
        .message.user { justify-content: flex-end; }
        .message.user .bubble { background-color: #e6f7ff; color: #413d3c; border-radius: 12px 0 12px 12px; border: 1px solid #cceeff; margin-left: 0.5rem; order: 1; }
        .message.bot .bubble { background-color: #f5843a; color: #fff; border-radius: 0 12px 12px 12px; margin-right: 0.5rem;}
        .message.bot:last-child .bubble{opacity: 0; transform: translateY(20px); animation: fadeInSlideUp 0.5s ease-out forwards;}
        .bubble { padding: 0.8rem 1rem; max-width: 75%; position: relative; }
        .avatar { width: 35px; height: 35px; border-radius: 50%; background-color: #f5843a; display: flex; justify-content: center; align-items: center; color: #fff; font-weight: 600; flex-shrink: 0; }
        .avatar.user { background-color: #a0a0a0; order: 2; margin-left: 0.5rem; }
        .avatar.bot { margin-right: 0.5rem; }
        .chat-input { margin-top: 1rem; position: relative; }
        .chat-input .form-control { padding-right: 60px; border-radius: 8px; }
        .chat-input button { position: absolute; right: 0; top: 0; bottom: 0; background-color: #f5843a; color: #fff; border: none; border-radius: 0 8px 8px 0; padding: 0.5rem 1rem; cursor: pointer; }
        .chat-input button:hover { background-color: #e0702a; }
        .error-message { color: red; font-size: 0.85rem; margin-top: 0.2rem; margin-left: 1rem; }
        .btn-orange { background-color: #f5843a; color: white; border: none; border-radius: 8px; padding: 10px 20px; font-weight: 500; }
        .btn-orange:hover { background-color: #e0702a; color: white; }
        .btn-gray { background-color: #e0e0e0; color: #333; border: none; border-radius: 8px; transition: 0.2s; padding: 8px 15px; }
        .btn-gray:hover { background-color: #cfcfcf; color: #000; }
        .nav-link-custom { text-decoration: none; color: #413d3c; margin-right: 1.2rem; font-weight: 500; transition: color 0.2s; }
        .nav-link-custom:hover { color: #f5843a; }
        .nav-link-active { color: #f5843a !important; font-weight: 600; }

        @keyframes fadeInSlideUp {
            from { opacity: 0; transform: translateY(20px);}
            to { opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
    <nav class="container-fluid border-bottom">
        <div class="row align-items-center py-2 px-md-5">
            <div class="col-auto d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/img/GlicemIA_icono.png" alt="Icono de GlicemIA" style="width: 30px; height: auto; margin-right: 8px;">
                <h6 class="mb-0" style="font-weight: 600;">Glicem<span style="color: #d2691e;">IA</span></h6>
            </div>
            <div class="col text-end">
                <a href="${pageContext.request.contextPath}/perfil" class="nav-link-custom">Perfil</a>
                <a href="${pageContext.request.contextPath}/glucosa" class="nav-link-custom">Glucosa</a>
                <a href="${pageContext.request.contextPath}/funcionesIA" class="nav-link-custom nav-link-active">Funciones IA</a>
                <a href="${pageContext.request.contextPath}/analisis" class="nav-link-custom">Análisis de Alimentos</a>
                <a href="${pageContext.request.contextPath}/recetas" class="nav-link-custom">Ver Recetas</a>
                <a href="${pageContext.request.contextPath}/medicamentos" class="nav-link-custom">Medicamentos</a>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-gray">Cerrar Sesión</a>
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
                <c:set var="isUserMessage" value="${msg.origenMensaje eq 'USUARIO'}"/>
                <div class="message ${isUserMessage ? 'user' : 'bot'}">
                    <div class="avatar ${isUserMessage ? 'user' : 'bot'}">
                        <c:choose>
                            <c:when test="${isUserMessage}"><i class="bi bi-person-fill"></i></c:when>
                            <c:otherwise><i class="bi bi-robot"></i></c:otherwise>
                        </c:choose>
                    </div>
                    <div class="bubble ${isUserMessage ? 'user' : 'bot'}"><c:out value="${msg.texto}" escapeXml="false"/></div>
                </div>
            </c:forEach>
        </div>

        <form:form action="${pageContext.request.contextPath}/asistente/enviar" method="post" modelAttribute="nuevoPrompt" class="chat-input d-flex flex-column">
            <div class="d-flex w-100">
                <form:input path="prompt" type="text" placeholder="Escribe un mensaje..." required="true" class="form-control" autocomplete="off" />
                <button type="submit" class="btn btn-primary"><i class="bi bi-send"></i></button>
            </div>
            <form:errors path="prompt" cssClass="error-message" />
        </form:form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var chatMessages = document.getElementById('chatMessages');
            setTimeout(() => { chatMessages.scrollTop = chatMessages.scrollHeight; }, 0);

            var converter = new showdown.Converter();

            function renderMarkdownInChat() {
                document.querySelectorAll('.message.bot .bubble').forEach(function(bubble) {
                    var markdownText = bubble.innerHTML;
                    var html = converter.makeHtml(markdownText);
                    bubble.innerHTML = html;
                });
            }

            renderMarkdownInChat();
        });
    </script>
</body>
</html>