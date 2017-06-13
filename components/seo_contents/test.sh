#!/bin/bash

exit_code=0

echo "*** Running seo_contents engine specs"
bundle install | grep Installing
bundle exec rspec spec
exit_code+=$?

exit $exit_code
