FROM postgres:9.4
MAINTAINER edenb

# Create additional initialization scripts/queries
COPY init-user-db.sh /docker-entrypoint-initdb.d/
