#!/bin/bash

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    #not connected
    echo "not connected"
else
    #connected
    echo "connected"
fi
