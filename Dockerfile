FROM debian:stable-slim
LABEL maintainer "Fernando Fernández (ferferga): ferferga@hotmail.com"
LABEL org.opencontainers.image.source https://github.com/ferferga/selfhosted-mail-forwarding

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends postfix > /dev/null && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY ./scripts/*.sh /scripts/
RUN chmod +x /scripts/*.sh && /scripts/postunpack.sh && rm -rf /scripts/postunpack.sh

EXPOSE 25
ENTRYPOINT [ "/scripts/entrypoint.sh" ]
CMD [ "/scripts/run.sh" ]
