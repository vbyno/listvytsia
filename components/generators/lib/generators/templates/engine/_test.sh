#!/bin/bash

exit_code=0

echo "*** Running <%= name %> engine specs"
bundle install | grep Installing
rake app:db::migrate
bundle exec rspec spec
exit_code+=$?

exit $exit_code
