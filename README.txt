The environment that the Adorno script sets up consists of, in addition to the toolkit expected by Tango with Django, the following:
    VirtualBox (http://virtualbox.org/)
    Vagrant (http://www.vagrantup.com/)
    VirtualEnv Burrito, which includes:
        VirtualEnvWrapper (http://virtualenvwrapper.readthedocs.org/en/latest/install.html#quick-start)
        VirtualEnv
    PythonBrew
    Git
    Heroku


GETTING READY TO TANGO:
    
Note, the commands below given for the host are for a *nix based computer.

    Download and install VirtualBox from www.virtualbox.org
    Download and install Vagrant from www.vagrantup.com
    Download and install Git version control git-scm.com
    Go to Heroku, create an account, and download and install the heroku toolkit
    Create a new folder on your computer for your django project. 
        host:~$ mkdir ~/tango

    Copy the files adorno.sh and Vagrantfile to that folder.
        host:~$ cp ~/Downloads/adorno.sh ~/tango/
        host:~$ cp ~/Downloads/Vagrantfile ~/tango/
        host:~$ cp ~/Downloads/Git_Ignore ~/tango/.gitignore
        host:~$ cp ~/Downloads/Procfile ~/tango/

    Change to the project directory:
        host:~$ cd ~/tango

    Start Vagrant
        host:~$ vagrant up
    
    It will download and install the precise64 virtual image, and then boot the system.
    After it's booted, go into the vagrant box by:
        host:~$ vagrant ssh

    You are now logged into your virtual system.  Now we need to set up the machine for use.
    Execute vagrant's post-install script:
        vagrant:~$ sudo ./post_install.sh

    ADD ADORNO TO THE SYSTEM:
        vagrant:~$ source /vagrant/adorno.sh
    
    Go over the output from the adorno command just to make sure that everything went through well.  
    If there were no errors, your good to go!  
    Adorno drops you into the folder vagrant:/vagrant/, which is actually the same as your project directory, host:~/tango

    Now it's time to start a virtual environment for our project:
        vagrant:/vagrant$ mkvirtualenv tangodjango
    
    And let's activate the new environment:
        vagrant:/vagrant$ workon tangodjango
    
    Now we should continue with the Tango with Django instructions found here:
    http://www.tangowithdjango.com/book/chapters/requirements.html
    Install Django (section 2.2.4):
        (tangodjango)vagrant:/vagrant$ pip install -U Django==1.5.4
        
    Install the Python Imaging Library (section 2.2.5):
        (tangodjango)vagrant:/vagrant$ pip install pil
        
    Install other Python Packages that you need (section 2.2.6):
        (tangodjango)vagrant:/vagrant$ pip install package_name

    Finally, save your Package List:
        (tangodjango)vagrant:/vagrant$ pip freeze > requirements.txt
    
    Celebrate!  You have finished setting up the requirements for Tango with Django!
    Since that's quite a bit of work for today, we'll wind down before starting the actual django project.
    

WINDING DOWN THE EASY WAY:

    First exit the vagrant box:
        (tangodjango)vagrant:/vagrant$ exit
    
    Suspend the vagrant box:
         host:~/tango$ vagrant suspend


WINDING DOWN THE LONG WAY:
    
    First de-activate the virtual environment:
        (tangodjango)vagrant:/vagrant$ deactivate
    
    Exit the vagrant box:
        (tangodjango)vagrant:/vagrant$ exit
    
    Shut down the vagrant box:
        host:~/tango$ halt


TANGO STEPS:

Note: this is a sample workflow, assuming that you are on a *nix based host computer.  For windows based computers, the exact commands may vary slightly.
The best way to do this is have three terminal windows, each open to ~/tango.  On two of them, log into the vagrant box.  Use one of these for runserver, and the other for file operations.  Use the third window for file operations on the host system.  For the following, we're labelling these three windows T1, T2, and T3.

    T1 Start the vagrant box that we've already prepared:
        host:~/tango$ vagrant up
    
    T1 & T2 Log into the vagrant box:
        host:~/tango$ vagrant ssh
        
    T1 & T2 Go to your project directory:
        vagrant:~$ cd /vagrant
    
    T1 & T2 Enter the virtual environment:
        vagrant:/vagrant$ workon tangodjango
        
    T1 If you haven't already, start a Django project:
        (tangodjango)vagrant:/vagrant$ django-admin.py startproject rango
    
    T1 & T2 Enter the project directory:
        (tangodjango)vagrant:/vagrant$ cd rango
    
    Now you're all set.  Use your editor on your host machine to edit the files as you need.  
    They are in the folder ~/tango/rango
    Start django apps as necessary.  Make or delete files as you need.
    
    T1 Finally, come to the live test (note the IP and port specifier are important!)
        (tangodjango)vagrant:/vagrant/rango$ python manage.py runserver 0.0.0.0:8000
    
    On your host machine, open a browser and go to 127.0.0.1:8888 to admire your project!


GOING TO THE BIG STAGE:

Note: Heroku is a pretty awesome service, which allows us to run our apps live online, for free!  To use it, we use Git to push our code to Heroku.  All of these commands are done on the host machine (in the third terminal window, if you followed the Dance Steps above).
    Setup Heroku:
        host:~/tango$ heroku login
    
    Follow the instructions, generate an SSH key if necessary.
    
    I recommend that you follow the first two lessons of Getting Started With Django to learn how to set your code up to deploy to Heroku and run locally at the same time.
    Alternatively, you can use the instructions at https://devcenter.heroku.com/articles/getting-started-with-django to set up your Django program for Heroku.
    
    Setup Git:
        host:~/tango$ git init
    
    Add the files to Git:
        host:~/tango$ git add .
    
    Commit the first version to Git:
        host:~/tango$ git commit -am "The first Commit!"
    
    Create a Heroku instance:
        host:~/tango$ heroku create
    
    Deploy to Heroku:
        host:~/tango$ git push heroku master
    
    The last command will give you a URL where you can see your code running live!  Check it out:
        host:~/tango$ heroku open
        

TANGO ON AND ON:
    
    Open a file, make some changes, save it.
    Check that Git has it marked for inclusion:
        host:~/tango$ git status
    
    Add files as necessary (see Git documentation for help).
    Finally, commit all the necessary changes and write a short Commit Message:
        host:~/tango$ git commit -am "Commit Message"
    
    Run your webapp on your own system as above, or on Heroku:
        host:~/tango$ git push heroku master
        host:~/tango$ heroku open