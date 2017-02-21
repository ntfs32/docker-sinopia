FROM node
MAINTAINER shaddock_hu <hushuang123a@gamil.com>
RUN adduser --disabled-password --gecos "" sinopia
RUN mkdir -p /opt/sinopia/storage
WORKDIR /opt/sinopia
RUN chown -R sinopia:sinopia /opt/sinopia
USER sinopia
ADD /config.yaml /opt/sinopia/config.yaml
ADD /package.json /opt/sinopia/package.json
ADD /samman.yaml /opt/sinopia/samman.yaml
RUN npm install  --registry=https://registry.npm.taobao.org
ADD /sinopia-samman /opt/sinopia/node_modules/sinopia/sinopia-samman
#ADD tar zxcf samman.tar.gz -C /opt/sinopia/node_modules/sinopia/
WORKDIR /opt/sinopia/node_modules/sinopia
RUN npm install /opt/sinopia/node_modules/sinopia/sinopia-samman --registry=https://registry.npm.taobao.org
ADD /start.sh /opt/sinopia/start.sh
CMD ["/opt/sinopia/start.sh"]
EXPOSE 4873
VOLUME /opt/sinopia
