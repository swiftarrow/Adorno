# Adorno Project Setup Script.
# Setup for Tango with Django
# Author: Linkesh Diwan
# Licesnse: Peaceful Open Source License (PeaceOSL)

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

# If you have a requirements.txt file, the requirements can be installed by adorno automatically.
# ad_pip_install_requirements="True"

# Use this to install additional deb packages.  This is executed as: sudo apt-get install -y $ad_install_packages
# ad_install_packages=""

# Use a supplemental actions file to do other things that Adorno doesn't support.  Custom software installations, etc.  Your script will be executed before Adorno exits.
# ad_supplemental_actions="True"
# ad_supplemental_actions_file=""

# A final message to the new developer:
ad_success_message="Armed with your new knowledge, continue with section 2.2.2 of www.TangoWithDjango.com/book/chapers/requirements.html"


# # TESTING
# if $(grep -q def ~/.bashrc)
# then
#     echo "found"
# else
#     echo "notfound"
# fi
# 
# 
# # # TESTING
# # 
# # dm_required_python="2.7.3"
# # dm_required_python="2.7.5"
# 
# 
# # TESTING functions
# function test_function() {
#         echo "horay!!!"
# }
# 
# test_function
# 
# testvar=123
# 
# unset testvar
# 
# if [ -n "$testvar" ]
# then
#     echo "true"
# else
#     echo "false"
# fi
# # # TESTING CAN WE RUN
# # temp_file="adorno_temp"
# # thecommand=" --version"
# # 
# # python $thecommand
# # # touch $temp_file
# # if [ -e $temp_file ]
# # then
# #    echo "File $FILE exists."
# # else
# #     echo "File does not exist"
# # fi
# 
# # TESTING CHECKING PYTHON
# 
# # echo "Check if python exists at all"
# # 
# # which python &>/dev/null
# # 
# # if [ $? -eq 0 ]
# # then
# #     echo "Python exists!"
# #     dm_current_python=$(python -c 'import sys; print("%s.%s.%s" % sys.version_info[:3])')
# # else
# #     unset dm_current_python
# #     echo "No Python Found!"
# # fi
# # 
# # 
# # #test
# # echo "Current Python Version $dm_current_python"
# # 
# # # If there is no python installed, then install pythonbrew and 
# # 
# # if [ -z "$dm_current_python" ]
# # then
# #     dm_install_pythonbrew="True"
# #     echo "dm_install_pythonbrew = $dm_install_pythonbrew"
# # else
# #     dm_current_python=$(python -c 'import sys; print("%s.%s.%s" % sys.version_info[:3])')
# #     echo "The installed version of Python is $dm_current_python"
# # fi
# # 
# # 
# # if [ "$dm_current_python" == "$dm_required_python" ]
# # then
# #     echo "Do not install Python"
# # else
# #     echo "Need to install Python"
# # fi
# 
# # 
# # current_version=$(python --version | grep "Python ")
# # # echo ${current_version% *}
# # echo $current_version
# # echo ${current_version//"Python "/""}
# # 
# # # echo ${stringZ//abc/xyz}      # xyzABC123ABCxyz
# #                               # Replaces all matches of 'abc' with # 'xyz'.
# #                               
# # current=`ls`
# # # echo $current
# # 
# # python --version >> temp
# # cv_py=`cat temp`
# # echo $cv_py
# # 
# # python -c 'import sys; print(sys.version_info[0])'  sys.version_info[1]  sys.version_info[2])'
# 
# function Adorno_Unset() {
#     unset dm_project_name dm_current_python dm_required_python dm_install_pythonbrew
# }