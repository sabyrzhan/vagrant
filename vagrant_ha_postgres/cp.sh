#!/bin/bash
target=$1
case $target in
  master)
    cp ./postgresql.conf.master /etc/postgresql/14/main/postgresql.conf
    cp ./pg_hba.conf.master /etc/postgresql/14/main/pg_hba.conf
    ;;
  slave)
    cp ./postgresql.conf.slave /etc/postgresql/14/main/postgresql.conf
    cp ./pg_hba.conf.slave /etc/postgresql/14/main/pg_hba.conf
    ;;
  replicator)
    psql -c "CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'replicator';"
    ;;
  slot)
    psql -c "select * from pg_create_physical_replication_slot('slave1_slot');"
    ;;
  backup)
    pg_basebackup --pgdata /var/lib/postgresql/14/main --format=p \
        --write-recovery-conf --checkpoint=fast --label=mffb --progress \
        --host=pgmaster --port=5432 --username=replicator
    ;;
  hosts)
    echo '192.168.0.11 pgmaster' >> /etc/hosts
    ;;
  *)
    echo 'Invalid target'
    ;;
esac