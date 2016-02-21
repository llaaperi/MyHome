#!/bin/sh

echo "$(tput setaf 3)Installing environment$(tput sgr0)"

sudo apt-get update

#Postgres
echo "$(tput setaf 3)Installing Postgres$(tput sgr0)"
sudo apt-get install -y postgresql postgresql-contrib
echo "$(tput setaf 3)Postgres installed$(tput sgr0)"

#Python tools
echo "$(tput setaf 3)Installing Python tools$(tput sgr0)"
sudo apt-get install -y python-pip python-dev libffi-dev libssl-dev libpq-dev libxml2-dev libxslt1-dev python-psycopg2 build-essential
echo "$(tput setaf 3)Python tools installed$(tput sgr0)"

#Supervisor
echo "$(tput setaf 3)Installing Supervisor$(tput sgr0)"
sudo apt-get install -y supervisor
echo "$(tput setaf 3)Supervisor installed$(tput sgr0)"

#Nginx
echo "$(tput setaf 3)Installing Nginx$(tput sgr0)"
sudo apt-get install -y nginx
echo "$(tput setaf 3)Nginx installed$(tput sgr0)"

#Autossh
echo "$(tput setaf 3)Installing Autossh$(tput sgr0)"
sudo apt-get install -y autossh
echo "$(tput setaf 3)Autossh installed$(tput sgr0)"

#Virtualenv
echo "$(tput setaf 3)Installing virtualenv$(tput sgr0)"
sudo pip install virtualenv
echo "$(tput setaf 3)Virtualenv installed$(tput sgr0)"

echo "$(tput setaf 3)Environment installed$(tput sgr0)"