#!/bin/bash
# Adorno — Adornment; embellishment, in Tango.
# Bash Script to help developers get quickly setup to work on your django project.
# Author: Linkesh Diwan swiftarrow9@gmail.com
# License: Peaceful Open Source Licens (PeaceOSL)

echo 'Welcome to Adorno!'

# Cleanup and Control

echo 'Changing to Project Directory:'
cd /vagrant/

temp_file="adorno_second_round_marker"

Adorno_Unset() {
    unset ad_project_name ad_current_python ad_required_python ad_install_python ad_install_pythonbrew ad_support_git ad_support_Heroku ad_use_virtualenv ad_virtualenv_name ad_use_pip ad_pip_install_requirements ad_install_packages ad_supplemental_actions ad_supplemental_actions_file ad_success_message
    if [ -n "$adorno_finito" ]
    then
        if  [ -e $temp_file ]
        then
            rm $temp_file
        fi
    fi
    unset adorno_finito
}

unset adorno_finito
Adorno_Unset

Exit_Clean() {
    adorno_finito="True" #Remove all the files too
    Adorno_Unset
    exit 0
}

Exit_Unclean() {
    unset adorno_finito #Do not Remove Files
    Adorno_Unset
    exit 0
}

# Ask function from https://gist.github.com/davejamesmiller/1965569
ask() {
    while true; do
        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi
        # Ask the question
        read -p "$1 [$prompt] " REPLY
        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi
        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}

# Search for Adorno Project Setup File
# If it doesn't exist, fail gracefully
Check_Adorno_Setup() {
    echo 'Searching for Project Setup File...'
    #source $(ls | grep _adorno.sh)
    for file in ./*_adorno.sh
    do
        source "$file"
    done
    
    if [ -z "$ad_project_name" ]
    then
        # -z ad_project_name is empty.  NOTE: -n checks if it is not empty.
        if  [ -e $temp_file ]
        then    # This means that we've executed once already, so we must be doing the tango install.
            curl -S https://raw.github.com/swiftarrow/Adorno/master/tango_adorno.sh | bash
            echo "Continuing towards a Tango with Django"
        else
            echo 'Adorno Project Setup Script is not found or not valid.'
            if ask "Shall we prepare for a Tango with Django?" Y
            then
#                 curl -S https://raw.github.com/swiftarrow/Adorno/master/tango_adorno.sh | bash
                wget https://raw.github.com/swiftarrow/Adorno/master/tango_adorno.sh
                source tango_adorno.sh
            else
                echo "You need to download the Adorno Project Setup Script from the project's repository.  It is a shell script file called:"
                echo "*_adorno.sh"
                echo "Find it, download it, and put it next to adorno.sh.  Then try again.  Good Luck!"
                Exit_Clean
            fi
        fi
    else
        echo "We will now prepare your system for $ad_project_name"
    fi
}

Check_Python() {
    echo "Checking Python Version"
    which python &>/dev/null
    if [ $? -eq 0 ]
    then
    #    echo "Python exists!"
        ad_current_python=$(python -c 'import sys; print("%s.%s.%s" % sys.version_info[:3])')
    else
        ad_current_python="0.0.0"
        echo "No Python Found!"
    fi
    echo "Current Python Version $ad_current_python"
    echo "Required Python Version $ad_required_python"
    # If we have the right version of Python, then continue.  Else, note that we need to install python.
    if [ "$ad_current_python" == "$ad_required_python" ]
    then
#         sleep 0
        unset ad_install_python
        echo "Python Dependencies Satisfied."
    else
        ad_install_python="True"
        echo "Required version of python not found, so preparing to install it.  Hang Tight..."
    fi
}

# NOTE If we install python at all, we install it via pythonbrew

Install_Python() {
    echo "Installing Python $ad_required_python"
    pythonbrew install "$ad_required_python"

    echo "Enabling Python $ad_required_python"
    pythonbrew switch "$ad_required_python"

    echo 'Sanity Check: is the right version of Python running?'
    Check_Python
}


Check_PythonBrew() {
    echo "Checking for PythonBrew..."
    which pythonbrew &>/dev/null
    if [ $? -eq 0 ]
    then
        echo "PythonBrew installed successfully."
        unset ad_install_pythonbrew
        rm $temp_file
    else
        if grep -q pythonbrew ~/.bashrc
        then
            # Pythonbrew command doesn't work, but pythonbrew is in the bashrc: Something Sinister
            echo 'ERROR: Could not find PythonBrew. Something bad happened.'
            echo "The PythonBrew Installer must have  problems, because Adorno has done it's job properly."
            echo "You might have to do this yourself.  Sorry about that.  :("
            echo "I'm leaving the temp file in place so you can debug.'"
            Exit_Unclean
        else
            # Pythonbrew command doesn't work, and pythonbrew is not in the bashrc: We haven't installed it yet.'
            ad_install_pythonbrew="True"
        fi
    fi
}


Install_PythonBrew() {
    echo "Preparing to install PythonBrew"
    echo 'Installing Dependencies:'

    sudo apt-get -y install build-essential g++ libbz2-dev libdb5.1-dev libexpat1-dev libncurses5-dev libreadline-dev libreadline6-dev libssl-dev libsqlite3-dev libxml2-dev libxslt-dev make zlib1g-dev

    echo 'Downloading and Running the PythonBrew Installer:'
    curl -kL http://xrl.us/pythonbrewinstall | bash

    echo 'Adding PythonBrew to .bashrc.'
    echo '[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc' >> ~/.bashrc

    echo 'Sanity Check: is PythonBrew in .bashrc?'

    if grep -q "pythonbrew" ~/.bashrc
    then
        echo 'Yes it is! Success! Next steps:'
        echo '1. If using Vagrant, log back with: vagrant ssh'
        echo '2. Run adorno.sh script again to continue'
        touch $temp_file
        Exit_Unclean
    else
        echo 'Could not find it. Something bad happened.'
        echo 'Sorry, I dont know what to do.'
        echo 'Try looking at the code in adorno.sh and running the commands manually.'
        Exit_Clean
    fi
}


####################################
# Here is where the work begins!!! #
####################################
echo "Checking Adorno Setup"
Check_Adorno_Setup

# echo "Checking Python"
Check_Python
# echo "Install Python $ad_install_python"

if [ -n "$ad_install_python" ]
then
    # If we need to install Python
    Check_PythonBrew
    if [ -n "$ad_install_pythonbrew" ]
    then
        #if we need to install pythonbrew
#         echo "Install PythonBrew"
        Install_PythonBrew
    else
#         echo "Install Python"
        Install_Python
    fi
fi

echo "Removing Vagrant postinstall.sh"
rm ~/postinstall.sh

if [ -n "$ad_use_virtualenv" ]
then
    echo 'Installing Dependencies: python-dev python-pip'
    sudo apt-get -y install python-dev python-pip

    echo 'Downloading and running the VirtualEnv Burrito Installer:'
    curl -s https://raw.github.com/brainsik/virtualenv-burrito/master/virtualenv-burrito.sh | bash

    echo 'Starting VirtualEnv Burrito:'
    source ~/.venvburrito/startup.sh

    if [ -n "$ad_virtualenv_name" ]
    then
        mkvirtualenv "$ad_virtualenv_name"
    fi
fi

echo "Changing to Project Directory:"
cd /vagrant/

if [ -n "$ad_support_git" ]
then
    echo 'Downloading .gitignore (needed by Git):'
    wget https://raw.github.com/swiftarrow/Adorno/master/Git_Ignore
    mv Git_Ignore .gitignore
fi

if [ -n "$ad_support_Heroku" ]
then
    echo 'Downloading Procfile (needed by Heroku):'
    wget https://raw.github.com/swiftarrow/Adorno/master/Procfile
fi

if [ -n "$ad_pip_install_requirements" ]
then
    pip install -r "$ad_pip_install_requirements"
fi

if [ -n "$ad_install_packages" ]
then
    echo "Installing additional packages..."
    sudo apt-get install -y "$ad_install_packages"
fi

if [ -n "$ad_supplemental_actions" ]
then
    echo "Executing Supplemental Actions..."
    source "$ad_supplemental_actions_file"
fi

echo ""
echo "Congratulations!!!"
echo ""
echo "Initial setup completed.  Carefully inspect the messages above.  If there are no errors, take a look at the Adorno README to learn how to use all the toys we've installed."
echo " "
echo "$ad_success_message"

adorno_finito="True"
Adorno_Unset