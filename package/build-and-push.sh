#!/bin/bash

ARCH=${ARCH:?"ARCH not set"}
SUFFIX=""
[ "${ARCH}" != "amd64" ] && SUFFIX="${ARCH}"
ACCT=${ACCT:-rancher}

if [ "${ARCH}" != "amd64" ] .; then
    docker build -f Dockerfile.${SUFFIX} -t $ACCT/rke-cert-deployer:0.1.1-${SUFFIX} .
else
    docker build -t $ACCT/rke-cert-deployer:0.1.1 .
fi

docker push $ACCT/rke-cert-deployer:0.1.1-${SUFFIX}
