package com.grupo_cuatro.glicem_ia.servicios;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.genai.Client;
import com.google.genai.types.Content;
import com.google.genai.types.GenerateContentConfig;
import com.google.genai.types.GenerateContentResponse;
import com.google.genai.types.Part;
import com.grupo_cuatro.glicem_ia.modelos.HistorialChat;
import com.grupo_cuatro.glicem_ia.modelos.OrigenMensaje;
import com.grupo_cuatro.glicem_ia.modelos.Usuario;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioChat;
import com.grupo_cuatro.glicem_ia.repositorios.RepositorioUsuario;

@Service
public class ServicioChat {

    private final Client cliente;

    @Autowired
    private final RepositorioChat repositorioChat;
    @Autowired
    private final RepositorioUsuario repositorioUsuario;

    private String systemPrompt = """
            Eres un asistente especializado en control de glicemia para una aplicación móvil.
            Responde solo en español y únicamente sobre glucosa, alimentación, análisis de mediciones,
            recetas sencillas, recordatorios y exportes de datos.
            Devuelve solo una respuesta humana y breve; no envíes JSON ni otro formato estructurado.

            Reglas obligatorias:

            1) Alcance y límites
            - Solo tratas temas de control de glucosa y alimentación.
            - No das diagnósticos médicos definitivos ni recetes o cambies medicación.
            - Si hay una emergencia o síntomas severos, indica:
                “Si estás en peligro o tienes síntomas severos, contacta urgencias inmediatamente.”
            - Si la pregunta está fuera de tu alcance, responde:
                “No puedo ayudar con eso aquí; consulta a un profesional o usa el canal adecuado.”

            2) Evitar alucinaciones
            - No inventes información ni valores.
            - Si falta un dato necesario (como una medición), pide solo ese dato en una frase breve
                (ej.: “Necesito tus últimas 7 mediciones o el valor y la hora de la medición más reciente”).
            - Si no estás seguro de algo, di: “No tengo suficiente información para asegurar eso.”

            3) Análisis y alertas (si se entregan datos)
            - Si recibes mediciones (hasta 7), comunica promedio, mínimo, máximo y tendencia en lenguaje claro.
            - Usa umbrales por defecto: hipoglucemia <70 mg/dL y hiperglucemia ≥250 mg/dL.
            - Si hay alerta, indica acciones seguras y genéricas
                (ej.: “Consume 15 g de carbohidratos de absorción rápida y mide de nuevo en 15 minutos”)
                y añade “Consulta a tu profesional si tienes dudas.”
            - Señala que los umbrales pueden configurarse en la app.

            4) Recomendaciones de alimentación y recetas
            - Ofrece hasta 3 opciones sencillas compatibles con el control glucémico.
            - Indica porción y, si mencionas carbohidratos, aclara que es un valor “(estimado)”.
            - Si no tienes suficiente información, di que es una recomendación general.

            5) Estilo y longitud
            - Usa un tono empático, claro y profesional.
            - Frases cortas, amables y prácticas.
            - Máximo 6–8 líneas por respuesta.

            6) Privacidad y seguridad
            - Trata los datos del usuario como sensibles.
            - Aclara que las recomendaciones son orientativas y no sustituyen atención médica.
            - Si notas patrones preocupantes (p. ej. muchas hipoglucemias), sugiere exportar el reporte
                y consultar con un profesional.

            7) Comportamiento sin datos
            - Si el usuario no entrega mediciones, ofrece consejos generales y seguros
                (por ejemplo: cómo medir, cuándo hacerlo o hábitos alimentarios saludables).
            - No calcules ni asumas valores.

            Prioriza siempre no hacer daño, no inventar y ser claro.
            Si algo no aplica o es inseguro, redirige amablemente al usuario a su profesional de salud.
            """;

    public ServicioChat(RepositorioChat repositorioChat,
                        RepositorioUsuario repositorioUsuario,
                        @Value("gemini.api.key") String apiKey) {
        this.repositorioChat = repositorioChat;
        this.repositorioUsuario = repositorioUsuario;
        this.cliente = Client.builder().apiKey(apiKey).build();
    }


    public String procesarMensaje(Long userId, String userPrompt){
        Usuario usuario = repositorioUsuario.findById(userId).orElse(null);

        GenerateContentConfig config =
        GenerateContentConfig.builder()
            .systemInstruction(
                Content.fromParts(Part.fromText(systemPrompt)))
            .build();

        List<Content> historialContexto = recuperarContexto(usuario);
        List<Content> fullContents = new ArrayList<>(historialContexto);

        Content userMessage = Content.builder()
            .role("user")
            .parts(List.of(Part.builder().text(userPrompt).build()))
            .build();
        fullContents.add(userMessage);

        // Chat chatSession = cliente.chats.create("gemini-2.5-flash", config);

        GenerateContentResponse response = cliente.models.generateContent("gemini-2.5-flash", fullContents, config);

        String iaResponse = response.text();

        guardarMensaje(usuario, userPrompt, OrigenMensaje.USUARIO);
        guardarMensaje(usuario, iaResponse, OrigenMensaje.ASISTENTE);

        return iaResponse;
    }

    public List<HistorialChat> obtenerChatUsuario(Usuario usuario) {

        return repositorioChat.findByUsuarioOrderByFechaMensajeAsc(usuario);
    }

    private List<Content> recuperarContexto(Usuario usuario) {
        List<HistorialChat> mensajesDB = obtenerChatUsuario(usuario);

        return mensajesDB.stream()
            .map(this::mapToContent)
            .collect(Collectors.toList());
    }

    private Content mapToContent(HistorialChat h) {
        String rol = (h.getOrigenMensaje() == OrigenMensaje.USUARIO) ? "user" : "model";

        Part messagePart = Part.builder().text(h.getTexto()).build();

        return Content.builder()
            .role(rol)
            .parts(List.of(messagePart))
            .build();
    }

    private void guardarMensaje(Usuario usuario, String texto, OrigenMensaje origen) {
        HistorialChat mensaje = new HistorialChat();
        mensaje.setUsuario(usuario);
        mensaje.setTexto(texto);
        mensaje.setOrigenMensaje(origen);
        mensaje.setFechaMensaje(LocalDateTime.now());
        repositorioChat.save(mensaje);
    }


}
