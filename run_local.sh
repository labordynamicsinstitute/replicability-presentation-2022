#!/bin/bash
PWD=$(pwd)
repo=${PWD##*/}
dockerspace=larsvilhuber

case $USER in
  vilhuber|larsvilhuber)
  #WORKSPACE=$HOME/Workspace/git
  WORKSPACE=$PWD
  ;;
  codespace)
  WORKSPACE=/workspaces
  ;;
esac
  
# build the docker if necessary

BUILD=no
arg1=$1

docker pull $dockerspace/$repo 
if [[ $? == 1 ]]
then
  ## maybe it's local only
  docker image inspect $dockerspace/$repo > /dev/null
  [[ $? == 0 ]] && BUILD=no || BUILD=yes
fi
# override
[[ "$arg1" == "force" ]] && BUILD=yes

if [[ "$BUILD" == "yes" ]]; then
DOCKER_BUILDKIT=1 docker build . -t $dockerspace/$repo
nohup docker push $dockerspace/$repo &
fi

docker run -it\
 -v $WORKSPACE:/project \
 -w /project \
 --rm \
  $dockerspace/$repo ./_build.sh
