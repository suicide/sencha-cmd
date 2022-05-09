ARG version=7.2.0.84

FROM devvault/senchacmd:${version}

RUN chmod -R 777 /opt/Sencha/Cmd/
