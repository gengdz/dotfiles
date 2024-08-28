alias gs="git status"
alias gc="git commit -m "
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad | %cr) %C(bold blue)<%an>%Creset' --abbrev-commit  --date=format:'%m-%d %H:%M' "
alias gb="git branch"
alias ga="git add ."
alias go="git checkout"
alias gpp="git push && we publish -d"
alias vi="nvim"
alias python="python3"

# fnm
eval "$(fnm env --use-on-cd)"
