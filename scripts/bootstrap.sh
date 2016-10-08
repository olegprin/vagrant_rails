#!/bin/bash

RVM_VERSION="2.2.4"
IP=`ifconfig eth1 | awk '/inet addr/{print substr($2,6)}'`
PATH_APP=blog_deploy

packagelist=(
  git-core
  curl
  zlib1g-dev
  build-essential
  libssl-dev
  libreadline-dev
  libyaml-dev 
  libsqlite3-dev
  sqlite3 
  libxml2-dev 
  libxslt1-dev
  libcurl4-openssl-dev
  python-software-properties
  libffi-dev
  nodejs 
  postgresql
  postgresql-contrib 
  libpq-dev
  software-properties-common
  ansible
  imagemagick
  bundler
  software-properties-common
)

echo "runing apt-get update..."
sudo apt-get -qq update
echo "installing packages..."
sudo apt-get -qq install -y ${packagelist[@]}
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

echo "installing Ruby..."
#curl -sSL https://get.rvm.io | bash > /dev/null 2>&1

# install rbenv and ruby-build
sudo -u vagrant git clone git://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
sudo -u vagrant echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.profile
sudo -u vagrant echo 'eval "$(rbenv init -)"' >> /home/vagrant/.profile
sudo -u vagrant git clone git://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build

# no rdoc for installed gems
sudo -u vagrant echo 'gem: --no-ri --no-rdoc' >> /home/vagrant/.gemrc

# install required ruby versions
sudo -u vagrant -i rbenv install 2.2.4
sudo -u vagrant -i rbenv global 2.2.4
sudo -u vagrant -i ruby -v
sudo -u vagrant -i gem install bundler --no-ri --no-rdoc
sudo -u vagrant -i rbenv rehash


#rvm install ${RVM_VERSION} --default > /dev/null 2>&1

echo "installing APP..."
cd ${PATH_APP}
gem install bundler

bundle install
#rake db:setup
#rails s -b ${IP}
