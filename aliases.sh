## SETTINGS

if command -v lvim &> /dev/null
then
  export EDITOR=lvim
  export VISUAL=lvim
elif command -v nvim &> /dev/null
then
  export EDITOR=nvim
  export VISUAL=nvim
elif command -v vim &> /dev/null
then
  export EDITOR=vim
  export VISUAL=vim
fi

## COMMANDS

alias update="sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && flatpak update -y"

if command -v exa &> /dev/null
then
  alias ls='exa --icons'
fi

alias open='xdg-open'
set-open-default() {
  xdg-mime default $1.desktop $(xdg-mime query filetype $2)
}

alias tempdir='mkdir -p /tmp/__tempdir && cd /tmp/__tempdir'
alias tempcode='mkdir -p /tmp/__code && cd /tmp/__code'
alias tempdownloads='mkdir -p /tmp/__downloads && cd /tmp/__downloads'
alias tempdocuments='mkdir -p /tmp/__documents && cd /tmp/__documents'
alias temppictures='mkdir -p /tmp/__pictures && cd /tmp/__pictures'

alias gemp="touch main.cpp input output"

## COPY AND PASTE

alias c='xclip && xclip -o | xclip -selection clipboard'
alias v='xclip -o'

## ZSHRC

alias ezshrc="$EDITOR ~/.zshrc"
alias szshrc="source ~/.zshrc"

## CMAKE

alias rcmkb='cmake --build .'
alias rrcmkb='cmake .. && cmake --build .'
alias cmkb='rm -rf build && mkdir build && cd build && cmake .. && cmake --build .'
alias cmkc='cd .. && rm -rf build'

## MAKE

alias mm="make main && ./main"
alias mmi="make main && ./main < input"
alias mmid="make main && ./main < input | diff -c - output"

## SSH

sssh() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/mysshkey
}

## DOCKER

clear_docker() {
  docker rm -f $(docker ps -aq)
  docker image rm -f $(docker image ls -aq)
  docker volume rm $(docker volume ls -q)
}

## GIT

alias gitconfigget='git config user.name && git config user.email'
alias gitconfigpersonal='git config user.name "GustaMonteiro" && git config user.email "gcvm6070@gmail.com"'
alias gitconfighp='git config user.name "Gustavo Monteiro" && git config user.email "gustavo.monteiro@hp.com"'
alias gitconfigconceptu='git config user.name "Gustavo Monteiro" && git config user.email "gustavo.monteiro@conceptu.ind.br"'

## PYTHON

activate_venv() {
  env_name=$1

  if [[ $# -eq 0 ]]; then
    env_name="venv"
  fi

  if [[ ! -d $env_name ]]; then
    python -m venv $env_name
  fi

  source $env_name/bin/activate
}

## UTILITY

alias tb='nc termbin.com 9999'
