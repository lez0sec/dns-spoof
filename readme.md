## Description
Docker container to make DNS spoofing with dnsmasq hassle free

## Relevant Docker cheatsheet

If you don't use Docker too often and tend to forget the commands, these can come in quite handy.

Build docker file locally:

```bash
docker build -t "dns_spoof" /path/to/directory/containing/dockerfile
```

Build image from Docker Hub:
```bash
docker pull lez0sec/dnsmasq
```

Run container:
```bash
docker run --rm -it -p <ip_to_bind_to>:53:53/tcp -p <ip_to_bind_to>:53:53/udp -v "`pwd`/spoof.hosts:/tmp/spoof.hosts" --cap-add=NET_ADMIN dns_spoof
```

Alternatively you can use the wrapper script ```spoofscript.sh``` to run the container.

## Some notes
In order to disable the existing local name resolution service (although you don't really need this unless you want to bind to localhost):
sudo systemctl stop systemd-resolved.service	
