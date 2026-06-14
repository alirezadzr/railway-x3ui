FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tehran

# Install essentials
RUN apt-get update && apt-get install -y \
    curl wget git vim nano htop \
    python3 python3-pip \
    php php-cli \
    nginx \
    build-essential \
    unzip zip \
    sudo \
    tzdata \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Node.js 20
RUN apt-get remove -y libnode-dev libnode72 nodejs nodejs-doc npm 2>/dev/null || true \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install ttyd from binary (most reliable way)
RUN curl -Lo /usr/local/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 \
    && chmod +x /usr/local/bin/ttyd

# Install useful global npm packages
RUN npm install -g pm2 serve

# Create working directories
RUN mkdir -p /root/main/arvin

WORKDIR /root/main/arvin

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
