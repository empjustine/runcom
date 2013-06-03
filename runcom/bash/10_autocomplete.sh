#!/bin/bash

if [ -f "/usr/share/git/completion/git-completion.bash" ]; then
  . /usr/share/git/completion/git-completion.bash
else
  echo "git-completion.bash not fould"
fi
