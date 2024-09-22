#!/bin/bash

echo "Executando o script de bootstrap do Yadm..."

# Instalar Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Instalando Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Instalar plugins do Oh My Zsh
echo "Instalando plugins do Oh My Zsh..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Atualizar o .zshrc com os plugins
echo "Adicionando plugins ao .zshrc..."
sed -i '/^plugins=/ s/(/(zsh-autosuggestions zsh-syntax-highlighting /' $HOME/.zshrc

echo "Bootstrap concluído!"
