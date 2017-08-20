#!/bin/bash

result=0
key=$1
with_bundle='--with_bundle'
failing_components=''

for test_script in $(find . -name test.sh); do
  pushd `dirname $test_script` > /dev/null

  if [ $key -eq $with_bundle ]; then
    rm Gemfile.lock && bundle install
  fi

  sh ./test.sh

  if [ $? -ne 0 ]; then
    failing_components="$failing_components\\n${PWD##*/}"
    result=1;
  fi

  popd > /dev/null
done

if [ $result -eq 0 ]; then
  echo "SUCCESS"
else
  echo "FAILING COMPONENTS: $failing_components"
fi

exit $result

