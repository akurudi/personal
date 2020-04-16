#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e98ac24214142001b804dbf/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e98ac24214142001b804dbf
curl -s -X POST https://api.stackbit.com/project/5e98ac24214142001b804dbf/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e98ac24214142001b804dbf/webhook/build/publish > /dev/null
