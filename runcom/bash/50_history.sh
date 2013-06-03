#!/bin/bash

# limitless ~/.bash_history
unset HISTFILESIZE

# maximum in-memory history lines (2^32 - 1)
export HISTSIZE=32767

# Make some commands not show up in history
export HISTCONTROL=ignorespace:ignoredups
export HISTIGNORE=""

# Append bash history, instead of overwritting it.
export PROMPT_COMMAND="history -a"
shopt -s histappend
