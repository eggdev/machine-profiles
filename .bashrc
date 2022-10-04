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
alias slate='cd ~/dev/os'

# Git Alias
alias gs='git status -s -b'
alias ga='git add --patch'
alias gcm='git commit -v'
alias gp="git push"
alias gpt='yarn test:CI && git push'
alias gpf='git push -f'
alias gpe='git push eggdev'
alias gamend='git commit --amend'
alias gk='gitk --all'
alias gf='git fetch'
alias gch='git checkout'
alias ghard='git reset --hard $1'
alias gcb='git checkout -b $1'
alias gdel='git branch -d $1'
alias gho='git reset --hard origin/"$(git symbolic-ref --short -q HEAD)"'

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
alias prof='code ~/dev/personal/machine-profiles/.bashrc'
alias espn='ssh pi@espn.local'
alias pace='ssh pi@paceclock.local'
alias pi='ssh pi@raspberrypi.local'

# randoms
alias python=python3
alias groc='ngrok http --region=us --hostname=1e21-96-250-168-54.ngrok.io'


function today {
    team=("Anton" "Boz" "Ivo" "Don" "Emmanuel" "Marina" "Matt" "Tom")
    team=($(shuf -e "${team[@]}"))
    team=("Ivan" "Brendan" "Liron" "${team[@]}")
    for str in ${team[@]}; do
        echo $str
    done
}


# alias dockspace=`defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock`'
