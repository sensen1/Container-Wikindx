#!/bin/bash

if [ -z ${WIKINDX_FPM_URL} ]; then 
    echo "required parameter WIKINDX_FPM_URL missing"
    exit 255
fi

sed -i s/\<WIKINDX_FPM\>/${WIKINDX_FPM_URL}/ /etc/nginx/http.d/default.conf

nginx