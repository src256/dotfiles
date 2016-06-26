#!/bin/sh

function git_clone
{
    url=$1
    dir=$2
    if [ ! -d $dir ]; then
        git clone $url $dir
    fi
}

git_clone https://github.com/riywo/anyenv ~/.anyenv
mkdir -p ~/.anyenv/plugins
git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
git_clone https://github.com/sstephenson/rbenv-default-gems.git ~/.anyenv/envs/rbenv/plugins/rbenv-default-gems

if [ ! -f ~/.anyenv/envs/rbenv/default-gems ]; then
   echo bundler > ~/.anyenv/envs/rbenv/default-gems
fi

if [ "$1" = "install" ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    if [ "$2" == "ruby" ]; then
        anyenv install rbenv
        rbenv update
        rbenv install --list

        RUBY_VERSION=${3:-"2.3.1"}

        echo "install $RUBY_VERSION"
        
        case $OSTYPE in
            darwin*)
                if [ -d /opt/local ]; then
                    sudo port install openssl
                    sudo port install readline
                    RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/local --with-readline-dir=/opt/local" rbenv install "$RUBY_VERSION"
                else
                    brew install openssl
                    brew install readline
                    RUBY_CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)" rbenv install "$RUBY_VERSION"
                fi
                ;;
            linux*)
                sudo yum install -y openssl-devel readline-devel zlib-devel
                rbenv install "$RUBY_VERSION"
                ;;
        esac
    elif [ "$2" == "python"]; then
        PYTHON_VERSION="3.5.1"
        pyenv update
        pyenv install --list
        pyenv install "$PYTHON_VERSION"
        pyenv global "$PYTHON_VERSION" 
    fi
fi

echo "please add your .bashrc"
cat <<- 'EOF'
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
EOF

