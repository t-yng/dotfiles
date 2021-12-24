#!/bin/sh

# homebrewのインストール
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# homebrewのパッケージをインストール
# brew bundle install --file=homebrew/.brewfile

# gitの設定
ln git/.gitignore_global ~/
ln git/.gitconfig ~/

# .configの作成
mkdir ~/.config

# iterm2の設定
ln iterm2 ~/.config

# alfredの設定
ln alfred ~/.config

# karabinerの設定
ln karabiner ~/.config

# stylelintの設定
ln stylelint ~/.config

# eslintの設定
cp eslint ~/.config

# シェルの設定
# zplugのインストール
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# zshへ切り替え
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

# zshの設定ファイル
ln zsh/.zshrc ~/

# ターミナルを再起動
exec $SHELL -l
