FROM node:16.10-slim

WORKDIR /var/www

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium

RUN apt-get update \
    && apt-get install -y \
    locales \
    locales-all

RUN update-locale LANG=ja_JP.UTF-8

ENV LANG ja_JP.UTF-8

RUN apt-get update \
    && apt-get install -y \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgcc1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    lsb-release \
    wget \
    xdg-utils \
    procps \
    fonts-ipafont-gothic \
    fonts-ipafont-mincho \
    chromium

# Install AWS CLI

RUN apt-get update \
    && apt-get install -y \
    curl unzip less \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

COPY entrypoint.sh /usr/local/bin

COPY wait-for-it.sh /usr/local/bin

RUN chmod +x /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/wait-for-it.sh \
    && npm install -g npm \
    && npm install -g npm-check-updates

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
