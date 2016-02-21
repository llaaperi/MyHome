#!/bin/sh

#Check if virtualenv is istalled
if [ ! -d "env" ]; then
	echo "$(tput setaf 3)Installing virtual environment$(tput sgr0)"
	virtualenv env
fi

#Check that pip is up to date
env/bin/pip install --upgrade pip

#Python modules
echo "$(tput setaf 3)Uninstalling old versions of backdoor and console$(tput sgr0)"
env/bin/pip uninstall -y MyHomeBackdoor
env/bin/pip uninstall -y MyHomeConsole

echo "$(tput setaf 3)Installing new versions of backdoor and console$(tput sgr0)"
env/bin/pip install -e backdoor/.
env/bin/pip install -e console/.
