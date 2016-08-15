FROM java:8-alpine
ENV SONAR_VERSION=5.6.1 \
    SONARQUBE_HOME=/opt/sonarqube \
    # Database configuration
    # Defaults to using H2
    SONARQUBE_JDBC_USERNAME=sonar \
    SONARQUBE_JDBC_PASSWORD=sonar \
    SONARQUBE_JDBC_URL= \
    SONARQUBE_HTTP_PROXY_HOST= \
    SONARQUBE_HTTP_PROXY_PORT= \
    SONARQUBE_HTTPS_PROXY_HOST= \
    SONARQUBE_HTTPS_PROXY_PORT=

COPY run.sh /usr/local/bin/
COPY prepare.sh /usr/local/bin
RUN /usr/local/bin/prepare.sh

# Http port
EXPOSE 9000

VOLUME ["$SONARQUBE_HOME/data", "$SONARQUBE_HOME/extensions"]
WORKDIR $SONARQUBE_HOME
CMD ["run.sh"]
