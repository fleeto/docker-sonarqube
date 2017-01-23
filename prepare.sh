#!/bin/sh
set -xe
apk add --no-cache gnupg unzip curl
mkdir -p /usr/share
cd /usr/share
curl -o sonarqube.zip -fSL \
  https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip
curl -o sonarqube.zip.asc -fSL \
  https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip.asc
unzip sonarqube.zip
mv sonarqube-$SONAR_VERSION sonarqube
rm sonarqube.zip*
rm -rf $SONARQUBE_HOME/bin/*
