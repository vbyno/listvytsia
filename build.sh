#!/bin/bash

result=0

cd "$( dirname "${BASH_SOURCE[0]}" )"

for test_script in $(find ./components/ -name test.sh); do
  pushd `dirname $test_script` > /dev/null
  sh ./test.sh
  result+=$?
  popd > /dev/null
done


if [ $result -ne 0 ]; then
  echo "FAILURE"
  exit $result
fi

sh ./test.sh
result+=$?

if [ $result -eq 0 ]; then
  echo "SUCCESS"
else
  echo "FAILURE"
fi

exit $result
