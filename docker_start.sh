#!/bin/bash

echo "DOCKER IMAGE PX.IBOARD.CC iboard"

mix deps.get --force
mix phoenix.server


