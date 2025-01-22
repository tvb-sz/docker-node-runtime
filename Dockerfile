# define node version args
# Be used to base Image need before FROM
# if args used after FROM, should repeat define
ARG nodeVersion='18.8.0'

FROM node:${nodeVersion}-alpine

LABEL Maintainer="team tvb sz<nmg-sz@tvb.com>" Description="Node 18.8.0 base on alpine, and install some libaray."

RUN set -x \
  && apk update \
  && apk upgrade \
  && apk add --no-cache \
  curl \
  ffmpeg \
  tzdata \
  ttf-dejavu \
  fontconfig \
  bash \
  dumb-init \
  udev \
  ttf-freefont \
  chromium \
  # Cleanup
  && rm -rf /usr/include \
  && rm -rf /var/cache/apk/* /root/.node-gyp /usr/share/man /tmp/* \
  && echo

# install headless puppeteer
RUN npm install puppeteer-core@19.2.2 -g
