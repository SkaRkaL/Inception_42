FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server

COPY ./tools/script.sh /script.sh

RUN chmod +x /script.sh

ENTRYPOINT [ "./script.sh" ]