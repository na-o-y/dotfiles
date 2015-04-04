set fish_dir $HOME/.config/fish
set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
set -x LESS '-R'
set prompt_user "(๑❛ᴗ❛๑)"

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# topcoder
if test -e $HOME/topcoder/lib/template.cpp
  function templ
    cp $HOME/topcoder/lib/template.cpp $argv
  end
end

if type g++-4.9 > /dev/null
  function g++
    g++-4.9 -std=c++1y $argv
  end
end
