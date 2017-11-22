#!/bin/bash

if [ -n "$(command -v reattach-to-user-namespace)" ]; then
  reattach-to-user-namespace -l $@
else
  exec "$@"
fi
