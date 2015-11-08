#!/bin/bash
set -e

if [ $# -ne 1 ]; then
        echo "Usage: $(basename "$0") [image tag]" >/dev/stderr
        #exit 1
        echo "Using Github tag" >/dev/stdout
        tag=$( curl --silent -I https://github.com/skynetservices/skydns/releases/latest -o- | grep -e "Location" | sed 's/\s\+//g' | rev | cut -d'/' -f1 | rev )
else
        tag=$1
fi

#tgt=$(mktemp -d)

#dir=$(pwd -P)
dir=$( cd -P "$(dirname $0)" && pwd )

if [[ ! -d $dir/skydns ]]; then 
        mkdir -p $dir/skydns
fi

docker run --rm -v $dir/skydns/:/tmp/bin/ -v $dir/bootstrap:/go/bootstrap -t quay.io/tangfeixiong/ubuntu-14-04-3:golang-1.5.1 /go/bootstrap "github.com/skynetservices/skydns"

docker build -t quay.io/tangfeixiong/skydns:${tag} $dir/skydns

