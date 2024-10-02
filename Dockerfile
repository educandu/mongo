FROM mongo:8.0.0

RUN echo "rs.initiate({'_id':'educandurs', members: [{'_id':1, 'host':'localhost:27017'}]});" > "/docker-entrypoint-initdb.d/00_init_replicaset.js"

RUN echo "sleep(1000);" > "/docker-entrypoint-initdb.d/01_wait.js"

RUN echo "db.getSiblingDB('admin').createUser({ user: 'root', pwd: 'rootpw', roles: [{role: 'readWriteAnyDatabase', db: 'admin' }] });" > "/docker-entrypoint-initdb.d/02_create_user.js"

CMD ["mongod", "--replSet", "educandurs", "--bind_ip_all"]
