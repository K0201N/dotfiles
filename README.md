# dotfiles

[![自動チェック](https://github.com/K0201N/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/K0201N/dotfiles/actions/workflows/ci.yml)

macOS向けの個人用dotfiles。ZshとGitの設定はStowで、コマンドラインツール、デスクトップアプリ、Visual Studio Codeの拡張機能はHomebrewの`Brewfile`で管理する。

自分のアカウント向けの設定を含むため、別環境で使う場合は[`config/.gitconfig`](config/.gitconfig)を確認する。

## Setup

既存の`~/.zshrc`、`~/.zprofile`、`~/.zsh`、`~/.gitconfig`をバックアップしてから、次を実行する。

```sh
git clone https://github.com/K0201N/dotfiles.git "$HOME/dotfiles"
cd "$HOME/dotfiles"
./install.sh
```

必要に応じてソフトウェア管理ツールを導入し、`Brewfile`に記載されたソフトウェアをインストールする。あわせて`zsh`、`config`ディレクトリへのリンクをホームディレクトリに作成する。

内容を確認したうえで、次のコマンドから直接実行することもできる。

```sh
curl -fsSL https://raw.githubusercontent.com/K0201N/dotfiles/main/install.sh | sh
```

## Local configuration

`~/.zshrc.local`があれば、`~/.zshrc`から読み込む。秘密情報、仕事用の設定、端末固有のパスは、リポジトリで追跡しないこのファイルに記載する。

```sh
cp "$HOME/.zshrc.local.example" "$HOME/.zshrc.local"
```

## Update

```sh
git -C "$HOME/dotfiles" pull --ff-only
brew bundle --file="$HOME/dotfiles/Brewfile"
stow -R -d "$HOME/dotfiles" -t "$HOME" zsh config
```

## Remove managed links

```sh
stow -D -d "$HOME/dotfiles" -t "$HOME" zsh config
```

管理対象のリンクだけを削除する。インストール済みのソフトウェアやリポジトリは削除せず、以前のコマンド実行環境にも戻さない。

## Automation

GitHub Actionsは、Pull Requestの作成時と`main`の更新時に、インストール処理、Zshの設定、リンクの配置、`Brewfile`の内容を検証する。Dependabotは、GitHub Actionsで利用する部品の更新を毎週確認し、利用可能な更新を1件のPull Requestにまとめる。
