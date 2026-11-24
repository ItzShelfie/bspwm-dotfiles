# Startup configuration for interactive fish shells (kitty launches fish).

# Suppress fish's default "Welcome to fish..." message.
set -g fish_greeting ""

# Make ~/Documents/pfetch available as `pfetch` from any directory.
fish_add_path $HOME/Documents/pfetch
fish_add_path $HOME/.local/bin

# Show pfetch as soon as the terminal opens.
if status is-interactive
    pfetch
end
