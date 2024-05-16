### Installation 

```
ln -s $HOME/.config/inputrc ../.inputrc   
```

### Installation - local machine specific (OSX)

On local machine, install the [pass](https://github.com/peff/pass) password managers and add two passwords:

```
# Your computer password
pass insert nvidia/main

# Your gitlab access token
# https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html
pass insert nvidia/gitlab
```

Add this launch agent to automatically mount the remote directory to your computer
Edit the file and replace the path to the .scpt script so that it point to your config (you cannot use $HOME) there
``` 
ln -s $HOME/.config/nvidia/mount_nvidia_rd.plist ~/Library/LaunchAgents/mount_nvidia_rd.plist
launchctl load -w ~/Library/LaunchAgents/mount_nvidia_rd.plist  
launchctl enable gui/$(id -u "${USER}")/mount-nvidia-rd.job     # Make it persistent
```


### Installation - zsh specific

```
mkdir $HOME/.caching_files
touch $HOME/.caching_files/.last_dir
ln -s $HOME/.config/zsh/zshrc $HOME/.zshrc
```
