FROM alpine:edge
# Install dnsmasq
RUN apk update \
	&& apk --no-cache add dnsmasq

COPY ./dnsmasq.conf /etc/dnsmasq.conf
EXPOSE 53 53/udp
ENTRYPOINT ["dnsmasq", "--no-daemon", "--conf-file=/etc/dnsmasq.conf"]
