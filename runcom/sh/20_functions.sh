#!/bin/sh

# Source:
# http://www.etalabs.net/sh_tricks.html

# Shell-quoting arbitrary strings
quote () { printf %s\\n "$1" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/'/"; }

# Does a given string match a given filename (glob) pattern?
fnmatch () { case "$2" in $1) return 0;; esac; return 1; }

# Loops
do_until_fail()    { while [ 1 ]; do $@ || break; done; }
do_until_succeed() { while [ 1 ]; do $@ && break; done; }

# DWIM
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1    ;;
      *.tar.gz)    tar xzf $1    ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       rar x $1      ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1     ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *)           echo "'$1'    cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
