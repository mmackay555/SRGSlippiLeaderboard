#!/bin/bash -l
set -e
DIR_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "/home/ubuntu/SRGSlippiLeaderboard/" 

mkdir -p cron/data
if [ ! -f cron/data/players-new.json ]; then
  echo '[]' >> cron/data/players-new.json
fi
mkdir -p cron/logs
if [ ! -f cron/logs/log.txt ]; then
  touch cron/logs/log.txt
fi

yarn ts-node cron/fetchStats.ts 2>&1 | tee cron/logs/log.txt
yarn run deploy -- -u "mmackay555 <mmackay555@github.com>"
