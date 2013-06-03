#!/bin/sh

# Should trigger only under a getty session
if [ "$0" = "-bash" ]; then
  startx
fi
