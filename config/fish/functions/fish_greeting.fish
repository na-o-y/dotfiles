function fish_greeting
  set_color cc9999
  set greetings $fish_dir/greetings/*.txt
  cat $greetings[(math (random)%(count $greetings)+1)]
  set_color normal
end
