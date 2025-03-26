cd;
echo "Verifying the default shell..." &&
if [[ "$SHELL" == "$(which zsh)" ]]; then
    echo "Zsh is the default shell!";
else
    echo "Zsh is not the default shell." &&
    echo "Setting Zsh as the default shell" &&
    chsh -s $(which zsh);
fi

sudo cat <<'catEND' > /usr/share/zsh/functions/Prompts/prompt_pedrorochaosx_setup
# pedrorochaosx prompt theme

prompt_pedrorochaosx_help () {
  cat <<'EOF'
This prompt is color-scheme-able.  You can invoke it thus:

  prompt pedrorochaosx [<color1> [<color2> [<color3>]]]

where the colors are for the user@host background, current working
directory, and current working directory if the prompt is split over
two lines respectively.  The default colors are blue, cyan and green.
This theme works best with a dark background.

Recommended fonts for this theme: nexus or vga or similar.  If you
don't have any of these, then specify the `plain' option to use 7-bit
replacements for the 8-bit characters.
EOF
}

prompt_pedrorochaosx_setup () {
  setopt localoptions nowarncreateglobal
  prompt_pedrorochaosx_color1=${1:-'black'}
  prompt_pedrorochaosx_color2=${2:-'red'}
  prompt_pedrorochaosx_color3=${3:-'yellow'}

  base_prompt="%B%F{red}%*%f %F{red}%n%B "
  post_prompt="%b%f%k"

  setopt localoptions extendedglob
  base_prompt_no_color="${base_prompt//(%K{[^\\\}]#\}|%k)/}"
  post_prompt_no_color="${post_prompt//(%K{[^\\\}]#\}|%k)/}"

  add-zsh-hook precmd prompt_pedrorochaosx_precmd
}

prompt_pedrorochaosx_precmd () {
  setopt localoptions noxtrace nowarncreateglobal
  local base_prompt_expanded_no_color base_prompt_etc
  local prompt_length space_left

  base_prompt_expanded_no_color=$(print -P "$base_prompt_no_color")
  base_prompt_etc=$(print -P "$base_prompt%(4~|...|)%3~")
  prompt_length=${#base_prompt_etc}

  path_prompt="%B%F{$prompt_pedrorochaosx_color2}%~%F{red}"  # Ensures single-line prompt

  PS1="$base_prompt$path_prompt %F{red}%#%f $post_prompt"
  PS2="$base_prompt$path_prompt %_> $post_prompt"
  PS3="$base_prompt$path_prompt ?# $post_prompt"
}

prompt_pedrorochaosx_setup "$@"
catEND

cat << 'catEND' > .zshrc
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt pedrorochaosx

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
