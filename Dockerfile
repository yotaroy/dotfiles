FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    zsh \
    git \
    curl

ARG UID=1001
ARG GID=1001
RUN useradd -u $UID -o -m test-user
RUN groupmod -g $GID -o test-user

USER test-user

WORKDIR /home/test-user

RUN touch .zshrc && \
    mkdir dotfiles

CMD ["/bin/zsh"]
