#!/usr/bin/env bash

rm -rf dist

babel -d dist "test/maybe-test.js"

if [[ $1 == "cover" ]]; then
  # Instrumenting the src file.
  babel -d dist "./source/maybe.js" --plugins __coverage__
else
  babel -d dist "./source/maybe.js"
fi

for i in $( find ./source -type f ); do
  cp $i ./dist/$i.flow
done
