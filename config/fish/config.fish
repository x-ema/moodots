if status is-interactive
  set fish_greeting

  function fish_right_prompt
      mommy -1 -s $status
  end

  #Aliases to make life easy :)
  alias l='eza -lh  --icons=auto' # long list
  alias ls='eza -1   --icons=auto' # short list
  alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
  alias ld='eza -lhD --icons=auto' # long list dirs
  alias lt='eza --icons=auto --tree' # list folder as tree
  alias tree='eza --icons --tree'

  # Handy change dir shortcuts
  abbr .. 'cd ..'
  abbr ... 'cd ../..'
  abbr .3 'cd ../../..'
  abbr .4 'cd ../../../..'
  abbr .5 'cd ../../../../..'

  if test "$TERM" = "xterm-kitty"
    alias ssh "kitten ssh"
  end

  # For Yazi
  function y
	  set tmp (mktemp -t "yazi-cwd.XXXXXX")
	  command yazi $argv --cwd-file="$tmp"
	  if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		  builtin cd -- "$cwd"
	  end
	  command rm -f -- "$tmp"
  end

  # Always mkdir a path (this doesn't inhibit functionality to make a single dir)
  abbr mkdir 'mkdir -p'

  # Use starship
  starship init fish | source
end
