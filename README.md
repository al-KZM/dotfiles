### Installation

```
ln -s $HOME/.config/inputrc $HOME/.inputrc
ln -s $HOME/.config/vim.d/vimrc $HOME/.vimrc
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
ln -s $HOME/.config/zsh/zshrc $HOME/.zshrc
```
