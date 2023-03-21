FROM dperson/openvpn-client

# setup supervisord, tini, tmux
RUN apk update\
 && apk add --no-cache --no-progress supervisor tini tmux\
 && mkdir -p /etc/supervisor/conf.d

COPY ./scripts/supervisord.conf /etc/supervisor/
COPY ./scripts/openvpn.conf /etc/supervisor/conf.d/
COPY ./scripts/entrypoint.sh /usr/bin/

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/entrypoint.sh"]

