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
WORKDIR /my-awesome-app

CMD nodejs index.js
