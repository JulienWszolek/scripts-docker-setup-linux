
Easy docker setup for Linux
------------

If you use **docker** every day, this script is made for you. It allows you to install **docker** and **docker-compose** for **Linux OS**.

**WIP:** This is a work in progress project, working only on Debian 9.



Running script
------------

Download or copy the script to run it. Use sudo if you aren’t root.

```chmod +x script-docker.sh```

```./script-docker.sh```



Docker script
-------------

To quickly install docker and docker-compose, use **script-docker.sh**.

Included: 

* Upgrade of your system.
* Installation of docker and docker-compose.



Deployer script
-------------

To quickly install all what you need for deployment integration, use **script-docker-deploy.sh**.

Included: 

* Upgrade of your system.
* Installation of docker and docker-compose.
* Adding deployer user.
* Creation of ssh keys, located in ```/home/deployer/.ssh/id_rsa.pub```.
* Adding the created public key in ```/home/deployer/.ssh/known_hosts```.


This configuration allows you to create an automatic deploy for your project, thanks to the private and public key in ```~/.ssh``` folder. You can access to the documentation here : [GitLab](https://docs.gitlab.com/ce/ci/environments.html) | [GitHub](https://circleci.com/docs/2.0/deployment-integrations/)



To Do
-------------

* Add compatibility with other OS, like Ubuntu.
* Make proposals!
