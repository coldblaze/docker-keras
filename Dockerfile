FROM ubuntu:latest

LABEL maintainer="https://github.com/coldblaze"

RUN apt-get update -qq -y \
 && apt-get install -qq -y openssh-server \
 && echo 'root:root'|chpasswd \
 && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
 && sed -ri 's/^#?X11Forwarding\s+.*/X11Forwarding yes/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?X11DisplayOffset\s+.*/X11DisplayOffset 10/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?X11UseLocalhost\s+.*/X11UseLocalhost no/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?PrintMotd\s+.*/PrintMotd no/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?PrintLastLog\s+.*/PrintLastLog yes/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?TCPKeepAlive\s+.*/TCPKeepAlive yes/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?ClientAliveInterval\s+.*/ClientAliveInterval 30/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?ClientAliveCountMax\s+.*/ClientAliveCountMax 60/' /etc/ssh/sshd_config \
 && apt-get install -qq -y \
    net-tools \
    iputils-ping \
    xorg openbox \
    libgl1-mesa-glx \
    dbus-x11 \
    python3 \
    python3-pip \ 
    python3-graphviz \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip3 install --upgrade --no-cache-dir pip \
 && pip install --no-cache-dir ipython[notebook] \
    numpy \
    scipy \
    scikit-learn \
    matplotlib \
    pandas \
    pandas_datareader \
    h5py \
    pydot \
    opencv-python opencv-contrib-python \
    pillow \
    seaborn \
    theano \
    tensorflow \
    keras \
    Flask 
ENTRYPOINT service ssh restart && cd /notebook && jupyter notebook --ip=0.0.0.0 --allow-root 
WORKDIR /notebook
