FROM sonarqube:latest
MAINTAINER Philipp Klautke "philipp.klautke@makonis.de"

# create plugin download location; so we can copy them later when SonarQube is started
ENV PLUGIN_DOWNLOAD_LOCATION /opt/plugins-download
RUN mkdir -p $PLUGIN_DOWNLOAD_LOCATION
WORKDIR ${PLUGIN_DOWNLOAD_LOCATION}

# download plugins from:
RUN wget https://sonarsource.bintray.com/Distribution/sonar-csharp-plugin/sonar-csharp-plugin-6.4.1.3596.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-3.2.0.5506.jar
RUN wget https://github.com/kalidasya/sonar-css-plugin/releases/download/3.1/sonar-css-plugin-3.1.jar

COPY docker-entrypoint.sh /opt/docker-entrypoint.sh
RUN chmod +x /opt/docker-entrypoint.sh

WORKDIR ${SONARQUBE_HOME}
ENTRYPOINT ["/opt/docker-entrypoint.sh"]
