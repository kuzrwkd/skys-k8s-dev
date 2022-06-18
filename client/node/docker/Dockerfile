FROM node:16.10-slim

WORKDIR /var/www

COPY entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/entrypoint.sh \
    && npm install -g npm \
    && npm install -g pm2 \
    && npm install -g ts-node \
    && npm install -g npm-check-updates

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
