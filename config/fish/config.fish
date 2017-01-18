set fish_dir $HOME/.config/fish
set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
set -x LESS '-R'
set prompt_user "(๑❛ᴗ❛๑)ｶｲﾊﾂ"

# rbenv
if test -d $HOME/.rbenv
  set -x PATH $HOME/.rbenv/bin $PATH
  set -x PATH $HOME/.rbenv/shims $PATH
  rbenv rehash >/dev/null ^&1
end

# pyenv
if test -d $HOME/.pyenv
  set PYENV_ROOT $HOME/.pyenv
  set -x PATH $PYENV_ROOT/shims $PATH
  pyenv rehash
end

# ndenv
if test -d $HOME/.ndenv
  set NDENV_ROOT $HOME/.ndenv
  set -x PATH $NDENV_ROOT/bin $NDENV_ROOT/shims $PATH
  ndenv rehash 2>/dev/null
end

# Topcoder
if test -e $HOME/topcoder/lib/template.cpp
  function templ
    cp $HOME/topcoder/lib/template.cpp $argv
  end
end

set -x ANSIBLE_NOCOWS 1

# cabal
if test -d $HOME/.cabal/bin
  set -x PATH $HOME/.cabal/bin $PATH
end

set -x PATH $HOME/scripts $PATH
alias vim='nvim'
