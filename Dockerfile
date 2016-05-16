FROM library/ubuntu:16.04

# update the existing software 
RUN apt-get upgrade
RUN apt-get update

# install and configure a specific software
RUN apt-get -y install cowsay
RUN ln -s /usr/games/cowsay /usr/bin/cowsay

# install and configure another software
RUN apt-get -y install fortune-mod
RUN ln -s /usr/games/fortune /usr/bin/fortune

# moar softwares
RUN apt-get -y install nodejs
RUN apt-get -y install npm

# package your app into the image 
COPY ./my-awesome-app /my-awesome-app

# Start at the correct directory
WORKDIR /my-awesome-app

# Install application dependencies
RUN npm install

# Run the app
CMD nodejs index.js
