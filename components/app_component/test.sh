#!/bin/bash

exit_code=0

echo "*** Running app_component engine specs"
cp ../../config/liqpay.yml spec/dummy/config/liqpay.yml
bundle install | grep Installing
bundle exec rspec spec
exit_code+=$?

exit $exit_code
