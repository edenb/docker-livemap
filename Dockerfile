FROM alpine AS build-stage
WORKDIR /home
RUN apk --no-cache add curl

# Get latest version of the Livemap app
# --strip 1 removes the container folder
RUN curl -sSL https://github.com/edenb/livemap/tarball/master | tar -xvz --strip 1

# production stage
FROM alpine
RUN addgroup -S user && adduser -S user -G user
USER user
WORKDIR /
COPY --chown=user:user --from=build-stage /home/staticlayers/* ./staticlayers/
COPY --chown=user:user --from=build-stage /home/tracks/*.gpx ./tracks/

CMD ["/bin/true"]
