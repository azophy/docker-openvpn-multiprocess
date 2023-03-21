FROM dperson/openvpn-client

# setup supervisord, tini, tmux
RUN apk update\
 && apk add --no-cache --no-progress supervisor tini tmux\
 && mkdir -p /etc/supervisor/conf.d

COPY ./scripts/supervisord.conf /etc/supervisor/
COPY ./scripts/openvpn.conf /etc/supervisor/conf.d/

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

