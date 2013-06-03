#!/bin/sh

export MANPAGER="less -X"
export PATH=${HOME}/bin:${PATH}
export REPOSITORY_ROOT=${HOME}/repositories
export LESSCHARSET=utf-8
# Silence beeps
setterm -blength 0