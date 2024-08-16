#!/bin/bash

# Função para definir as configurações do Git
set_git_config() {
    local name="$1"
    local email="$2"
    git config user.name "$name"
    git config user.email "$email"
    echo "Git config alterado para $name e $email"
}

# Caminho completo para o diretório Git do projeto atual
GIT_DIR=$(git rev-parse --show-toplevel 2>/dev/null)

# Verifique se está em um repositório Git
if [ -z "$GIT_DIR" ]; then
    echo "Este diretório não está dentro de um repositório Git."
    exit 1
fi

# Se os parâmetros não forem digitados, ele vai pedir ao usuario
if [ -z "$1" ]; then
    read -p "Digite o Git user.name: " USER_NAME
else
    USER_NAME="$1"
fi

if [ -z "$2" ]; then
    read -p "Digite o Git user.email: " USER_EMAIL
else
    USER_EMAIL="$2"
fi

# Configura o Git com as credenciais fornecidas
set_git_config "$USER_NAME" "$USER_EMAIL"
