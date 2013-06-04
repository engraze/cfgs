###
## general settings
###

#prompt and syntax highlighting
PROMPT='%F{cyan}[%F{red}%~%F{cyan}]%F{blue}───%f '
source /home/engraze/.rice/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#fix home, del, et. al. keys
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[2~" overwrite-mode
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

#enable essentials
setopt AUTO_CD
setopt CORRECT
setopt completealiases
setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE=~/.zshistory
setopt inc_append_history
setopt promptsubst
zstyle ':completion::complete:*' use-cache 1
autoload -U compinit && compinit

#enable 256-color mode
export TERM='rxvt-256color'

#set default editor (vim mustard rice)
export EDITOR="vim"

#add ~/bin to $path
export PATH=~/bin:$PATH


###
## aliases
###

#server
alias s='sudo /etc/init.d/apache2' #followed by start/restart

#irssi+nicklist/tmux script
alias irc='/bin/bash ~/irssi.sh'

#mounting lacie
alias lacie='sudo mkdir /media/engraze/lacie;sudo mount -t ntfs-3g /dev/sdf1 /media/engraze/lacie;sudo chmod 777 /media/engraze/lacie'

#copy/paste
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

#ensure cp is always recursive and verbose
alias cp='cp -Rv'

#add pretty much any font in ~/.fonts
alias fonts='mkfontdir ~/.fonts;mkfontscale ~/.fonts;xset +fp ~/.fonts;xset fp rehash;fc-cache;fc-cache -fv'

#h4x0rz ur sh1t; or ricer scripts
alias hack1='cat /dev/urandom | hexdump -c'

#screenfetch
alias sf='/bin/bash ~/.rice/screenfetch/screenfetch-dev -D debian| sed "s/Debian/Lubuntu/";echo'

#nitrogen
alias nr='nitrogen --restore'

#ls
alias ls='ls -F --color=auto'

#archives
alias ut='tar xf'
alias utv='tar xvf'
alias uz='unzip'
alias ur='unrar x'

#toilet
alias gaym='toilet --gay -f mono9 -t'
alias gayf='toilet --gay -f future -t'
alias gayt='toilet --gay -f term -t'
alias metm='toilet --metal -f mono9 -t'
alias metf='toilet --metal -f future -t'
alias mett='toilet --metal -f term -t'

#git
alias ga='git add *'
alias gc='git commit -m' #remember to put commit in quotes
alias gl='git clone'
alias gp='git push origin'
alias gh='git checkout'

#packages
alias sagi='sudo apt-get install'
alias sagr='sudo apt-get remove'
alias sai='sudo aptitude install'
alias sar='sudo aptitude remove'
