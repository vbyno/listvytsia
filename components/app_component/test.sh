#!/bin/bash

exit_code=0

echo "*** Running billable_metrics engine specs"
cp ../../config/liqpay.yml spec/dummy/config/liqpay.yml
bundle install | grep Installing
RAILS_ENV=test bundle exec rake db:create db:migrate
bundle exec rspec spec
exit_code+=$?

exit $exit_code
