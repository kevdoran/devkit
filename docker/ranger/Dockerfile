FROM maven:3.5.3-jdk-8

LABEL maintainer-twitter="@kevdoran"
LABEL version=1.0.0

ARG RANGER_VERSION=1.1.0

ARG SOURCE_REPO=https://github.com/apache/ranger.git
ARG SOURCE_BRANCH=release-ranger-${RANGER_VERSION}

ADD https://jdbc.postgresql.org/download/postgresql-42.2.1.jar /opt

COPY entrypoint.sh /opt
RUN chmod +x /opt/entrypoint.sh

WORKDIR /opt

# install build deps
RUN apt-get -q update && apt-get install -y -q python gcc

# clone repo
RUN git clone ${SOURCE_REPO} ranger

# Build 
RUN cd ranger && git checkout ${SOURCE_BRANCH} \
 && mvn package assembly:assembly -DskipTests \
 && cp target/ranger-${RANGER_VERSION}-admin.tar.gz /opt \
 && cd /opt \
 && tar zxvf ranger-${RANGER_VERSION}-admin.tar.gz

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ENV RANGER_HOME=/opt/ranger-${RANGER_VERSION}-admin

COPY install.properties ${RANGER_HOME}

EXPOSE 6080

ENTRYPOINT ["/opt/entrypoint.sh"]
