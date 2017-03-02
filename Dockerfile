FROM ruby:2.4.0

RUN apt-get update -yqq \
  && apt-get install -yqq build-essential \
  && apt-get install -y --no-install-recommends apt-utils \
  && apt-get install -y libxml2-dev libxslt1-dev \ # for nokogiri

RUN apt-get install -y nodejs

ENV APP_HOME /listvytsia

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ADD components/*/*.gemspec $APP_HOME
ADD Gemfile* $APP_HOME

RUN bundle config git.allow_insecure true
RUN bundle install

ADD . $APP_HOME

EXPOSE 3000

CMD rails server -b 0.0.0.0
