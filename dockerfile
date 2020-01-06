ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

ADD package.json /

RUN apk add --no-cache nodejs-npm jq && \
npm install

# Copy data for add-on
COPY run.sh /
COPY index.js /
COPY config.js /

# Directly run index.js
RUN chmod a+x /index.js
CMD [ "/index.js" ]


#TODO: Enable this and troubleshoot why enet IP (192.168.2.3) (?) cannot be pinged.
# Alternative executing run.sh:
#RUN chmod a+x /run.sh
#CMD [ "/run.sh" ]
