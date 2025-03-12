#!/bin/bash
set -e

cd /workspace/apps/tdesktop/Telegram/
./configure.sh "$@"
cmake --build ../out --config "${CONFIG:-Release}" --parallel
