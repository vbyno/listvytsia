#!/bin/bash

exit_code=0

echo "*** Running Chunks engine specs"
bundle install | grep Installing
rake app:db:purge app:db:migrate app:db:test:prepare
bundle exec rspec spec
exit_code+=$?

exit $exit_code
