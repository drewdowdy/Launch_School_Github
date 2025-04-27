#!/bin/bash

function server () {
  while true
  do
    read method path version
    if [[ $method = 'GET' ]]
    then
      echo 'HTTP/1.1 200 OK'
    else
      echo 'HTTP/1.1 400 Bad Request'
    fi
  done
}

coproc SERVER_PROCESS { server; }

while true
do
  netcat -lvp 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}
done

# GET ./www/file_name