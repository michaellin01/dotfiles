# nvim

1. Clone repo into ~/.config/nvim
2.
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
3. Open up neovim and run :PlugInstall
4. export NVIM_QT_PATH='/path/to/nvim-qt.exe'

### Setting up visual debugger (https://github.com/puremourning/vimspector)
1. cd ~/.vim/plugged/vimspector
2. :VimspectorInstall OR ./install_gadget.py [appropriate_flag]
3. ~/.vim/plugged/vimspector/configurations/linux/[filetype]
https://reposhub.com/python/command-line-tools/puremourning-vimspector.html#debug-adapter-configuration
https://puremourning.github.io/vimspector/configuration.html#debug-configurations


Link for setting up nvim-qt executable: https://blog.matejc.com/blogs/myblog/neovim-wsl-and-nix
