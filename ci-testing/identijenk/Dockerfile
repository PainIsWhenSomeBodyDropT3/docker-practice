FROM jenkins/jenkins:2.414.3-jdk17

USER root

RUN echo "deb http://archive.debian.org/debian/ stretch main contrib non-free" >/etc/apt/sources.list && \
      echo "deb http://archive.debian.org/debian-security/ stretch/updates main contrib non-free" >>/etc/apt/sources.list && \
      apt-get update && apt-get install -y lsb-release && \
      curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
      https://download.docker.com/linux/debian/gpg && \
      echo "deb [arch=$(dpkg --print-architecture) \
      signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
      https://download.docker.com/linux/debian \
      $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
      apt-get update && apt-get install -y docker-ce-cli && \
      rm -rf /var/lib/apt/lists/*

# RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN curl -L https://github.com/docker/compose/releases/download/1.4.1/ \
docker-compose-$(uname -s)-$(uname -m)> /usr/local/bin/docker-compose; \
    chmod +x /usr/local/bin/docker-compose

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt 
