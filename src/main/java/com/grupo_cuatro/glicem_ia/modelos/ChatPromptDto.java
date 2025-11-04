package com.grupo_cuatro.glicem_ia.modelos;

import jakarta.validation.constraints.NotBlank;

public class ChatPromptDto {
    @NotBlank(message = "No puede estar en blanco")
    private String prompt;

    public ChatPromptDto(){}

    public String getPrompt() {
        return prompt;
    }

    public void setPrompt(String prompt) {
        this.prompt = prompt;
    }

    
}
