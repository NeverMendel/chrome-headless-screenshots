FROM alpine:3.17.3

# Installs latest Chromium package.
RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
      nodejs \
      yarn

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Copy current directory to /usr/src/app
ADD . /usr/src/app

# Install dependencies
WORKDIR /usr/src/app
RUN yarn install

# Create output directory
RUN mkdir -p /usr/src/app/out

RUN chmod +x take-screenshot.sh
RUN chmod +x entrypoint.sh

ENV PATH="/usr/src/app:${PATH}"

ENTRYPOINT ["entrypoint.sh"]