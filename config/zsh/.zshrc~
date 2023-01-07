#########################################################
# Basic stuff
#########################################################

source ~/.config/zsh/.zprofile
export EDITOR='nvim'
export TERMINAL='st-256color'
export BROWSER='firefox'
#export MANPAGER='emacs +Man!'
export PATH=$HOME/.local/bin:$HOME/.local/bin/statusbar:$HOME/.scripts:$PATH
export TERM='alacritty'
export SVDIR=~/.service
export $(dbus-launch)
export XDG_RUNTIME_DIR=/run/user/$(id -u)

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

#########################################################
# Double prompt
#########################################################
PROMPT='%F{yellow}%1~%f %F{cyan} Artix %F{magenta}🗝 %F{yellow} %f '
#RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
#zstyle ':vcs_info:*' enable git

autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
#prompt walters


autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
ncmpcppShow() {
  BUFFER="ncmpcpp"
  zle accept-line
}
zle -N ncmpcppShow
bindkey '^[\' ncmpcppShow

source /home/kim/.config/shell/aliasrc

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# enabling vim mode
bindkey -v
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
colorscript -r
