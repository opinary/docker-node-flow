FROM node:7.8.0

ENV CLOUD_SDK_REPO="cloud-sdk-jessie"

# …

RUN apt-get update && apt-get install apt-transport-https

# gcloud for deployment

RUN echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && apt-get -y -qq install google-cloud-sdk

# awscli for deployment

RUN apt-get install -y -qq awscli && aws configure set default.s3.signature_version s3v4

# flow

RUN apt-get install -y -qq ocaml libelf-dev

# xvfb for nightmare

RUN apt-get install -y \
  xvfb \
  x11-xkb-utils \
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-scalable \
  xfonts-cyrillic \
  x11-apps \
  clang \
  libdbus-1-dev \
  libgtk2.0-dev \
  libnotify-dev \
  libgnome-keyring-dev \
  libgconf2-dev \
  libasound2-dev \
  libcap-dev \
  libcups2-dev \
  libxtst-dev \
  libxss1 \
  libnss3-dev \
  gcc-multilib \
  g++-multilib
