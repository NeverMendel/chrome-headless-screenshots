FROM alpine:3.14.3

# Installs latest Chromium package.
RUN apk add --no-cache \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
      nodejs \
      yarn

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