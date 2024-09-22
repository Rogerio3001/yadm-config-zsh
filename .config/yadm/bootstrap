#!/bin/bash

# Defina variáveis de caminho
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"
NVM_DIR="$HOME/.nvm"

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

# Atualizar o .zshrc com os plugins
if ! grep -q "zsh-autosuggestions" "$HOME/.zshrc"; then
  echo "Adicionando plugins ao .zshrc..."
  sed -i '/^plugins=/ s/(/(zsh-autosuggestions /' "$HOME/.zshrc"
fi

# Perguntar ao usuário se deseja instalar o NVM
read -p "Deseja instalar o NVM? (y/n): " install_nvm
if [ "$install_nvm" = "y" ]; then
  # Instalar NVM apenas se ele ainda não estiver instalado
  if [ ! -d "$NVM_DIR" ]; then
    echo "Instalando NVM..."
    
    # Baixar e instalar NVM
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    
    # Adicionar NVM ao .zshrc se ainda não estiver presente
    if ! grep -q "NVM_DIR" "$HOME/.zshrc"; then
      echo "Adicionando NVM ao .zshrc..."
      echo 'export NVM_DIR="$HOME/.nvm"' >> "$HOME/.zshrc"
      echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> "$HOME/.zshrc"
    fi
  else
    echo "NVM já instalado."
  fi
else
  echo "Instalação do NVM pulada."
fi

# Reiniciar o shell para aplicar as alterações
echo "Bootstrap concluído! Por favor, reinicie seu terminal ou execute 'exec zsh' para aplicar as mudanças."
