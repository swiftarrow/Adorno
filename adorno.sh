#!/bin/bash
# Adorno — Adornment; embellishment, in Tango.
# Bash Script to help set up a vagrant VM to work with the Tango with Django online book.  There is no exception handling.
# Author: Linkesh Diwan swiftarrow9@gmail.com
# License: Peaceful Open Source Licens (PeaceOSL)

echo 'Updating Package Database:'

sudo apt-get update

echo 'Installing Dependencies: curl'

sudo apt-get -y install curl

echo 'Installing Dependencies: build-essential'

sudo apt-get -y install build-essential

echo 'Moving to Home Folder'

cd ~

echo 'Downloading and Running the PythonBrew Installer:'

curl -kL http://xrl.us/pythonbrewinstall | bash

echo 'Adding PythonBrew to bashrc...'

echo '[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc' >> ~/.bashrc

sleep 5

echo 'Checking for PythonBrew in bashrc:'

grep pythonbrew ~/.bashrc

source ~/.bashrc

echo 'Installing Python 2.7.5:'

pythonbrew install 2.7.5

echo 'Switching to Python 2.7.5'

pythonbrew switch 2.7.5

echo 'Checking which version of Python is running:'

which python

echo 'Installing Dependencies: python-dev python-pip'

sudo apt-get install python-dev python-pip

echo 'Downloading and running the VirtualEnv Burrito Installer:'

curl -s https://raw.github.com/brainsik/virtualenv-burrito/master/virtualenv-burrito.sh | bash

echo 'Starting VirtualEnv Burrito:'

source ~/.venvburrito/startup.sh

echo 'Changing to the Shared Directory:'

cd /vagrant/

echo 'Initial setup completed.  Carefully inspect the text above.'
echo 'IF THERE ARE NO ERRORS, take a look at the instructions file.'
echo 'Armed with your new knowledge, continue with section 2.2.2 of'
echo 'www.TangoWithDjango.com/book/chapers/requirements.html'