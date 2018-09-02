FROM node:latest 

ADD ./package.json package.json
RUN npm install -g bower
RUN npm install

ADD ./bower.json bower.json
RUN bower install --allow-root

ADD ./lib lib
ADD ./views views
ADD ./app.js app.js
ADD ./config.js config.js
ADD ./idp-public-cert.pem idp-public-cert.pem
ADD ./idp-private-key.pem idp-private-key.pem
ADD ./public public

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
