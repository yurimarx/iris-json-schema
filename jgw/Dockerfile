FROM openjdk:8 AS builder

ARG APP_HOME=/tmp/app

COPY --from=intersystemsdc/jgw:latest /jgw/*.jar $APP_HOME/jgw/

WORKDIR $APP_HOME/jar/
ADD iris-json-schema-1.0.0.jar .


FROM intersystemsdc/jgw:latest

COPY --from=builder /tmp/app/jar/*.jar $GWDIR/
