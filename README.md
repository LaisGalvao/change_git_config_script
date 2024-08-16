# Configurando e Usando um Script para Alterar Configurações do Git Globalmente

Este guia fornece instruções detalhadas sobre como configurar um script para alterar dinamicamente as configurações do Git (`user.name` e `user.email`) a partir de qualquer diretório no seu sistema.

## Sumário

1. [Pré-requisitos](#pré-requisitos)
2. [Passos para Configurar o Script](#passos-para-configurar-o-script)
   - [1. Crie um Diretório para Scripts](#1-crie-um-diretório-para-scripts)
   - [2. Movendo o Script para o Diretório de Scripts](#2-movendo-o-script-para-o-diretório-de-scripts)
   - [3. Adicione o Diretório ao PATH](#3-adicione-o-diretório-ao-path)
   - [4. Torne o Script Executável](#4-torne-o-script-executável)
   - [5. Crie um Link Simbólico (Opcional)](#5-crie-um-link-simbólico-opcional)
3. [Uso do Script](#uso-do-script)
   - [Executar com Parâmetros](#executar-com-parâmetros)
   - [Executar sem Parâmetros](#executar-sem-parâmetros)
4. [Verificação e Testes](#verificação-e-testes)

## Pré-requisitos

- **Shell**: O ambiente deve ser configurado para Bash ou Zsh.
- **Git**: Deve estar instalado e configurado no sistema.
- **Permissões de Usuário**: Capacidade de modificar arquivos de configuração e permissões de execução.

## Passos para Configurar o Script

### 1. Crie um Diretório para Scripts

Primeiro, crie um diretório para armazenar scripts que você deseja executar globalmente no seu sistema:

```bash
mkdir -p ~/scripts
```

### 2. Movendo o Script para o Diretório de Scripts

Se você já tem o script pronto, mova-o para o diretório `~/scripts`:

```bash
mv /caminho/atual/change_git_config.sh ~/scripts/change_git_config.sh
```

### 3. Adicione o Diretório ao PATH

Para garantir que o script seja executável de qualquer diretório, adicione `~/scripts` ao seu `PATH`.

Abra o arquivo de configuração do shell (`~/.bashrc` para Bash ou `~/.zshrc` para Zsh) e adicione a seguinte linha ao final do arquivo:

```bash
export PATH="$HOME/scripts:$PATH"
```

Depois, recarregue o arquivo de configuração:

```bash
source ~/.bashrc  # ou source ~/.zshrc para Zsh
```

### 4. Torne o Script Executável

Para garantir que o script tenha permissão para ser executado, use o comando:

```bash
chmod +x ~/scripts/change_git_config.sh
```

### 5. Crie um Link Simbólico (Opcional)

Como alternativa, você pode criar um link simbólico para o script em `/usr/local/bin`, que normalmente já está no `PATH`:

```bash
sudo ln -s ~/scripts/change_git_config.sh /usr/local/bin/change_git_config
```

Isso permitirá que você execute o script apenas digitando `change_git_config`.

## Uso do Script

### Executar com Parâmetros

Você pode fornecer o `user.name` e `user.email` diretamente ao executar o script:

```bash
change_git_config.sh "Seu Nome" "seuemail@exemplo.com"
```

Isso aplicará as configurações para o repositório Git atual.

### Executar sem Parâmetros

Se você não fornecer os parâmetros, o script solicitará que você os insira manualmente:

```bash
change_git_config.sh
```

Você será solicitado a inserir:

```bash
Digite o Git user.name: [seu nome]
Digite o Git user.email: [seu email]
```

## Verificação e Testes

1. **Verifique o PATH**: Certifique-se de que o diretório `~/scripts` está incluído no `PATH`:

   ```bash
   echo $PATH
   ```

   Isso deve mostrar uma lista de diretórios, incluindo `~/scripts`.

2. **Teste o Script**: Navegue até um diretório Git qualquer e execute o script:

   ```bash
   change_git_config.sh
   ```

   O script deve alterar as configurações do Git de acordo com os valores fornecidos.

3. **Executar de Qualquer Diretório**: Verifique que o script pode ser executado de qualquer local no sistema, alterando as configurações do Git para o repositório atual.

---

