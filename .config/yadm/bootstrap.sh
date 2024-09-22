#!/bin/bash

# Defina variáveis de caminho
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"

# Instalar Oh My Zsh apenas se ele ainda não estiver instalado
if [ ! -d "$OH_MY_ZSH_DIR" ]; then
  echo "Instalando Oh My Zsh..."
  
  # Instalar Oh My Zsh sem trocar o shell automaticamente
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh já instalado."
fi

# Instalar plugins do Oh My Zsh
echo "Instalando plugins do Oh My Zsh..."
ZSH_CUSTOM="$OH_MY_ZSH_DIR/custom"

# Instalar autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

# Instalar syntax highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

# Atualizar o .zshrc com os plugins
if ! grep -q "zsh-autosuggestions" "$HOME/.zshrc"; then
  echo "Adicionando plugins ao .zshrc..."
  sed -i '/^plugins=/ s/(/(zsh-autosuggestions zsh-syntax-highlighting /' "$HOME/.zshrc"
fi

# Reiniciar o shell para aplicar as alterações
echo "Bootstrap concluído! Por favor, reinicie seu terminal ou execute 'exec zsh' para aplicar as mudanças."
