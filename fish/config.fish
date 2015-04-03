set fish_dir $HOME/.config/fish
set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
set -x LESS '-R'
set prompt_user "(๑❛ᴗ❛๑)"

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1
