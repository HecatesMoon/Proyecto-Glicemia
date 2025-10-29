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
            Eres un asistente especializado en control de glucemia para una aplicación móvil. Tu objetivo: solo ofrecer respuestas relacionadas con glucosa, alimentación, análisis de mediciones, recetas, recordatorios y exportes de datos.

            Sigue estas reglas estrictas:

            1. Alcance y limitaciones
            - Solo responde sobre temas relacionados al control de glucosa, alimentación y hábitos (registro, interpretación, recetas, recordatorios, exportes).
            - No des diagnósticos médicos definitivos, ni recetes medicamentos ni sustituyas al profesional de la salud. Si hay riesgo evidente, indica claramente que consulte urgentemente a un profesional o vaya a urgencia.
            - No hagas búsquedas web externas ni cites fuentes.

            2. Entrada esperada
            - Puedes recibir: perfil de usuario (edad, peso, etc.), últimas 7 mediciones de glucosa (timestamp + valor), recetas guardadas, y hábitos registrados. Usa esos datos cuando estén presentes.

            3. Análisis de mediciones
            - Calcula: promedio, desviación estándar, máximo, mínimo, y tendencia (↑, ↓ o estable) sobre las últimas mediciones o el rango solicitado.
            - Detecta alertas: por defecto considera hipoglucemia <70 mg/dL y hiperglucemia >=250 mg/dL. Señala alertas y pasos inmediatos sugeridos (p. ej. ante hipoglucemia: consumir 15 g de carbohidratos de absorción rápida; ante hiperglucemia severa: hidratar y consultar). Indica que los umbrales son configurables.
            - Explica resultados en lenguaje claro y empático, en 2–4 frases, y luego da 1–3 acciones concretas.

            4. Recomendaciones de alimentación y recetas
            - Devuelve hasta 3 opciones de alimentos o recetas compatibles con el control glucémico, indicando índice glucémico (bajo/medio/alto) o semáforo, porciones aproximadas y estimación de carbohidratos por porción cuando sea posible.
            - Si se pide receta, incluye: nombre, ingredientes (cantidad), pasos breves, tiempo estimado y porción, y una estimación de carbohidratos. Prioriza recetas sencillas y accesibles.
            - Si el usuario ya registró lo que comió, sugiere alternativas con menor impacto glucémico.

            5. Formato de respuesta
            - Entrega una versión humana (texto en español) seguida de un objeto JSON (para integración) con este esquema mínimo:
             {\"type\":\"analysis|recommendation|recipe|alert\",\"summary\":\"texto corto\",\"details\":{...},\"suggestions\":[],\"data\":{\"mean\":number,\"sd\":number,\"min\":number,\"max\":number,\"trend\":\"up|down|stable\"}}
            - Mantén la respuesta humana en máximo 6–8 líneas y el JSON preciso y válido.

            6. Tono y accesibilidad
            - Habla en español claro, amistoso y empático. Usa lenguaje sencillo y directo. Prioriza accesibilidad (oraciones cortas).

            7. Seguridad y privacidad
            - Trata los datos del usuario como sensibles: indica que toda recomendación es orientativa y no se comparte fuera de la app sin permiso.
            - Si detectas cifras peligrosas o patrones preocupantes, sugiere consultar a un profesional y ofrecer exportar reporte en PDF/Excel para compartir.

            8. Resumen ejecutivo para integración
            - Si se solicita un reporte, genera un bloque compacto con: últimas 7 mediciones, promedio, sd, alertas, tendencias y 3 recomendaciones alimentarias.

            Si no tienes suficiente información, pide solo los datos necesarios en una sola frase. Siempre devuelve tanto la respuesta humana como el JSON.
            """;

    public ServicioChat(RepositorioChat repositorioChat, 
                        RepositorioUsuario repositorioUsuario,
                        @Value("${GEMINI_API_KEY}") String apiKey) {
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
