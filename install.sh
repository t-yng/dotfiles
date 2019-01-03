#!/bin/sh

# homebrewのインストール
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# homebrewのパッケージをインストール
brew bundle install --file=homebrew/.brewfile

# gitの設定
cp git/.gitignore_global ~/
cp git/.gitconfig ~/

# iterm2の設定
mkdir ~/.iterm2
cp iterm2/com.googlecode.iterm2.plist ~/.iterm2/

# stylelintの設定
mkdir ~/.stylelint
cp stylelint/.stylelintrc ~/.stylelint/

# eslintの設定
mkdir ~/.eslint
cp eslint/.eslintrc.yml ~/.eslint/

# シェルの設定
# zplugのインストール
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# zshへ切り替え
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

# zshの設定ファイル
cp zsh/.zshrc ~/

# ターミナルを再起動
exec $SHELL -l
