FROM postgres:15

ADD scripts/ /docker-entrypoint-initdb.d

ADD utils/ /utils
RUN chmod -R +x utils/

EXPOSE 5432
