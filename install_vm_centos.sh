#!/bin/sh


support=false
case $OSTYPE in
    linux*)
        support=true
    ;;
esac

if [ "$support" = false ]; then
    echo "ERROR: unsupported $OSTYPE"
    exit 
fi

if ! rpm -q epel-release > /dev/null; then
    sudo rpm -i http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
    sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
    sudo yum clean metadata
fi

sudo yum install gcc
sudo yum install httpd
sudo yum install emacs
sudo yum install git











