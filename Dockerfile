FROM openjdk:8-alpine

ENV SONAR_VERSION=6.5 \
    SONAR_SCANNER_VERSION=2.5.1 \
    SONAE_URL=https://sonarsource.bintray.com/Distribution \
    SONARQUBE_HOME=/opt/sonarqube \
    SONARQUBE_JDBC_USERNAME=sonar \
    SONARQUBE_JDBC_PASSWORD=sonar \
    SONAR_RUNNER_HOME=/opt/sonar-scanner-$SONAR_SCANNER_VERSION \
    PATH=$PATH:/opt/sonar-scanner/bin \
    SONARQUBE_JDBC_URL=

# Http port
EXPOSE 9000

RUN set -x \
    && echo "---> Installing Sonar Qube" \
    && apk add --no-cache gnupg unzip \
    && apk add --no-cache libressl wget \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys F1182E81C792928921DBCAB4CFCA4A29D26468DE \
    && mkdir /opt \
    && cd /opt \
    && wget -O sonarqube.zip --no-verbose $SONAE_URL/sonarqube/sonarqube-$SONAR_VERSION.zip \
    && wget -O sonarqube.zip.asc --no-verbose $SONAE_URL/sonarqube/sonarqube-$SONAR_VERSION.zip.asc \
    && gpg --batch --verify sonarqube.zip.asc sonarqube.zip \
    && unzip sonarqube.zip \
    && mv sonarqube-$SONAR_VERSION sonarqube \
    && rm sonarqube.zip* \
    && rm -rf $SONARQUBE_HOME/bin/* \
    && echo "---> Installing Sonar Scanner" \
    && wget -O sonarscanner.zip --no-verbose $SONAE_URL/sonar-scanner-cli/sonar-scanner-$SONAR_SCANNER_VERSION.zip \
    && unzip sonarscanner.zip \
    && mv sonar-scanner-$SONAR_SCANNER_VERSION sonar-scanner \
    && rm sonarscanner.zip

VOLUME "$SONARQUBE_HOME/data"

WORKDIR $SONARQUBE_HOME

COPY run.sh $SONARQUBE_HOME/bin/

RUN chmod +x ./bin/run.sh

ENTRYPOINT ["./bin/run.sh"]