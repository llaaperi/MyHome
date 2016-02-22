#!/bin/sh

INSTALL_PKG=myhome.tar.gz
INSTALL_DIR=myhome

#Check that selected app is backdoor or console
if [ ! "$1" = "backdoor" ] &&  [ ! "$1" = "console" ]; then
	echo "$(tput setaf 1)Invalid app [backdoor, console]$(tput sgr0)"
	exit 1
fi

#Check user
APP=$1
if [ "$APP" = "backdoor" ] && [ ! "$USER" = "pi" ]; then
	echo "$(tput setaf 1)Script must be run by user pi$(tput sgr0)"
	exit 1
fi
if [ "$APP" = "console" ] && [ ! "$USER" = "lauri" ]; then
	echo "$(tput setaf 1)Script must be run by user lauri$(tput sgr0)"
	exit 1
fi

echo "$(tput setaf 3)Installing app <$APP>$(tput sgr0)"

echo "$(tput setaf 3)Creating install directory$(tput sgr0)"
mkdir -p $INSTALL_DIR

#Check that compressed file exists
if [ ! -f "$INSTALL_PKG" ]; then
	echo "$(tput setaf 1)Missing $INSTALL_PKG file$(tput sgr0)"
	exit 1
fi

#Unpack files
echo "$(tput setaf 3)Unpacking files$(tput sgr0)"
tar -xzf $INSTALL_PKG -C $INSTALL_DIR

#Check if virtualenv is istalled
if [ ! -d "$INSTALL_DIR/env" ]; then
	echo "$(tput setaf 3)Installing virtual environment$(tput sgr0)"
	virtualenv ./$INSTALL_DIR/env
fi

#Check that pip is up to date
echo "$(tput setaf 3)Upgrading pip$(tput sgr0)"
$INSTALL_DIR/env/bin/pip install --upgrade pip

#Configuration files
sudo rm /etc/nginx/sites-enabled/default
echo "$(tput setaf 3)Copying nginx configuration file to /etc/nginx/sites-enabled/$APP$(tput sgr0)"
sudo cp $INSTALL_DIR/$APP/nginx.conf /etc/nginx/sites-enabled/$APP
echo "$(tput setaf 3)Copying supervisor configuration file to /etc/supervisor/conf.d/$APP.conf$(tput sgr0)"
sudo cp $INSTALL_DIR/$APP/supervisor.conf /etc/supervisor/conf.d/$APP.conf

#Python uninstall
if [ "$APP" = "backdoor" ]; then
	echo "$(tput setaf 3)Uninstalling old version$(tput sgr0)"
	$INSTALL_DIR/env/bin/pip uninstall -y MyHomeBackdoor
fi
if [ "$APP" = "console" ]; then
	echo "$(tput setaf 3)Uninstalling old version$(tput sgr0)"
	$INSTALL_DIR/env/bin/pip uninstall -y MyHomeConsole

	#sudo rabbitmq-server -detached
fi

#Python install
echo "$(tput setaf 3)Installing new version$(tput sgr0)"
$INSTALL_DIR/env/bin/pip install $INSTALL_DIR/$APP/.

echo "$(tput setaf 3)(Re)starting the application servers$(tput sgr0)"
sudo service supervisor restart
wait
sudo service nginx restart
wait

echo "$(tput setaf 3)Remember to add autossh to crontab (crontab -e -> @reboot /home/pi/vekarus/run_autossh.sh)$(tput sgr0)"
