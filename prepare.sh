#!/bin/sh
set -xe
apk add --no-cache gnupg unzip curl
gpg --keyserver ha.pool.sks-keyservers.net --recv-keys F1182E81C792928921DBCAB4CFCA4A29D26468DE
mkdir -p /usr/share
cd /usr/share
curl -o sonarqube.zip -fSL https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip
curl -o sonarqube.zip.asc -fSL https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip.asc
gpg --batch --verify sonarqube.zip.asc sonarqube.zip
unzip sonarqube.zip
mv sonarqube-$SONAR_VERSION sonarqube
rm sonarqube.zip*
rm -rf $SONARQUBE_HOME/bin/*
