#!/bin/bash

IS_RUNNING=$(docker ps | grep "linux:latest")

if [ -z "${IS_RUNNING}" ]; then
  docker run -d --rm --mount type=bind,source=/Users/joewarrenmeeks,target=/home/joewarrenmeeks \
    --name linux linux:latest tail -f /dev/null
fi

if [ "${1}" ]; then
    for file in ${@}; do
        INITIAL=${file:0:1}

        if [ ${INITIAL} = "~" ] || [ ${INITIAL} = "/" ]; then
            LIST+=" ${file}"
        else
            LIST+=" ${PWD}/${file}"
        fi
    done
    docker exec -it linux /bin/start.sh ${PWD} ${LIST}
else
    docker exec -it linux /bin/start.sh ${PWD} $(mktemp)
fi
