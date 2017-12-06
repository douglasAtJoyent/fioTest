FROM debian

RUN apt-get update
RUN apt-get install -y fio
RUN apt-get install -y vim
RUN apt-get install -y git
RUN git clone https://github.com/douglasAtJoyent/fioTest


