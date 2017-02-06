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


##
# Your previous /Users/sora/.bash_profile file was backed up as /Users/sora/.bash_profile.macports-saved_2017-02-02_at_15:15:39
##

# MacPorts Installer addition on 2017-02-02_at_15:15:39: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:/opt/local/lib/mysql55/bin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

