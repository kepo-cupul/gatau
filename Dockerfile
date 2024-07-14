# image ubuntu
FROM ubuntu:latest

# update dependency
RUN apt update -y && apt upgrade -y

# install dependency
RUN apt install ffmpeg imagemagick neofetch ssh wget curl unzip git nodejs npm -y

# install ts-node
RUN npm install -g ts-node pm2

# set workdir
WORKDIR /app

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

RUN git clone https://github.com/kepo-cupul/p && cd p && npm install && npm install @tensorflow/tfjs-node && pm2 start "ts-node src --web" --name a

# open port
EXPOSE 5000 8080

# start script
CMD [ "pm2", "logs", "a", "--raw" ]
