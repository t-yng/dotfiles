
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####





# homebrewのパス設定
PATH="/usr/local/bin:$PATH"

# flutterへのパス設定
PATH="$PATH:/Users/tomohiro/workspace/tools/flutter/bin"

# Denoのパス設定
export DENO_INSTALL="/Users/tomohiro/.local"
export PATH="$DENO_INSTALL/bin:$PATH"

# Rustへのパス設定
PATH="$HOME/.cargo/bin:$PATH"

# yarn global へのパス
PATH="$(yarn global bin):$PATH"

# プロンプトの表示設定

# gitのコマンド補完設定
# http://qiita.com/ryomits/items/8abbcc683457b5e9ca34
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

# gitのブランチ名を表示する設定
# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst

# vcsの表示
zstyle ':vcs_info:*' formats '[ %F{red}%b%f ]'
zstyle ':vcs_info:*' actionformats '[%F{red}%b%f(%F{blue}%a%f)'
# プロンプト表示直前にvcs_info呼び出し
precmd() { vcs_info }

# プロンプト表示
PROMPT='
ヾ(*・ω・)ノ %F{green}%~ %F{reset_color} ${vcs_info_msg_0_}
$ '
# PROMPT='[${vcs_info_msg_0_}]:%~/%f '

# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
# 候補を選ぶには <Tab> か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

# zplugを読み込む
# https://github.com/zplug/zplug
source ~/.zplug/init.zsh

# 読み込むプラグインを記述

# syntax error の回避のためbd.zshを読み込んでいる
# @see: https://github.com/Tarrasch/zsh-bd/issues/8
zplug "Tarrasch/zsh-bd", \
    as:command, \
    rename-to:bd, \
    hook-load:"source ~/.zplug/repos/Tarrasch/zsh-bd/bd.zsh", \
    use:"bd.zsh" \

# プラグインが未インストールの場合にインストール
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load

# エイリアスの設定
alias plantuml='java -jar ~/.plantuml/plantuml.jar'
alias g='git'
alias gg='git grep'
alias dcc='docker-compose'
alias gch='git checkout $(git branch -a | tr -d " " |fzf --height 100% --prompt "CHECKOUT BRANCH>" --preview "git log {}" | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g")'
alias gpull='git symbolic-ref --short HEAD | xargs git pull origin --rebase'
alias gpush='git symbolic-ref --short HEAD | xargs git push origin'
alias ls='ls -G'
alias gswpr='gh pr list | awk '\''{print $(NF-1)}'\'' | peco | xargs git switch'

# nvmの設定
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pipenvの設定
export PIPENV_VENV_IN_PROJECT=true

export WAVE1_ADMIN_DEPLOY_USER=ec2-user
export WAVE1_ADMIN_DEPLOY_HOST=18.176.202.76
export WAVE1_ADMIN_DEPLOY_SSH_KEY=~/.ssh/wave1-admin-develop.pem 

# C言語のコンパイルでopensslのライブラリパスを追加する
# Rubyのmysql2のgemインストールでビルドエラーが出るのでその対処
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# anyenv の読み込み
eval "$(anyenv init -)"






#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
