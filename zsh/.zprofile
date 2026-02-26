# Homebrew
case "$(uname -m)" in
  arm64) eval "$(/opt/homebrew/bin/brew shellenv)" ;;
  x86_64) eval "$(/usr/local/bin/brew shellenv)" ;;
esac

# Language
export LANG=ja_JP.UTF-8

# PATH
[[ -d ~/.rbenv ]] && export PATH="${HOME}/.rbenv/bin:${PATH}" && eval "$(rbenv init -)"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
