FROM ubuntu:latest

LABEL maintainer="https://github.com/coldblaze"

RUN apt-get update -qq -y \
 && apt-get install -qq -y \
 && apt-get install -qq -y openssh-server \
 && echo 'root:root'|chpasswd \
 && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
 && sed -ri 's/^#?PrintMotd\s+.*/PrintMotd no/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?PrintLastLog\s+.*/PrintLastLog yes/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?TCPKeepAlive\s+.*/TCPKeepAlive yes/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?ClientAliveInterval\s+.*/ClientAliveInterval 30/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?ClientAliveCountMax\s+.*/ClientAliveCountMax 60/' /etc/ssh/sshd_config \
 && apt-get install -qq -y \
    net-tools \
    iputils-ping \
    python3-graphviz \
    python3-willow \
    python3-seaborn \
    python3-opencv \
    python3-pandas \
    python3-matplotlib \
    python3-sklearn-lib \
    python3-keras \
    python3-ipython \
    python3-notebook \
    python3-flask \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENTRYPOINT service ssh restart && cd /notebook && jupyter notebook --ip=0.0.0.0 --allow-root 
WORKDIR /notebook
