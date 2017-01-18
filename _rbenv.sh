#!/bin/sh

function git_clone
{
    url=$1
    dir=$2
    if [ ! -d $dir ]; then
        git clone $url $dir
    fi
}

git_clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git_clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git_clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git_clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
git_clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

if [ ! -f ~/.rbenv/default-gems ]; then
    echo bundler > ~/.rbenv/default-gems
fi

if [ "$1" = "install" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"

    rbenv update
    rbenv install --list

    RUBY_VERSION=${2:-"2.4.0"}

    echo "install $RUBY_VERSION"
        
    case $OSTYPE in
        linux*)
            sudo yum install -y bzip2 gcc openssl-devel readline-devel zlib-devel curl-devel mysql-devel sqlite-devel
            rbenv install "$RUBY_VERSION"
            ;;
    esac
fi

echo "please add your .bashrc"
cat <<- 'EOF'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
EOF

