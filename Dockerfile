FROM ubuntu:15.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y vim curl
RUN mkdir /docker

RUN curl -fsSL https://get.docker.com/ | sh

COPY bin/docker /docker/

COPY bin/docker-containerd /docker/
COPY bin/docker-containerd-ctr /docker/
COPY bin/docker-containerd-shim /docker/
COPY bin/dockerd /docker/
COPY bin/docker-runc /docker/

ENV PATH=/docker:$PATH

ENTRYPOINT [ "/docker/dockerd" ]
CMD [ "-H", "0.0.0.0:2375", "-H", "unix:///var/run/docker.sock" ]
