FROM ubuntu:latest

LABEL maintainer="https://github.com/coldblaze"

# Install sshd, Python3, PyGObject and packages for Korean
RUN apt-get update -qq -y \
 && apt-get install -qq -y \
    locales \
    language-pack-ko \
 && locale-gen ko_KR.UTF-8 \
 && update-locale LANG=ko_KR.UTF-8 LC_MESSAGES=POSIX \
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
    python3 python3-pip \
    python3-graphviz \
 && echo "export XMODIFIERS=@im=nabi" >> /root/.bashrc \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip3 install --upgrade pip3
RUN pip3 install ipython[notebook] \
    numpy \
    scipy \
    scikit-learn \
    matplotlib \
    pandas \
    pydot \
    h5py \
    theano \
    tensorflow \
    keras
ENV LANG=ko_KR.UTF-8
ENTRYPOINT service ssh restart && cd /notebook &&jupyter notebook --ip=0.0.0.0 --allow-root 
WORKDIR /notebook