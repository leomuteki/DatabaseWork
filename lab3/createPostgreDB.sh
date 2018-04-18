#! /bin/bash
echo "creating db named ... myDB"
createdb -h localhost -p $PGPORT myDB
pg_ctl status
