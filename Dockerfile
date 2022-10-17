ARG SENCHA_VER=7.2.0.84
ARG JDK8_IMAGE=eclipse-temurin:8u345-b01-jre-focal@sha256:9b9e3cd9f18cda3ad2745ef1f6aaf8fe78071cb6e9272a03b73d9cf2ff91b4ce

FROM ${JDK8_IMAGE}

ARG SENCHA_VER

# Install Sencha CMD
RUN apt-get update && \
  apt-get install -y wget unzip && \
  apt-get clean && \
  wget -nv http://cdn.sencha.com/cmd/${SENCHA_VER}/no-jre/SenchaCmd-${SENCHA_VER}-linux-amd64.sh.zip -O sencha_install.sh.zip && \
  export QT_QPA_PLATFORM=offscreen && \
  unzip -p sencha_install.sh.zip > sencha_install.sh && \
  chmod +x sencha_install.sh && \
  mkdir -p /opt/Sencha/Cmd/${SENCHA_VER} && \
  ./sencha_install.sh -q -Dall=true -dir "/opt/Sencha/Cmd/${SENCHA_VER}" && \
  ln -s /opt/Sencha/Cmd/${SENCHA_VER}/sencha /usr/bin/sencha && \
  install -m 777 -d /opt/Sencha/Cmd/repo && \
  rm /opt/Sencha/Cmd/${SENCHA_VER}/.install4j/installation.log /opt/Sencha/Cmd/${SENCHA_VER}/.install4j/install.prop && \
  rm -rf sencha_* && \
  rm -rf /var/log/apt /var/log/dpkg.log /var/cache/ldconfig/aux-cache ||:


# Example: Copy sencha install into your image
# COPY --from=Sencha /opt/Sencha /opt/Sencha
# RUN ln -s /opt/Sencha/Cmd/${SENCHA_VER}/sencha /usr/bin/sencha
# RUN chmod -R 777 /opt/Sencha/Cmd/
