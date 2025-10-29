package com.grupo_cuatro.glicem_ia.modelos;

public class ChatResponseDto {
    private String respuesta;

    public ChatResponseDto(String respuesta){
        this.respuesta = respuesta;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }
    
}
