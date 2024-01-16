#!/bin/bash

if [ -z ${WIKINDX_DB_HOST} ]; then
    echo "required parameter WIKINDX_DB_HOST missing" 
    exit 255
fi

if [ -z ${WIKINDX_DB} ]; then
    echo "required parameter WIKINDX_DB missing" 
    exit 255
fi

if [ -z ${WIKINDX_DB_USER} ]; then
    echo "required parameter WIKINDX_DB_USER missing" 
    exit 255
fi

if [ -z ${WIKINDX_DB_PASSWORD} ]; then
    echo "required parameter WIKINDX_DB_PASSWORD missing" 
    exit 255
fi


# create the wikindx config file
# shellcheck disable=SC2005
# shellcheck disable=SC2006
echo "`cat <<EOF
<?php
class CONFIG
{
    public \\$WIKINDX_DB_HOST = \"${WIKINDX_DB_HOST}\";
    public \\$WIKINDX_DB = \"${WIKINDX_DB}\";
    public \\$WIKINDX_DB_USER = \"${WIKINDX_DB_USER}\";
    public \\$WIKINDX_DB_PASSWORD = \"${WIKINDX_DB_PASSWORD}\";
    public \\$WIKINDX_MEMORY_LIMIT = \"2024M\";
    public \\$WIKINDX_PATH_AUTO_DETECTION = TRUE;
    public \\$WIKINDX_URL_BASE = \"\";
    public \\$WIKINDX_MAX_EXECUTION_TIMEOUT = 10;
}
EOF
`" >> /var/www/html/config.php;

/usr/sbin/php-fpm82 --nodaemonize --fpm-config /etc/php/8.2/fpm/pool/wikindx_pool.conf