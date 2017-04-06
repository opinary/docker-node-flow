FROM node:7.8.0

RUN apt-get update -qq && \
    apt-get install -y -qq ocaml libelf-dev
