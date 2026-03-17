FROM debian:13.3

RUN apt update && apt upgrade -y
RUN 

RUN mkdir /workspace
WORKDIR /workspace

CMD ["sleep","infinity"]