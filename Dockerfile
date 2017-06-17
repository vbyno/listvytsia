FROM ruby:2.4.0

RUN apt-get update -yqq \
  && apt-get install -yqq build-essential \
  && apt-get install -yqq apt-utils

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

RUN apt-get install -y nodejs
RUN npm install npm -g
RUN npm install -g @angular/cli

ENV APP_HOME /listvytsia

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ADD components/core/core.gemspec                   components/core/core.gemspec
ADD components/chunks/chunks.gemspec               components/chunks/chunks.gemspec
ADD components/generators/generators.gemspec       components/generators/generators.gemspec
ADD components/hotels/hotels.gemspec               components/hotels/hotels.gemspec
ADD components/pictures/pictures.gemspec           components/pictures/pictures.gemspec
ADD components/seo_contents/seo_contents.gemspec   components/seo_contents/seo_contents.gemspec
ADD components/app_component/app_component.gemspec components/app_component/app_component.gemspec
ADD Gemfile* $APP_HOME/

RUN bundle config git.allow_insecure true \
  && bundle install

ADD . $APP_HOME/

EXPOSE 3000

CMD rails server -b 0.0.0.0
