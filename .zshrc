[ -f ~/.zsh/.aliases ] && source ~/.zsh/.aliases
[ -f ~/.zsh/.options ] && source ~/.zsh/.options
[ -f ~/.zsh/.functions ] && source ~/.zsh/.functions
[ -f ~/.zsh/.prompt ] && source ~/.zsh/.prompt

export LANG=ja_JP.UTF-8
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"
