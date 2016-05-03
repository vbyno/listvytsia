#!/bin/bash

exit_code=0

echo "*** Running billable_metrics engine specs"
cp ../../config/database.yml spec/internal/config/database.yml
bundle install | grep Installing
bundle exec rspec spec
exit_code+=$?

exit $exit_code
