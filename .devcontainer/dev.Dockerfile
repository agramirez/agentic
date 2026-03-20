FROM debian:13.3

RUN apt update && apt upgrade -y

# install basic tools
RUN apt install -y curl
RUN apt install -y wget
RUN apt install -y git
RUN apt install -y libclang-dev clang

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

ENV REBAR_DIR=/usr/local/rebar3
RUN wget https://s3.amazonaws.com/rebar3/rebar3 -P $REBAR_DIR \
    && chmod +rx $REBAR_DIR/rebar3 \
    && ln -s $REBAR_DIR/rebar3 /usr/local/bin

# install llama.cpp
ENV LLAMA_VERSION=llama-b8393
ENV LLAMA_DIR=/usr/local/llama.cpp
RUN wget https://github.com/ggml-org/llama.cpp/releases/download/b8393/$LLAMA_VERSION-bin-ubuntu-x64.tar.gz -P $LLAMA_DIR \
    && tar -xzf $LLAMA_DIR/$LLAMA_VERSION-bin-ubuntu-x64.tar.gz -C /usr/local/llama.cpp
ENV PATH="$PATH:"$LLAMA_DIR/$LLAMA_VERSION

# install rust
RUN apt install -y build-essential rustup

# install rocq

RUN mkdir /workspace
WORKDIR /workspace

CMD ["sleep","infinity"]