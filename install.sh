#!/bin/sh

set -e

if [ "$(dscl . -read ~/ UserShell)" = "UserShell: /bin/bash" ]; then
  chsh -s /bin/zsh
  chmod -R 755 /usr/local/share/zsh
  chown -R root:staff /usr/local/share/zsh
fi

if ! command -v brew > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ ! -d ~/dotfiles ]; then
  cd ~
  git clone https://github.com/K0201N/dotfiles.git
fi

pushd ~/dotfiles
stow -v -t ~ zsh config
popd
