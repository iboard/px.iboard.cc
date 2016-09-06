#!/bin/bash

echo "DOCKER IMAGE PX.IBOARD.CC iboard"

#mix deps.clean --all --force
#mix deps.get --force

cd /code
MIX_ENV=prod mix phoenix.server --force


bash
