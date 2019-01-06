FROM debian:stretch-slim
MAINTAINER yansongda <me@yansongda.cn>

WORKDIR /www

RUN apt-get update && apt-get install -y git curl gnupg \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y nodejs yarn \
  && rm -rf /var/lib/apt/lists/* \

COPY sources.list /etc/apt/sources.list
