#!/bin/sh

development_ruby () {
  export PATH="$HOME/.rbenv/bin:$HOME/.gem/ruby/2.0.0/bin:$HOME/.gem/ruby/1.9.1/bin:$PATH"
  eval "$(rbenv init -)"
}

development_python2 () {
  export WORKON_HOME=$HOME/.virtualenvwrapper
  if [ -e /usr/bin/virtualenvwrapper.sh ]; then
    . /usr/bin/virtualenvwrapper.sh
  fi
  workon qi
}

development_nodejs () {
  export PATH=$(npm bin):${PATH}
}

devdev () {
  development_ruby
  development_python2
  development_nodejs
}