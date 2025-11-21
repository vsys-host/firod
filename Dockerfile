FROM ubuntu:noble

RUN apt update -y && apt install curl -y

WORKDIR /shkeeper

COPY ./walletnotify.sh .

ARG FIRO_VERSION=0.14.15.0
ARG FIRO_PASSWORD=shkeeper
ARG FIRO_USERNAME=shkeeper

RUN chmod +x walletnotify.sh \
    && curl -L https://downloads.sourceforge.net/project/firoorg/firo-${FIRO_VERSION}-linux64.tar.gz -o firo.tar.gz \
    && tar -xzvf firo.tar.gz \
    && cp firo-*/bin/firod firo-*/bin/firo-cli . \
    && rm -rf firo.tar.gz firo-*

CMD /shkeeper/firod \
    -prune=1550 \
    -rpcpassword=$FIRO_PASSWORD \
    -rpcuser=$FIRO_USERNAME \
    -rpcbind=0.0.0.0 \
    -rpcallowip=0.0.0.0/0 \
    -wallet=shkeeper \
    -walletnotify='/shkeeper/walletnotify.sh %s'
