# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -x /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export RIPGREP_CONFIG_PATH="$HOME/.config/.ripgreprc"

# 让提示代码为灰色
if [[ $TMUX != "" ]] then
    export TERM="tmux-256color"
else
    export TERM="xterm-256color"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

# powerlevel10k 主题配置备份。配置不应该写在这里了。
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# POWERLEVEL9K_SHORTEN_DELIMITER=..
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=$'\n'
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\uF460%F{073}\uF460%F{109}\uF460%f "

[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh

plugins=(
    git
    autojump
    zsh-autosuggestions
    zsh-syntax-highlighting
    vi-mode
    web-search
    colored-man-pages
    you-should-use
)

# vi-mode 配置
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
export YSU_MESSAGE_POSITION="after"

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

alias gs="git status"
alias gc="git commit -m "
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit  "
alias gb="git branch"
alias ga="git add ."
alias go="git checkout"
alias gpp="git push && we publish -d"
alias vi="nvim"
alias python="python3"


# Set up fzf key bindings and fuzzy completion
[ -n "$(command -v fzf)" ] && eval "$(fzf --zsh)"

# fnm
[ -n "$(command -v fnm)" ] && eval "$(fnm env --use-on-cd)"

# lazygit 配置目录
export XDG_CONFIG_HOME="$HOME/.config"

# brew 
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh

