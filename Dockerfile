FROM alpine:latest

LABEL maintainer="Michael Baudino <michael@baudi.no>"

RUN curl -sL https://cli-dl.scalingo.io/install | bash
