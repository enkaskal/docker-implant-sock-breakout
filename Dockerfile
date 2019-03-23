FROM enkaskal/docker-debian

COPY run.sh /
RUN chmod +x /run.sh
CMD ["/bin/bash", "-c", "/run.sh"]
