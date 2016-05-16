Introduction to Docker Tutorial
-------------------------------

1. Get the docker image from the docker registry.   
   `docker pull library/ubuntu:16:04`

2. Run the docker container and try out some commands inside it.  
   `docker run -it ubuntu:16.04 /bin/bash`
   `cat /etc/issue` 

3. Run something more than just the base image (a.k.a dependencies)  
   ``` 
   # Dockerfile
   FROM library/ubuntu:16.04

   # update the existing software 
   RUN apt-get upgrade
   RUN apt-get update

   # install a specific software
   RUN apt-get -y install cowsay
   RUN ln -s /usr/games/cowsay /usr/bin/cowsay
   ``` 
   `docker build -t my-awesome-program:0.0.1 .`  
   `docker images`
   `docker run my-awesome-program:0.0.1 cowsay testing`

4. Make updates and go to the next version
   ``` 
   FROM library/ubuntu:16.04

   # update the existing software 
   RUN apt-get upgrade
   RUN apt-get update

   # install a specific software
   RUN apt-get -y install cowsay
   RUN ln -s /usr/games/cowsay /usr/bin/cowsay

   # install another software
   RUN apt-get -y install fortune-mod
   RUN ln -s /usr/games/fortune /usr/bin/fortune
   CMD fortune | cowsay
   ``` 
   `docker build -t my-awesome-program:0.0.2 .`  
   `docker images`
   `docker run my-awesome-program:0.0.2`

5. Bake your application into the image 
   ``` 
   FROM library/ubuntu:16.04

   # update the existing software 
   RUN apt-get upgrade
   RUN apt-get update
   # install a specific software
   RUN apt-get -y install cowsay
   RUN ln -s /usr/games/cowsay /usr/bin/cowsay

   # install another software
   RUN apt-get -y install fortune-mod
   RUN ln -s /usr/games/fortune /usr/bin/fortune

   # install yet another software
   RUN apt-get -y install nodejs

   # package your app into the image 
   COPY ./my-awesome-app /my-awesome-app

   # Start at the correct directory
   WORKDIR /my-awesome-app

   # Run the app
   CMD nodejs index.js
   ```
   `docker build -t my-awesome-program:0.0.3 .`  
   `docker images`  
   `docker run -it --publish 3000:3000 my-awesome-program:0.0.3`  
