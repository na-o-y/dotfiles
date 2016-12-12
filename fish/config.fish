set fish_dir $HOME/.config/fish
set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
set -x LESS '-R'
set prompt_user "(๑❛ᴗ❛๑)"

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# pyenv
set PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/shims $PATH
pyenv rehash

# ndenv
set NDENV_ROOT $HOME/.ndenv
set -x PATH $NDENV_ROOT/bin $NDENV_ROOT/shims $PATH
ndenv rehash 2>/dev/null

# Topcoder
if test -e $HOME/topcoder/lib/template.cpp
  function templ
    cp $HOME/topcoder/lib/template.cpp $argv
  end
end

if type g++-6 > /dev/null
  function g++
    g++-6 -std=c++14 $argv
  end
end

# set -x DOCKER_HOST tcp://192.168.59.103:2376
# set -x DOCKER_CERT_PATH /Users/200117/.boot2docker/certs/boot2docker-vm
# set -x DOCKER_TLS_VERIFY 1
set -x ANSIBLE_NOCOWS 1
set -U fish_user_paths $fish_user_paths /Users/200117/google-cloud-sdk/bin/

# cabal
set -x PATH $HOME/.cabal/bin $PATH

set -x PATH $HOME/scripts $PATH
