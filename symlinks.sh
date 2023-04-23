# Create directories if do not exist yet
[ -d ~/Library/LaunchAgents ] || mkdir ~/Library/LaunchAgents


# create symlink to keymap configuration
ln -s ~/.dotfiles/keymap.xml ~/Library/LaunchAgents/com.local.KeyRemapping.plist

# create symlink to alacritty  configuration
ln -s ~/.dotfiles/.alacritty.yml ~/.alacritty.yml
