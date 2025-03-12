#!/bin/bash

set -e
FullExecPath=$PWD
pushd `dirname $0` > /dev/null
FullScriptPath=`pwd`
popd > /dev/null


cd $FullScriptPath/../docker/centos_env
poetry install
poetry run gen_dockerfile | DOCKER_BUILDKIT=1 docker build \
  --build-arg HTTP_PROXY=http://10.109.246.210:9890 \
  --build-arg HTTPS_PROXY=http://10.109.246.210:9890 \
  -t tdesktop:centos_env -
cd $FullExecPath
