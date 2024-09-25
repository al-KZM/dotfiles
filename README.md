### Installation

```
CONFIG_DIR=$HOME/.config
BRANCH="master"

# For a nvidia vdi, uncomment:
#CONFIG_DIR=/mtrsysgwork/<your_user>/.config
#BRANCH="nv-vdi"

# Requirements
brew install universal-ctags
pip3 install neovim
pip install neovim

# Clone my config
git clone -b nv-vdi --single-branch https://github.com/x41lakazam/dotfiles $CONFIG_DIR

# Create symlinks
ln -s $CONFIG_DIR/inputrc $HOME/.inputrc
ln -s $CONFIG_DIR/vim.d/vimrc $HOME/.vimrc
ln -s $CONFIG_DIR/bashrc $HOME/.bashrc
ln -s $CONFIG_DIR/profile $HOME/.profile
ln -s $CONFIG_DIR/bash_profile $HOME/.bash_profile
ln -s $CONFIG_DIR/teamocil $HOME/.teamocil


bash /mtrsysgwork/eshukrun/.config/scripts/yum_user_install.sh neovim.x86_64
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

### Installation - VDI specific

```
sudo dnf upgrade --refresh && \
	sudo dnf install neovim python3-neovim

pip install pynvim
```
