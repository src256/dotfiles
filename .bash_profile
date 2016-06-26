alias ls='ls -FG'

export ANYENV_ROOT="$HOME/.anyenv"
if [ -d "$ANYENV_ROOT" ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"    
fi


