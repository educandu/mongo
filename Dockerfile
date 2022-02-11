FROM mongo:5.0.6

RUN echo "rs.initiate({'_id':'educandurs', members: [{'_id':1, 'host':'localhost:27017'}]});" > "/docker-entrypoint-initdb.d/00_init_replicaset.js"

RUN echo "db.getSiblingDB('admin').createUser({ user: 'root', pwd: 'rootpw', roles: [{role: 'readWriteAnyDatabase', db: 'admin' }] })" > "/docker-entrypoint-initdb.d/01_create_user.js"

CMD ["mongod", "--replSet", "educandurs", "--bind_ip_all"]
