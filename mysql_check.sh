#!/bin/bash
# Check to see if MySQL is running if not start it

RES=$(/usr/bin/mysqladmin status)
logger "MySQL status $RES"
RES=$(/usr/bin/mysqladmin ping)
logger "MySQL Returned $RES"

if [[ ! "$RES" =~ "mysqld is alive" ]]
then
    logger "Attempting to start stopped MySQL Server"
    /usr/sbin/service mysql start
fi
