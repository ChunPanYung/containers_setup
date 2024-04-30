# podman build --tag ssh-agent-python:latest --file <this_file>
FROM jenkins/ssh-agent:latest
USER root:root

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install --yes python3 python3-pip pipx && \
    apt clean

ENV PATH="/home/jenkins/.local/bin:${PATH}"
USER jenkins:jenkins

RUN pipx ensurepath && \
    pipx install --include-deps ansible && \
    echo "export PATH=${PATH}" >> ~/.bashrc
