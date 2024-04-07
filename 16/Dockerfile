FROM bitnami/postgresql:16.2.0-debian-12-r14

ENV PGROONGA_VERSION=3.1.9-1
ENV POSTGRESQL_VERSION=16

USER root

COPY scripts/create_dummy_postgres_package.sh /tmp/create_dummy_postgres_package.sh

# Make the script executable
RUN chmod +x /tmp/create_dummy_postgres_package.sh

RUN \
  apt update && \
  /tmp/create_dummy_postgres_package.sh && \
  apt install -y -V lsb-release wget && \
  wget https://apache.jfrog.io/artifactory/arrow/debian/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb && \
  apt install -y -V ./apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb && \
  rm apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb && \
  wget https://packages.groonga.org/debian/groonga-apt-source-latest-$(lsb_release --codename --short).deb && \
  apt install -y -V ./groonga-apt-source-latest-$(lsb_release --codename --short).deb && \
  rm groonga-apt-source-latest-$(lsb_release --codename --short).deb && \
  apt update && \
  mkdir -p /usr/share/postgresql /usr/lib/postgresql/${POSTGRESQL_VERSION} /usr/include/postgresql /etc/logrotate.d && \
  ln -s /opt/bitnami/postgresql/share /usr/share/postgresql/${POSTGRESQL_VERSION} && \
  ln -s /opt/bitnami/postgresql/lib /usr/lib/postgresql/${POSTGRESQL_VERSION}/lib && \
  ln -s /opt/bitnami/postgresql/include /usr/include/postgresql/${POSTGRESQL_VERSION} && \
  ln -s /etc/logrotate.d /opt/bitnami/postgresql/etc/logrotate.d && \
  apt install -y -V \
    postgresql-${POSTGRESQL_VERSION}-pgdg-pgroonga=${PGROONGA_VERSION} \
    groonga-normalizer-mysql \
    groonga-token-filter-stem \
    groonga-tokenizer-mecab && \
  apt clean && \
  rm -rf /tmp/create_dummy_postgres_package.sh \
  rm -rf /var/lib/apt/lists/*

USER 1001
