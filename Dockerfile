FROM debian

RUN apt-get update
RUN apt-get install -y fio
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y gnuplot
RUN git clone https://github.com/douglasAtJoyent/fioTest


