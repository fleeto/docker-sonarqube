#!/bin/sh

set -e

if [ "${1:0:1}" != '-' ]; then
  exec "$@"
fi

exec java -jar lib/sonar-application-$SONAR_VERSION.jar \
  -Dsonar.log.console=true \
  -Dsonar.jdbc.username="$SONARQUBE_JDBC_USERNAME" \
  -Dsonar.jdbc.password="$SONARQUBE_JDBC_PASSWORD" \
  -Dsonar.jdbc.url="$SONARQUBE_JDBC_URL" \
  -Dsonar.http.proxyHost="$SONARQUBE_HTTP_PROXY_HOST" \
  -Dsonar.http.proxyPort="$SONARQUBE_HTTP_PROXY_PORT" \
  -Dsonar.https.proxyHost="$SONARQUBE_HTTPS_PROXY_HOST" \
  -Dsonar.https.proxyPort="$SONARQUBE_HTTPS_PROXY_PORT" \  
  -Dsonar.web.javaAdditionalOpts="$SONARQUBE_WEB_JVM_OPTS -Djava.security.egd=file:/dev/./urandom" \
  "$@"
