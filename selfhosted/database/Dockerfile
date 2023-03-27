FROM postgres:15

ADD scripts/1_init.sh /docker-entrypoint-initdb.d
ADD scripts/2_miniflux.sh /docker-entrypoint-initdb.d

EXPOSE 5432
