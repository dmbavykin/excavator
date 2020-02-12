FROM ruby:2.6.3-alpine

RUN apk add bash git openssh httpie libxml2-dev libxslt-dev postgresql-dev \
tzdata yarn nodejs imagemagick make cmake g++ postgresql-client less

ENV APP_USER app
ENV APP_USER_HOME /home/$APP_USER
ENV APP_HOME /home/www/excavator

RUN adduser -D -h $APP_USER_HOME $APP_USER

RUN mkdir /var/www && \
   chown -R $APP_USER:$APP_USER /var/www && \
   chown -R $APP_USER $APP_USER_HOME

WORKDIR $APP_HOME

USER $APP_USER

COPY Gemfile Gemfile.lock .ruby-version ./

RUN gem i bundler -v $(tail -1 Gemfile.lock | tr -d ' ')

RUN bundle check || bundle install

RUN yarn check || yarn install --check-files

COPY . .

USER root

RUN find /home/www/ -not -user $APP_USER -exec chown $APP_USER {} \+

USER $APP_USER

CMD bundle exec puma -C config/puma.rb
