#!/bin/bash

IS_RUNNING=$(docker ps | grep "linux:latest")

if [ "${1}" ]; then

  if [ -z "${IS_RUNNING}" ]; then
    docker run --rm --mount type=bind,source=/Users/joewarrenmeeks,target=/home/joewarrenmeeks --name linux -it linux:latest /bin/start.sh ${PWD} ${PWD}/${1}
  else 
    docker exec -it linux /bin/start.sh ${PWD} ${PWD}/${1}
  fi

else

  if [ -z "${IS_RUNNING}" ]; then
    docker run --rm --mount type=bind,source=/Users/joewarrenmeeks,target=/home/joewarrenmeeks --name linux -it linux:latest /bin/start.sh ${PWD}
  else
    docker exec -it linux /bin/start.sh ${PWD}
  fi

fi
