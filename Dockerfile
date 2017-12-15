FROM debian

RUN apt-get update
RUN apt-get install -y fio
RUN apt-get install -y vim
RUN apt-get install -y git
#RUN apt-get install -y gnuplot
RUN git clone https://github.com/douglasAtJoyent/fioTest

RUN echo 'alias fio="fio --output=/fioTest/output/$(date +%s).json --output-format=json" >> ~/.bashrc' 
RUN echo 'alias ll="ls -ltrh" >> ~/.bashrc' 
RUN mkdir -p /fioTest/output
RUN mkdir -p /fioTest/log


