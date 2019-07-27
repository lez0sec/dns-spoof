
# CONSTANTS #
RED='\033[0;31m'
NC='\033[0m' # No Color
image_name=lez0sec/dnsmasq
# /CONSTANTS #

usage() {
    echo -e "Usage: \n spoofdns <ip to bind to> [path to spoofed_hosts]"
    exit 1
}

if ! docker image inspect "$image_name" >/dev/null 2>&1; then {
  echo "The image $image_name does not exist. Build it with:"
  echo "docker build -t $image_name <path to the full path containing the Dockerfile>"
  exit 1
  #return
}
fi

[[ -z $1 ]] && usage || local_ip="$1"
[[ -z $2 ]] && usage || spoofed_hosts=`realpath $2`; printf "Reading spoofed hosts from ${RED}$spoofed_hosts${NC}\n"

docker run --rm -it -p $local_ip:53:53/tcp -p $local_ip:53:53/udp  -v "$spoofed_hosts:/etc/dnsmasq.d/wildcards:ro" --cap-add=NET_ADMIN "$image_name"

