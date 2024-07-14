# image ubuntu
FROM ubuntu:latest

# update dependency
RUN apt update -y && apt upgrade -y

# install dependency
RUN apt install ffmpeg imagemagick neofetch ssh wget curl unzip nodejs npm -y

# install ts-node
RUN npm install -g ts-node

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
ENTRYPOINT [ "./entrypoint.sh" ]

# open port
EXPOSE 5000 8080

# start script
CMD [ "pm2", "logs", "a", "--raw" ]
