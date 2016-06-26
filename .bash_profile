alias ls='ls -FG'

export RBENV_ROOT="$HOME/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
   export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
   eval "$(rbenv init -)";
fi

export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi
