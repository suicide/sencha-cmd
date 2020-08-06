ARG version=6.7.0.63

FROM devvault/senchacmd:${version}

RUN chmod -R 777 /opt/Sencha/Cmd/
