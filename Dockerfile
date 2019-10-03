FROM ruby:2.5-alpine

RUN apk update && apk add build-base nodejs yarn

RUN apk add --no-cache build-base sqlite sqlite-dev sqlite-libs

ENV CDEBT_ROOT /var/www/cdebt
RUN mkdir -p $CDEBT_ROOT

WORKDIR $CDEBT_ROOT

COPY . .

# COPY Gemfile Gemfile.lock ./
RUN bundle install

RUN bin/rails db:drop
RUN bin/rails db:create
RUN bin/rails cdebt:build_migrations
RUN bin/rails db:migrate
RUN bin/rails db:seed

LABEL maintainer="Federico Gratti <federicogratti@gmail.com>"

CMD RAILS_ENV=development bin/rails s -p 3000 -b '0.0.0.0'
