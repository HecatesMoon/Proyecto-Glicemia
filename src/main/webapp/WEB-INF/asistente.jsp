<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .message.user .bubble { background-color: #fff; color: #413d3c; margin-left: auto; border-radius: 12px 12px 0 12px; }
        .message.bot .bubble { background-color: #f5843a; color: #fff; margin-right: auto; border-radius: 12px 12px 12px 0; }
        .bubble { padding: 0.8rem 1rem; max-width: 75%; }
        .avatar { width: 35px; height: 35px; border-radius: 50%; background-color: #f5843a; display: flex; justify-content: center; align-items: center; color: #fff; font-weight: 600; margin-right: 0.5rem; }
        .chat-input { margin-top: 1rem; display: flex; gap: 0.5rem; }
        .chat-input input { flex-grow: 1; border-radius: 8px; border: 1px solid #ccc; padding: 0.5rem 1rem; }
        .chat-input button { background-color: #f5843a; color: #fff; border: none; border-radius: 8px; padding: 0.5rem 1rem; }
        .chat-input button:hover { background-color: #e0702a; }
    </style>
</head>
<body>
    <nav class="container-fluid border-bottom py-2 px-md-5 mb-4 d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <img src="${pageContext.request.contextPath}/img/GlicemIA_icono.png" alt="GlicemIA" style="width:30px; margin-right:8px;">
            <h6 class="mb-0" style="font-weight: 600;">Glicem<span style="color: #d2691e;">IA</span></h6>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/perfil" class="nav-link-custom">Perfil</a>
            <a href="${pageContext.request.contextPath}/glucosa" class="nav-link-custom">Glucosa</a>
            <a href="${pageContext.request.contextPath}/cerrarSesion" class="btn btn-gray">Cerrar Sesión</a>
        </div>
    </nav>

    <div class="chat-container">
        <div class="chat-header">
            <i class="bi bi-headset"></i> Asistente Virtual GlicemIA
            <p style="font-weight: 400; font-size: 0.9rem; margin-top: 0.3rem;">Hola, soy tu asistente personal. ¿En qué puedo ayudarte hoy?</p>
        </div>
        <div class="chat-messages" id="chatMessages">
            <c:forEach var="msg" items="${historialChat}">
                <div class="message <c:out value='${msg.esUsuario ? "user" : "bot"}'/>">
                    <div class="avatar">
                        <c:choose>
                            <c:when test="${msg.esUsuario}">👤</c:when>
                            <c:otherwise>🤖</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="bubble"><c:out value="${msg.texto}"/></div>
                </div>
            </c:forEach>
        </div>

        <form action="${pageContext.request.contextPath}/asistente/enviar" method="post" class="chat-input">
            <input type="text" name="prompt" placeholder="Escribe un mensaje..." required>
            <button type="submit"><i class="bi bi-send"></i> Enviar</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
