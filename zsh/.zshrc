# プロンプトの表示設定

# Homeblewでインストールしたコマンドを優先するパスの設定
export PATH="usr/local/bin:$PATH"

# gitのコマンド補完設定
# http://qiita.com/ryomits/items/8abbcc683457b5e9ca34
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# zshの補完機能の設定
autoload -U compinit
compinit -u

# gitのブランチ名を表示する設定
# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst

# vcsの表示(gitのリポジトリの情報を表示)
zstyle ':vcs_info:*' formats '[ %F{red}%b%f ]'
zstyle ':vcs_info:*' actionformats '[%F{red}%b%f(%F{blue}%a%f)'
# プロンプト表示直前にvcs_info呼び出し
precmd() { vcs_info }

# プロンプト表示
PROMPT='
ヾ(*・ω・)ノ　%F{green}%~ %F{reset_color} ${vcs_info_msg_0_}
$ '
# PROMPT='[${vcs_info_msg_0_}]:%~/%f '

# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
# 候補を選ぶには <Tab> か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

# pyenv(Pythonの環境管理ツール)へのパスを追加
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# Add GHC 7.10.3 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.3.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# zshのプラグインマネージャーantigenの設定ファイルを読み込む
# 設定ファイルは参考にしたブログ記事のアイディア : http://blog.glidenote.com/blog/2012/10/25/antigen/
source ~/.zshrc.antigen

# nvmのzshプラグインを読み込む
antigen bundle lukechilds/zsh-nvm

# pythonzの設定を反映
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# direnvの設定を反映
eval "$(direnv hook zsh)"

# phpbrewの設定
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# rbenvの設定
eval "$(rbenv init -)"

# GOPATHの設定
export GOPATH=$HOME/workspace/goalias activate="source ~/.pyenv/versions/anaconda3-4.1.0/bin/activate"

# anacondaとpyenvのactivateコマンドの衝突回避
alias activate="source ~/.pyenv/versions/anaconda3-4.1.0/bin/activate"

# portainerコンテナの起動
alias portainer="docker start portainer"

# elasticsearchのpluginコマンドににパスを通す
export PATH="/usr/local/opt/elasticsearch/libexec/bin/elasticsearch-plugin:${PATH}"

# emacsをターミナルで表示するエイリアス
alias emacs="emacs -nw"

alias doco="docker-compose"
