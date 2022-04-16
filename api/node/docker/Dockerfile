FROM node:16.3-slim

WORKDIR /var/www

RUN apt-get update \
    && apt-get install -y \
    curl \
    unzip \
    libssl-dev \
    procps

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

COPY entrypoint.sh /usr/local/bin

COPY wait-for-it.sh /usr/local/bin

RUN chmod +x /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/wait-for-it.sh \
    && npm install -g npm \
    && npm install -g pm2 \
    && npm install -g ts-node \
    && npm install -g npm-check-updates \
    && npm install -g @nestjs/cli

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
