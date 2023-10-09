# need root user for package installation
FROM jenkins/jenkins
USER root

ENV SH_DOCKER=/tmp/get-docker.sh
ARG GID

RUN curl -fsSL https://get.docker.com/ -o ${SH_DOCKER}
RUN chmod 744 ${SH_DOCKER} && sh ${SH_DOCKER}
RUN rm ${SH_DOCKER}
RUN groupmod --gid ${GID} docker
RUN usermod --append --group docker jenkins

USER jenkins
