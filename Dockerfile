FROM ruby:2.4.1

RUN apt-get update -yqq \
  && apt-get install -yqq build-essential \
  && apt-get install -yqq --no-install-recommends apt-utils

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

RUN apt-get install -y nodejs

ENV APP_HOME /listvytsia
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY components/core/core.gemspec                   components/core/core.gemspec
COPY components/chunks/chunks.gemspec               components/chunks/chunks.gemspec
COPY components/generators/generators.gemspec       components/generators/generators.gemspec
COPY components/hotels/hotels.gemspec               components/hotels/hotels.gemspec
COPY components/pictures/pictures.gemspec           components/pictures/pictures.gemspec
COPY components/seo_contents/seo_contents.gemspec   components/seo_contents/seo_contents.gemspec
COPY components/app_component/app_component.gemspec components/app_component/app_component.gemspec
COPY components/calendars/calendars.gemspec         components/calendars/calendars.gemspec
COPY components/micro_groups/micro_groups.gemspec   components/micro_groups/micro_groups.gemspec
COPY components/events/events.gemspec               components/events/events.gemspec
COPY Gemfile* ./

RUN bundle install

COPY . .

EXPOSE 3000
