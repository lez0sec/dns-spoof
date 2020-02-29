## Description
Docker container to start a quick&dirty DHCP server with dnsmasq (DNS disabled)

## Relevant Docker cheatsheet

If you don't use Docker too often and tend to forget the commands, these can come in quite handy.

Build docker file locally:

```bash
docker build -t dhcp-host .
docker run --rm -it -v "`pwd`/append.conf:/tmp/append.config:ro" --net=host --cap-add=NET_ADMIN dhcp-host
```

NET-ADMIN permissions are required to allow dnsmasq to return the DHCP response.

Build image from Docker Hub:
```bash
docker pull lez0sec/dnsmasq-dhcp
```

Run container:
You need to pass it a config file that will append to what is already configured in dnsmasq.conf:
```bash
docker run --rm -it -v "`pwd`/append.conf:/tmp/append.config:ro" --net=host --cap-add=NET_ADMIN lez0sec/dnsmasq-dhcp
```
