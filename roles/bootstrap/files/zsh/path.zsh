if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -d "$HOME/bin" ]; then
  path+=("$HOME/bin")
fi

if [ -d "$HOME/.local/bin" ]; then
  path+=("$HOME/.local/bin")
fi

if [ -d "$HOME/.tmux/tmuxifier/bin" ]; then
  path+=("$HOME/.tmux/tmuxifier/bin")
fi