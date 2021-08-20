#!/bin/bash

if [ $REQUEST_METHOD == "GET1" ]; then
  echo "Status: 200"
  echo "Content-type: text/plain"
  echo
  env | sort

elif [ $REQUEST_METHOD == "GET2" ]; then
  if [ ! -f web.png ]; then
    printf "Status: 404\r\n"
    printf "Content-type: text/plain\r\n"
    printf "\r\n"
    printf "Not Found!"
  else
    echo "Status: 200"
    echo "Content-type: image/png"
    echo
    cat web.png
  fi    

elif [ $REQUEST_METHOD == "GET" ]; then
  env | sort

else

  if [ $HTTP_CONTENT_LENGTH -gt 0 ]; then
    echo "Status: 200"
    echo "Content-type: text/html"
    echo
    echo "Here is the body:"
    #read -n $HTTP_CONTENT_LENGTH body
    #echo $body
    cat
  else
    echo "Status: 200"
    echo "Content-type: text/html"
    echo
    echo "There is no body"
  fi
  
fi
