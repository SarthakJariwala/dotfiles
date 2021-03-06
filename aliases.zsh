# Shortcuts
alias reloadshell="source $HOME/.zshrc"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Conda
alias ca="conda activate"
alias cda="conda deactivate"

# Directories
alias dotfiles="cd $DOTFILES"

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias pull="git pull"
alias push="git push"
alias unstage="git restore --staged ."
