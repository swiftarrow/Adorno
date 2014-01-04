#!/bin/bash
# Adorno — Adornment; embellishment, in Tango.
# Bash Script to help set up a vagrant VM to work with the Tango with Django online book.  There is no exception handling.
# Author: Linkesh Diwan swiftarrow9@gmail.com
# License: Peaceful Open Source Licens (PeaceOSL)

echo 'Installing Dependencies'

sudo apt-get -y install build-essential g++ libbz2-dev libdb5.1-dev libexpat1-dev libncurses5-dev libreadline-dev libreadline6-dev libssl-dev libsqlite3-dev libxml2-dev libxslt-dev make zlib1g-dev

echo 'Moving to Vagrants Home Folder if Necessary'

cd ~

echo 'Removing Vagrant postinstall.sh'

rm ~/postinstall.sh

echo 'Downloading and Running the PythonBrew Installer:'

curl -kL http://xrl.us/pythonbrewinstall | bash

echo 'Adding PythonBrew to bashrc...'

echo '[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc' >> ~/.bashrc

sleep 5

echo 'Sanity Check: is PythonBrew in bashrc:'

grep pythonbrew ~/.bashrc

echo 'Reloading bashrc'

source ~/.bashrc

echo 'Installing Python 2.7.5:'

pythonbrew install 2.7.5

echo 'Switching to Python 2.7.5'

pythonbrew switch 2.7.5

echo 'Sanity Check: which version of Python is running:'

which python

echo 'Installing Dependencies: python-dev python-pip'

sudo apt-get -y install python-dev python-pip

echo 'Downloading and running the VirtualEnv Burrito Installer:'

curl -s https://raw.github.com/brainsik/virtualenv-burrito/master/virtualenv-burrito.sh | bash

echo 'Starting VirtualEnv Burrito:'

source ~/.venvburrito/startup.sh

echo 'Changing to the Shared Directory:'

cd /vagrant/

echo 'Downloading .gitignore (needed by Git):'

wget https://raw.github.com/swiftarrow/Adorno/master/Git_Ignore
mv Git_Ignore .gitignore

echo 'Downloading Procfile (needed by Heroku):'

wget https://raw.github.com/swiftarrow/Adorno/master/Procfile

echo 'Initial setup completed.  Carefully inspect the text above.'
echo 'IF THERE ARE NO ERRORS, take a look at the instructions file.'
echo 'Armed with your new knowledge, continue with section 2.2.2 of'
echo 'www.TangoWithDjango.com/book/chapers/requirements.html'