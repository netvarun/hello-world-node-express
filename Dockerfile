FROM sem3/debian-node

MAINTAINER Sivamani Varun <varun@semantics3.com>

USER root

COPY root /
COPY huptime_0.1-28.gc58db3f_amd64.deb /tmp/

RUN echo 'deb http://ftp.us.debian.org/debian/ testing main contrib non-free' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -t testing libc6 \
    && dpkg -i /tmp/huptime_0.1-28.gc58db3f_amd64.deb \
    && rm /tmp/huptime_0.1-28.gc58db3f_amd64.deb

USER sem3

RUN ls
WORKDIR /home/sem3/services
RUN git clone git@github.com:netvarun/hello-world-node-express.git

COPY run.sh /home/sem3/services/hello-world-node-express/

WORKDIR /home/sem3/services/hello-world-node-express
RUN npm install && ls -ltrh

ENTRYPOINT huptime --exec node /home/sem3/services/hello-world-node-express/app.js
#ENTRYPOINT node app.js
#ENTRYPOINT huptime bash run.sh

#ENTRYPOINT git pull && \
#    npm install && \
#    node /home/sem3/services/hello-world-node-express/app.js

#USER root
#ENTRYPOINT ["/usr/bin/s6-svscan","/etc/s6"]
#CMD []

EXPOSE 3000
