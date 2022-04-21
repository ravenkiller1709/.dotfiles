if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting ""

    alias btrfortune='fortune -a -s | head -n 1 | figlet | lolcat'
    alias fortunecow='fortune -a -s | head -n 1 | cowsay | lolcat'
    
    alias l='exa -lahF --color=always --icons --sort=size --group-directories-first'
    alias ls='exa -lhF --color=always --icons --sort=size --group-directories-first'
    alias lst='exa -lahFT --color=always --icons --sort=size --group-directories-first'

set PATH $PATH:$HOME/.scripts:$HOME/.local/bin:/usr/bin:/usr/local/bin:/usr/sbin:/sbin
export EDITOR='nvim'
export TERMINAL='st'
export BROWSER='firefox'
export MANPAGER='nvim +Man!'
export PATH=$HOME/.local/bin:$PATH
export TERM='xterm-256color'

#########################################################
# Double prompt
#########################################################
set PROMPT '%F{blue}%1~%f %F{magenta} %f '
#RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
#zstyle ':vcs_info:*' enable git

# This will set the default prompt to the walters theme
#prompt walters

####################################################
#ALIAS
####################################################
alias dok='cd ~/Dokumenter'
alias nm=neomutt
alias r=ranger
alias v=nvim
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
#alias ez='nvim ~/.config/zsh/.zshrc'
#alias sz='source ~/.config/zsh/.zshrc'
alias critty='nvim ~/.config/alacritty/alacritty.yml'
alias UU='sudo pacman -Syu --noconfirm && yay -Syu --noconfirm'
alias build='sudo make clean install'
 
    alias matrix='unimatrix -f -l ocCgGkS -s 96'
    alias clock='tty-clock -sct -C 4'
    alias pipes='pipes -p 5 -R -t 1 -r 0'
    alias v=nvim
    alias x=exit
    alias ez='cd ~/.config/fish/ && nvim config.fish'
    alias sz='source ~/.config/fish/config.fish'
    alias nm=neomutt
    
    /usr/bin/colorscript -r
end
