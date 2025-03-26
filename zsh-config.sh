cd;
echo "Verifying the default shell..." &&
if [[ "$SHELL" == "$(which zsh)" ]]; then
    echo "Zsh is the default shell!";
else
    echo "Zsh is not the default shell." &&
    echo "Setting Zsh as the default shell" &&
    chsh -s $(which zsh);
fi

cat << 'catEND' > .zshrc
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias apti='sudo apt install -y'
alias aptu='sudo apt update && apt list --upgradable'
alias aptlu='apt list --upgradable'
alias aptli='apt list --installed'
alias aptupg='sudo apt upgrade -y'
alias plsblk='lsblk -o NAME,TYPE,FSTYPE,FSUSE%,FSAVAIL,SIZE,MOUNTPOINTS -J; lsblk -o NAME,TYPE,FSTYPE,FSUSE%,FSAVAIL,SIZE,MOUNTPOINTS'
catEND

source ~/.zshrc;
echo "Please restart your terminal or log out and log back in to apply the changes."
