#!/bin/sh

set -e

if [ "${1:0:1}" != '-' ]; then
  exec "$@"
fi

CONF="$SONARQUBE_HOME/conf/sonar.properties"

echo "" >> $CONF
if [ -n "$SONARQUBE_HTTP_PROXY_HOST" ]; then
  echo "http.proxyHost=$SONARQUBE_HTTP_PROXY_HOST" >> $CONF
fi
if [ -n "$SONARQUBE_HTTP_PROXY_PORT" ]; then
  echo "http.proxyPort=$SONARQUBE_HTTP_PROXY_PORT" >> $CONF
fi
if [ -n "$SONARQUBE_HTTPS_PROXY_HOST" ]; then
  echo "https.proxyHost=$SONARQUBE_HTTPS_PROXY_HOST" >> $CONF
fi
if [ -n "$SONARQUBE_HTTPS_PROXY_PORT" ]; then
  echo "https.proxyPort=$SONARQUBE_HTTPS_PROXY_PORT" >> $CONF
fi

exec java -jar $SONARQUBE_HOME/lib/sonar-application-$SONAR_VERSION.jar \
  -Dsonar.log.console=true \
  -Dsonar.jdbc.username="$SONARQUBE_JDBC_USERNAME" \
  -Dsonar.jdbc.password="$SONARQUBE_JDBC_PASSWORD" \
  -Dsonar.jdbc.url="$SONARQUBE_JDBC_URL" \
  -Dsonar.web.javaAdditionalOpts="$SONARQUBE_WEB_JVM_OPTS -Djava.security.egd=file:/dev/./urandom" \
  "$@"
