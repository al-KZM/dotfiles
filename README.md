### Installation

```
CONFIG_DIR=$HOME/.config
BRANCH="master"

# For a nvidia vdi, uncomment:
#CONFIG_DIR=/mtrsysgwork/<your_user>/.config 
#BRANCH="nv-vdi"


git clone -b nv-vdi --single-branch https://github.com/x41lakazam/dotfiles $CONFIG_DIR


ln -s $CONFIG_DIR/inputrc $HOME/.inputrc
ln -s $CONFIG_DIR/vim.d/vimrc $HOME/.vimrc
ln -s $CONFIG_DIR/bashrc $HOME/.bashrc
ln -s $CONFIG_DIR/profile $HOME/.profile
ln -s $CONFIG_DIR/bash_profile $HOME/.bash_profile
```

### Installation - local machine specific

On local machine, install the [pass](https://github.com/peff/pass) password managers and add two passwords:

```
# Your computer password
pass insert nvidia/main

# Your gitlab access token
# https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html
pass insert nvidia/gitlab
```

### Installation - zsh specific

```
mkdir $HOME/.caching_files
touch $HOME/.caching_files/.last_dir
ln -s $CONFIG_DIR/zsh/zshrc $HOME/.zshrc
ln -s $CONFIG_DIR/zsh/zprofile $HOME/.zprofile
```

