# nvim
My personalised neovim configuration.

## Setup

### Install dependencies
vim-plug, fzf and ripgrep

#### vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

#### fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

#### ripgrep
```
sudo apt-get install ripgrep
```
or
```
brew install ripgrep
```

### Config
```
git clone https://github.com/joshmlamb/nvim.git ~/.config/nvim
```
Open up neovim and run:
```
:PlugInstall
```
