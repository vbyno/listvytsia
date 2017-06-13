#!/bin/bash

result=0
key=$1
with_bundle='--with_bundle'

for test_script in $(find ./components/ -name test.sh); do
  pushd `dirname $test_script` > /dev/null

  if [ "$key" -eq $with_bundle ]; then
    rm Gemfile.lock && bundle install
  fi

  sh ./test.sh
  result+=$?
  popd > /dev/null
done

if [ $result -ne 0 ]; then
  echo "FAILURE"
  exit $result
fi

if [ $result -eq 0 ]; then
  echo "SUCCESS"
else
  echo "FAILURE"
fi

exit $result
