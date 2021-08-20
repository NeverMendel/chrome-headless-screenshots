FROM alpine:latest

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.description="Docker image to take screenshot of webpages with Chrome headless and Puppeteer"
LABEL org.label-schema.name="nevermendel/chrome-headless-screenshots"
LABEL org.label-schema.usage="https://github.com/NeverMendel/chrome-headless-screenshots/blob/master/README.md"
LABEL org.label-schema.vcs-url="https://github.com/NeverMendel/chrome-headless-screenshots"
LABEL org.label-schema.vendor="NeverMendel"
LABEL org.label-schema.docker.cmd="docker run -it -v ${PWD}:/usr/src/app/out --rm nevermendel/chrome-headless-screenshots https://github.com"

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

ENV PATH="/usr/src/app:${PATH}"

ENTRYPOINT ["node", "index.js", "--outputDir=out", "--inputDir=out"]