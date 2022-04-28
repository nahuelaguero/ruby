FROM ruby:3.1.2-alpine3.14 AS base

ENV APP_PATH /opt/app
ENV APP_GROUP app
ENV APP_USER app
ENV RAILS_MAX_THREADS 5
ENV RUBYOPT '-W:no-deprecated'
ARG APP_GROUP_ID=1000
ARG APP_USER_ID=1000

# Install dependencies:
# - build-base: To ensure certain gems can be compiled
# - libxslt-dev libxml2-dev: Nokogiri native dependencies
# - libmysqlclient-dev: to ensure MySQL connection
# - tzdata
RUN apk update \
  && apk add --update \
    build-base \
    libxslt-dev \
    libxml2-dev \
    mysql-dev \
    nodejs \
    npm \
    tzdata \
    libstdc++ \
    libx11 \
    libxrender \
    libxext \
    openssl \
    libssl1.1 \
    ca-certificates \
    fontconfig \
    freetype \
    ttf-dejavu \
    ttf-droid \
    ttf-freefont \
    ttf-liberation \
    # ttf-ubuntu-font-family \
	su-exec \
    curl \
  && apk add --update --no-cache --virtual .build-deps

RUN apk upgrade && rm -rf /var/cache/apk/*

RUN npm install --global yarn

RUN mkdir -p ${APP_PATH} \
    && addgroup -g ${APP_GROUP_ID} -S ${APP_GROUP} \
    && adduser -u ${APP_USER_ID} -S ${APP_USER} -G ${APP_GROUP} \
    && chown -R ${APP_USER}:${APP_GROUP} ${APP_PATH}

WORKDIR ${APP_PATH}

EXPOSE 3000

USER ${APP_USER}

COPY --chown=${APP_USER}:${APP_GROUP} ./Gemfile* ./
COPY --chown=${APP_USER}:${APP_GROUP} yarn.lock .
COPY --chown=${APP_USER}:${APP_GROUP} package.json .

RUN gem install bundler --version=2.3.12

# Development stage
FROM base AS dev

USER ${APP_USER}

COPY --chown=${APP_USER}:${APP_GROUP} ./ ./

RUN bundle install \
    && yarn install

CMD ["bundle", "exec", "rails", "server", "-b 0.0.0.0"]
