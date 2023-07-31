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

# Git Alias
alias gs='git status -s -b'
alias ga='git add --patch'
alias gcm='git commit -v'
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
alias gdelr='git push origin --delete "$(git symbolic-ref --short -q HEAD)"'
alias gho='git reset --hard origin/"$(git symbolic-ref --short -q HEAD)"'


# Runs git push set upstream with the current branch name
function gump () {
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

alias weather='curl -4 wttr.in/Stamford,CT'

 export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# randoms
alias python=python3
alias groc='ngrok http --region=us --hostname=1e21-96-250-168-54.ngrok.io'

nba() {
    if [ "$PWD" != "/Users/BEggers/dev/nba/nba-next" ]; then
        cd /Users/BEggers/dev/nba/nba-next
    fi
    # if "$1" exists, run the command, else skip anything
    if [ -n "$1" ]; then
        npm run dev:"$1":ssl
    fi
}

JIRA_API_TOKEN="ATATT3xFfGF08mdyO4f-v1la7wAslKgCv6-rg1Az2UQ--I5shlxgzv0UQtWxblIsI1_LMqr0GfXlI1a-mBEn8LLXUfN_5OSkaCMIz3DPL0_v52EbrmmEMyfDfs6NVvc6C7RlhheM1nSMvy-uHirH9bxo2Bfd1cNMs2nA3Z_Fw4bPNqn4Jmvmcr8=FE7437F3"

alias firefox="open /Applications/Firefox.app"

mpgif() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: mp4togif input.mp4 output.gif [width]"
  else
    local width=${3:-1200}
    ffmpeg -i "$1" -vf "fps=15,scale=$width:-1:flags=lanczos,palettegen" -y palette.png && \
    ffmpeg -i "$1" -i palette.png -filter_complex "fps=15,scale=$width:-1:flags=lanczos[x];[x][1:v]paletteuse" -y "${2%.gif}.gif" && \
    rm palette.png
  fi
}

kp() {
  exec npx kill-port $1
}