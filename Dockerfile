FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install python -y

COPY ./hello.txt /root/hello.txt

ENTRYPOINT cat ~/hello.txt
