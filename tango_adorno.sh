# Adorno Project Setup Script
# Setup for Tango with Django - to enable budding django developers to quickly get going with the Tango with Django exercises.
# Author: Linkesh Diwan
# License: Peaceful Open Source License (PeaceOSL)

# NOTE
# Set a variable by setting it equal to a string.  
# Unset (or falsify) by removing everything after the =
# "True" is merely a mnemonic.
# To set as False, COMMENT the line.

# The project name must be set.  Otherwise, the script will fail.
ad_project_name="Tango With Django"

# What version of Python is required?
ad_required_python="2.7.5"
# If Python is NOT required, then uncomment the following line:
# ad_required_python="0.0.0"

# Do you want to use Git version controls?  This option will download a custom .gitignore file.  If you have your own .gitignore in your repos, then leave this false.
ad_support_git="True"

# Heroku is a cool way to stage your Django Projects online.
ad_support_Heroku="True"

# Do you want to use VirtualEnv? (Recommended)
ad_use_virtualenv="True"

# Do you want to name the virtual environment?
ad_virtualenv_name="Tango_Django"

# If you have a requirements.txt file, the requirements can be installed by adorno automatically.  You can add the path to the requirements file if it is not in the project root.
# ad_pip_install_requirements="requirements.txt"

# Use this to install additional deb packages.  This is executed as: sudo apt-get install -y $ad_install_packages
# ad_install_packages=""

# Use a supplemental actions file to do other things that Adorno doesn't support.  Custom software installations, etc.  Your script will be executed before Adorno exits.
# ad_supplemental_actions="True"
# ad_supplemental_actions_file=""

# A final message to the new developer:
ad_success_message="Armed with your new knowledge, continue with section 2.2.2 of www.TangoWithDjango.com/book/chapers/requirements.html"
