#!/bin/sh

if [ -f /usr/bin/xmodmap ]; then
  /usr/bin/xmodmap ${XDG_CONFIG_HOME}/runcom/Xmodmap/*
else
  echo "${0}: xmodmap missing"
fi