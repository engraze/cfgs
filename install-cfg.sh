#!/bin/bash

#install oh-my-zsh
echo "[*] installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sleep 1s

#install aphrodite theme
echo "[*] installing aphrodite theme"
mkdir -p ~/.oh-my-zsh/custom/themes/
wget -xqO ~/.oh-my-zsh/custom/themes/aphrodite.zsh-theme https://git.io/v5ohc
sed -i.bak 's/^[[:space:]]*ZSH_THEME=.*/ZSH_THEME="aphrodite"/' ~/.zshrc
sleep 1s

#install zsh-syntax-highlighting plugin
echo "[*] installing syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i.bak 's/^[[:space:]]*plugins=.*/plugins=(\'$'\n  zsh-syntax-highlighting/' ~/.zshrc

#install aliases
echo "[*] installing aliases"
printf "\n#ensure cp is always recursive, verbose and interactive
alias cp='cp -Rvi'

#ensure mv is interactive
alias mv='mv -i'

#ls
alias ls='ls -hlF --color --group-directories-first'
alias lsa='ls -hlFa --color --group-directories-first'

#packages
alias sagi='sudo apt-get install'
alias sagr='sudo apt-get remove'
alias sagu='sudo apt-get update'
alias sagug='sudo apt-get upgrade'
alias sai='sudo aptitude install'
alias sar='sudo aptitude remove'
alias sau='sudo aptitude update'
alias saug='sudo aptitude upgrade'" >> ~/.zshrc

echo "[*] restarting shell"
source ~/.zshrc
