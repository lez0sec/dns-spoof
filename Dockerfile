FROM alpine:edge
# Install dnsmasq
RUN apk update \
	&& apk --no-cache add dnsmasq

EXPOSE 67/udp 547/udp

COPY ./dnsmasq.conf /etc/dnsmasq.conf
ENTRYPOINT ["dnsmasq", "--no-daemon", "--conf-file=/etc/dnsmasq.conf"]
