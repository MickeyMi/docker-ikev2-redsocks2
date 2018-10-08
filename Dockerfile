FROM ubuntu:14.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install strongswan iptables uuid-runtime libevent-dev  \
    && rm -rf /var/lib/apt/lists/* # cache busted 20160406.1

RUN rm /etc/ipsec.secrets

ADD ./etc/* /etc/
ADD ./bin/* /usr/bin/

VOLUME /etc

# http://blogs.technet.com/b/rrasblog/archive/2006/06/14/which-ports-to-unblock-for-vpn-traffic-to-pass-through.aspx
EXPOSE 500/udp 4500/udp

RUN ["chmod", "+x", "/usr/bin/redsocks2"]
RUN ["chmod", "+x", "/usr/bin/start-vpn"]

CMD /usr/bin/start-vpn
