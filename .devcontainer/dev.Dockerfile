FROM debian:13.3

RUN apt update && apt upgrade -y

# install basic tools
RUN apt install -y curl
RUN apt install -y wget
RUN apt install -y git

# install erlang v27.3 and compatible elp version
ARG ELP_VERSION=elp-linux-x86_64-unknown-linux-gnu-otp-27.3
ENV ELP_URL=https://github.com/WhatsApp/erlang-language-platform/releases/download/2026-02-27
ENV ELP_DIR=/usr/local/elp

RUN apt install -y erlang=1:27.3.4.1+dfsg-1+deb13u1
RUN mkdir $ELP_DIR \
    && wget $ELP_URL/$ELP_VERSION.tar.gz -P $ELP_DIR \
    && tar -xzf $ELP_DIR/$ELP_VERSION.tar.gz -C $ELP_DIR \
    && chmod +rx $ELP_DIR/elp \
    && ln -s $ELP_DIR/elp /usr/local/bin

RUN wget https://s3.amazonaws.com/rebar3/rebar3 -P /usr/local/rebar3 \
    && chmod +rx /usr/local/rebar3/rebar3
    && ln -s /usr/local/rebar3 

# install llama.cpp
# install rust
# install rocq

RUN mkdir /workspace
WORKDIR /workspace

CMD ["sleep","infinity"]