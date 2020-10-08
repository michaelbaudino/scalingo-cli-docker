FROM alpine:latest

LABEL maintainer="Michael Baudino <michael@baudi.no>"

ENV DISABLE_UPDATE_CHECKER=true

RUN apk add --update-cache --no-cache \
      libc6-compat \
      su-exec \
 && version=$(wget -qO- https://cli-dl.scalingo.com/version | tr -d ' \t\n') \
 && wget -qO- "https://github.com/Scalingo/cli/releases/download/${version}/scalingo_${version}_linux_amd64.tar.gz" \
    | tar x -zOf- "scalingo_${version}_linux_amd64/scalingo" > /usr/local/bin/scalingo \
 && chmod +x /usr/local/bin/scalingo

COPY entrypoint.sh /usr/local/bin

ENTRYPOINT ["entrypoint.sh", "scalingo"]
CMD ["help"]
