#########################################################
# Basic stuff
#########################################################

source ~/.config/zsh/.zprofile
PATH=$PATH:$HOME/.scripts
export EDITOR='emacs'
export TERMINAL='alacritty'
export BROWSER='firefox'
export MANPAGER='emacs +Man!'
export PATH=$HOME/.local/bin:$PATH
export TERM='xterm-256color'

#########################################################
# Double prompt
#########################################################
PROMPT='%F{blue}%1~%f %F{magenta} %f '
#RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
#zstyle ':vcs_info:*' enable git

autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
#prompt walters

####################################################
#ALIAS
####################################################
alias dok='cd ~/Dokumenter'
alias nm=neomutt
alias r=ranger
alias v=vim
alias cdv='cd ~/.config/nvim && nvim init.vim'
alias ls='exa -la'
#alias c='cd ~/.config/i3/ && nvim config'
alias c='cd ~/.xmonad/ && nvim xmonad.hs'
alias b='nvim ~/.xmobarrc'
alias cx='xmonad --recompile'
alias d='cd ~/.local/src/dwm && nvim config.h'
alias cdd='cd ~/.local/src/dwm'
alias cds='cd ~/.local/src/slstatus'
alias s='cd ~/.local/src/slstatus && nvim config.h'
alias cdm='cd ~/.local/src/dmenu'
alias m='cd ~/.local/src/dmenu && nvim config.h'
alias cdt='cd ~/.local/src/st'
alias t='cd ~/.local/src/st && nvim config.h'
alias k='cd ~/.config/sxhkd/ && nvim sxhkdrc'
alias cdc='cd ~/.config/bspwm'
alias cdk='cd ~/.config/sxhkd'
alias p='cd ~/.config/polybar/ && nvim config'
alias cdp='cd ~/.config/polybar'
alias x=exit
alias ez='nvim ~/.config/zsh/.zshrc'
alias sz='source ~/.config/zsh/.zshrc'
alias critty='nvim ~/.config/alacritty/alacritty.yml'
alias UU='sudo pacman -Syu --noconfirm && yay -Syu --noconfirm'
alias build='sudo make clean install'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g CA="2>&1 | cat -A"
alias -g C='| wc -l'
alias -g D="DISPLAY=:0.0"
alias -g DN=/dev/null
alias -g ED="export DISPLAY=:0.0"
alias -g EG='|& egrep'
alias -g EH='|& head'
alias -g EL='|& less'
alias -g ELS='|& less -S'
alias -g ETL='|& tail -20'
alias -g ET='|& tail'
alias -g F=' | fmt -'
alias -g G='| egrep'
alias -g H='| head'
alias -g HL='|& head -20'
alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
alias -g LL="2>&1 | less"
alias -g L="| less"
alias -g LS='| less -S'
alias -g MM='| most'
alias -g M='| more'
alias -g NE="2> /dev/null"
alias -g NS='| sort -n'
alias -g NUL="> /dev/null 2>&1"
alias -g PIPE='|'
alias -g R=' > /c/aaa/tee.txt '
alias -g RNS='| sort -nr'
alias -g S='| sort'
alias -g TL='| tail -20'
alias -g T='| tail'
alias -g US='| sort -u'
alias -g VM=/var/log/messages
alias -g X0G='| xargs -0 egrep'
alias -g X0='| xargs -0'
alias -g XG='| xargs egrep'
alias -g X='| xargs'

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

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# enabling vim mode
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
