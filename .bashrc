# Terminal Shortcuts
alias cp='cp -iv'
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ls='ls -FGlAhp'
alias ll='ls -FGlAhp'
alias f='open -a Finder ./'

function cd {
    builtin cd "$@" && ll
}

# Directory Navigation
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ....='cd ../../../'                   # Go back 3 directory levels
alias .....='cd ../../../../'               # Go back 4 directory levels
alias dev='cd ~/dev/'
alias mksp='cd ~/dev/makespace'

# Git Alias
alias gs='git status -s -b'
alias ga='git add .'
alias gcm='git commit -m'
alias gp="git push"
alias gpt='yarn test:CI && git push'
alias gpf='git push -f'
alias gamend='git commit --amend'
alias gk='gitk --all'
alias gf='git fetch'
alias gch='git checkout'
alias ghard='git reset --hard $1'
alias gcb='git checkout -b $1'
alias gdel='git branch -d $1'

function gump {
    branch_name=$(git symbolic-ref -q HEAD)
    branch_name=${branch_name##refs/heads/}
    branch_name=${branch_name:-HEAD}
    git push --set-upstream origin ${branch_name}
}

# Bash Updates
alias src='source ~/.zshrc'
alias zprof='code ~/.zshrc'
alias hprof='code ~/.hyper.js'
alias prof_rc='code ~/.bash_profile'
alias prof='code ~/dev/machine-profiles/.bashrc'
alias pi='ssh pi@raspberrypi.local'

# randoms
alias newnote='touch ~/dev/notes $1'
alias notes='code ~/dev/notes'
alias oneone='code ~/dev/notes/one_on_one.md'

# alias dockspace=`defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock`

alias usemksp='npm config set registry https://npm-proxy.fury.io/makespace/'
alias usenpm='npm config set registry https://registry.npmjs.org'

alias sphell='source .venv/bin/activate'
