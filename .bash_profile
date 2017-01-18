alias ls='ls -FG'

export ANYENV_ROOT="$HOME/.anyenv"
export RBENV_ROOT="$HOME/.rbenv"
if [ -d "$ANYENV_ROOT" ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"    
elif [ -d "$RBENV_ROOT" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi



