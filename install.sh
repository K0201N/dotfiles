#!/bin/sh

set -e

if [ "$SHELL" = "/bin/bash" ]; then
  chsh -s /bin/zsh
  chmod -R 755 /usr/local/share/zsh
  chown -R root:staff /usr/local/share/zsh
fi

if ! command -v brew > /dev/null; then
  case "$(uname -m)" in
    arm64)
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      eval "$(/opt/homebrew/bin/brew shellenv)"
      ;;
    x86_64)
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      ;;
    *)
      echo "Unsupported architecture: $(uname -m)"
      exit 1
      ;;
  esac
fi

if [ ! -d "$HOME/dotfiles" ]; then
  cd "$HOME"
  git clone https://github.com/K0201N/dotfiles.git
fi

brew bundle --file="$HOME/dotfiles/Brewfile"
stow -v -d "$HOME/dotfiles" -t "$HOME" zsh config

echo "Done!"
