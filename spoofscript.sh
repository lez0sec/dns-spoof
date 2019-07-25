spoofdns() {  
  # CONSTANTS #
  RED='\033[0;31m'
  NC='\033[0m' # No Color
  # /CONSTANTS #

	local image_name=dns_spoof
	if ! docker image inspect "$image_name" >/dev/null 2>&1; then {
		echo "The image $image_name does not exist. Build it with:"
		echo "docker build -t $image_name <path to the full path containing the Dockerfile>"
		#exit 1
    return
	}
	fi
  if [[ -z $1 ]]; then {
  	echo -e "Usage: \n spoofdns <ip to bind to> [path to spoofed_hosts]"
    echo " spoofdns <ip to bind to> (defaults to ./spoof.hosts)"
  	#exit 1
    return  
  }
  else {
    local local_ip="$1"
  }
  fi  
  local spoofed_hosts
  [[ -z $2 ]] && spoofed_hosts="`pwd`/spoof.hosts" || spoofed_hosts=`realpath $2`; printf "Reading spoofed hosts from ${RED}`realpath ./spoof.hosts`${NC}"

	docker run --rm -it -p $local_ip:53:53/tcp -p $local_ip:53:53/udp -v "$spoofed_hosts:/tmp/spoof.hosts" --cap-add=NET_ADMIN "$image_name"
}
