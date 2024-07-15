# image ubuntu
FROM ubuntu:latest

# update dependency
RUN apt update -y && apt upgrade -y

# Install Dependency
RUN apt install ffmpeg imagemagick neofetch ssh wget curl unzip git nodejs npm -y

# Install Speedtest
RUN wget https://install.speedtest.net/app/cli/ookla-speedtest-1.1.1-linux-x86_64.tgz && tar zxvf ookla-speedtest-1.1.1-linux-x86_64.tgz && mv speedtest /usr/bin
  
# Install Ngrok
RUN wget -O ngrok.tgz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz" && tar -zxvf ngrok.tgz && mv ngrok /usr/bin

# Install Google Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && dpkg -i google-chrome-stable_current_amd64.deb || apt install -f -y

# Install ts-node pm2
RUN npm install -g ts-node pm2

# create user 
RUN useradd -m abilek

# set user
USER abilek

# set env
ENV USER=abilek
ENV HOME=/home/abilek

# set workdir
WORKDIR /home/abilek/a

# configure ssh
# RUN echo '/usr/sbin/sshd -D' >>/1.sh
# RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
# RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
# RUN echo root:${Password}|chpasswd
# RUN service ssh start

# copy entrypoint
COPY entrypoint.sh .

# give access entrypoint
RUN chmod +x entrypoint.sh

# run entrypoint
# ENTRYPOINT [ "./entrypoint.sh" ]

# clone and install script
RUN git clone https://github.com/kepo-cupul/p a
RUN cp -r a /home/abilek
RUN npm install && npm install @tensorflow/tfjs-node

# setup pm2
RUN pm2 link ou2c2wzupr0xt7x t3c17yzsxsswad2

# open port
EXPOSE 5000 8080

# start script
CMD pm2-runtime "ts-node src --web" --name a
