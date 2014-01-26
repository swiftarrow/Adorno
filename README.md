# Adorno: Embellishing your Tango with Django

The `adorno.sh` script helps you to set up an environment for Django coding.  Key advantages for this environment are:

* Code your files in a nice location on your main system as you would normally.
* Django and your code runs in a Virtual Machine (No installing packages such as different versions of python on your system=).
* Easy way to handle different python / django versions for different projects.
* Easy Version Controlling with Git!
* Etc Etc...

The environment that the Adorno script sets up consists of, in addition to the toolkit expected by Tango with Django, the following:

1. VirtualBox (http://virtualbox.org/)
2. Vagrant (http://www.vagrantup.com/)
3. VirtualEnv Burrito, which includes:
  * VirtualEnvWrapper (http://virtualenvwrapper.readthedocs.org/en/latest/install.html#quick-start)
  * VirtualEnv
4. PythonBrew
5. Git
6. Heroku (optional)

This README document also doubles as a quick-reference guide for beginners like me!

**Note: All the command examples below contain the command prompt (everything before the `$`).  This shows you which terminal and which environment you should be in to execute the command properly.  The command, incidentally, is everything after the `$`, not including `$`.**

**Note: the commands below given for the host are for a Debian-based (Ubuntu, LinuxMint, etc) computer.  For Windows and Mac hosts, there might be small differences.**

## GETTING READY TO TANGO:

1. Download and install VirtualBox from www.virtualbox.org.  Use the packages from the website, not the ones in your distribution's repositories.
2. Download and install Vagrant from www.vagrantup.com.  Again, find the packages on the website.
3. Download and install Git version control from www.git-scm.com.
```bash
host:~$ sudo apt-get -y install git
```

4. (Optional, Highly Recommended) Go to Heroku, create an account, and download and install the heroku toolkit www.heroku.com 

1. Create a folder for your Django project.
```bash
host:~$ mkdir ~/tango
```

1. Change to the project directory:
```bash
host:~$ cd ~/tango
```

1. Download the Vagrantfile to your project directory:
```bash
host:~/tango$ wget https://raw.github.com/swiftarrow/Adorno/master/Vagrantfile
```

1. Start Vagrant
```bash
host:~/tango$ vagrant up
```

1. It will download and install the precise64 virtual image, and then boot the system.  After booting, it will update the package lists, and then install `curl`.
1. After it's booted, log into the vagrant box by:
```bash
host:~/tango$ vagrant ssh
```

1. At last, we can **Add Adorno to your Tango with Django:**
```bash
vagrant:~$ curl -s https://raw.github.com/swiftarrow/Adorno/master/adorno.sh | bash
```

1. The Adorno script needs to run twice.  The first run installs some dependencies and drops you back to the host.  SSH back into vagrant and run the script again:
```bash
host:~/tango$ vagrant ssh
vagrant:~$ curl -s https://raw.github.com/swiftarrow/Adorno/master/adorno.sh | bash
```

1. Go over the output from the adorno command just to make sure that everything went through well.  
If there were no errors, your good to go!  
Adorno drops you into the folder `vagrant:/vagrant/`, which is actually the same as your project directory, `host:~/tango`

1. Now it's time to start a virtual environment for our project:
```bash
vagrant:/vagrant$ mkvirtualenv tangodjango
```

1. Continue with the Tango with Django instructions found here:
http://www.tangowithdjango.com/book/chapters/requirements.html
  1. Install Django (section 2.2.4):
```bash
(tangodjango)vagrant:/vagrant$ pip install -U Django==1.5.4
```

  1. Install the Python Imaging Library (section 2.2.5):
```bash
(tangodjango)vagrant:/vagrant$ pip install pil
```

  1. Install other Python Packages that you need (section 2.2.6):
```bash
(tangodjango)vagrant:/vagrant$ pip install package_name
```

  1. Finally, save your Package List.  Note: You should repeat this step again if you install any additional packages via pip.
```bash
(tangodjango)vagrant:/vagrant$ pip freeze > requirements.txt
```

Celebrate!  You have finished setting up the requirements for Tango with Django!  You can continue to follow the tutorial from section 3:
http://www.tangowithdjango.com/book/chapters/setup.html

Since that's quite a bit of work for today, we'll finish up before starting the actual django project.


## RESOLUTIÒN THE EASY WAY:

1. First exit the vagrant box:
```bash
(tangodjango)vagrant:/vagrant$ exit
```

1. Suspend the vagrant box:
 ```bash
host:~/tango$ vagrant suspend
```

## RESOLUTIÒN THE LONG WAY:

1. First de-activate the virtual environment:
```bash
(tangodjango)vagrant:/vagrant$ deactivate
```

1. Exit the vagrant box:
```bash
vagrant:/vagrant$ exit
```

1. Shut down the vagrant box:
```bash
host:~/tango$ halt
```

## TANGO STEPS:

***Note: this is a sample workflow, assuming that you are on a *nix based host computer.  For windows based computers, the exact commands may vary slightly.***

The best way to do this is have three terminal windows, each open to `~/tango`.  On two of them, log into the vagrant box.  Use one of these for runserver, and the other for file operations.  Use the third window for file operations on the host system.  For the following, we're labelling these three windows T1, T2, and T3.

1. T1 Start the vagrant box that we've already prepared:
```bash
host:~/tango$ vagrant up
```

1. T1 & T2 Log into the vagrant box:
```bash
host:~/tango$ vagrant ssh
```

1. T1 & T2 Go to your project directory:
```bash
vagrant:~$ cd /vagrant
```

1. T1 & T2 Enter the virtual environment:
```bash
vagrant:/vagrant$ workon tangodjango
```

1. T1 If you haven't already, start a Django project:
```bash
(tangodjango)vagrant:/vagrant$ django-admin.py startproject rango-project
```

1. T1 & T2 Enter the project directory:
```bash
(tangodjango)vagrant:/vagrant$ cd rango-project
```

Now you're all set.  Use your editor on your host machine to edit the files as you need.  
They are in the folder `~/tango/rango-project`
Start django apps as necessary.  Make or delete files as you need.

1. T1 Finally, come to the live test (note the IP and port specifier are important!)
```bash
(tangodjango)vagrant:/vagrant/rango-project$ python manage.py runserver 0.0.0.0:8888
```

1. On your host machine, open a browser and go to 127.0.0.1:8888 to admire your project!


## TO THE BIG STAGE:

**Note: Heroku is a pretty awesome service, which allows us to run our apps live online, for free!  To use it, we use Git to push our code to Heroku.  All of these commands are done on the host machine (in the third terminal window, if you followed the Dance Steps above).**

1. Setup Heroku:

```bash
host:~/tango$ heroku login
```

Follow the instructions, generate an SSH key if necessary.

I recommend that you follow the first two lessons of Getting Started With Django to learn how to set your code up to deploy to Heroku and run locally at the same time.
Alternatively, you can use the instructions at https://devcenter.heroku.com/articles/getting-started-with-django to set up your Django program for Heroku.

1. Setup Git:
```bash
host:~/tango$ git init
```

1. Add the files to Git:
```bash
host:~/tango$ git add .
```

1. Commit the first version to Git:
   ```bash
 host:~/tango$ git commit -am "The first Commit!"
```

1. Create a Heroku instance:
```bash
host:~/tango$ heroku create
```

1. Deploy to Heroku:
```bash
host:~/tango$ git push heroku master
```

1. The last command will give you a URL where you can see your code running live!  Check it out:
```bash
host:~/tango$ heroku open
```

## TANGO ON AND ON:

1. Open a file, make some changes, save it.
1. Check that Git has it marked for inclusion:
```bash
host:~/tango$ git status
```

1. Add files as necessary (see Git documentation for help).
1. Finally, commit all the necessary changes and write a short Commit Message:
```bash
host:~/tango$ git commit -am "Commit Message"
```

1. Run your webapp on your own system as above, or on Heroku:
```bash
host:~/tango$ git push heroku master
host:~/tango$ heroku open
```

## OTRA VEZ:

For added credit, create your own repository on GitHub and push your code to that!