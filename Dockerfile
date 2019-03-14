FROM debian:latest
LABEL maintainer="enkaskal"

COPY build.sh /
COPY run.sh /
RUN chmod +x build.sh && /build.sh && chmod +x /run.sh
CMD ["/bin/bash", "-c", "/run.sh"]
