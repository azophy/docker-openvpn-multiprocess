FROM dperson/openvpn-client

# setup supervisord, tini, tmux
RUN apk update\
 && apk add --no-cache --no-progress supervisor tini tmux\
 && mkdir -p /etc/supervisor/conf.d \
 && mkdir -p /etc/supervisor/custom.conf.d

RUN apk add --no-cache --no-progress php7 php7-pdo_odbc php7-pdo_mysql php7-pdo_sqlite php7-pdo_pgsql
RUN apk add --no-cache --no-progress php7-session
RUN apk add --no-cache --no-progress php7-curl

COPY ./scripts/supervisord.conf /etc/supervisor/
COPY ./scripts/services/* /etc/supervisor/conf.d/

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

