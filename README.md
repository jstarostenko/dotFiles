This is a copy of Julia's dotfiles. Running `home/linker.sh` creates new symlinks in the `$HOME` folder for all files and folders in `/home`. Files and folders that you wish to symlink must start with a `.` Usage:


``` sh
cd ~
git clone git@github.com:jstarostenko/dotFiles.git
cd dotFiles
sh linker.sh
```

Once `linker.sh` is run, you'll see output that looks like:

``` sh
-e ~/.inputrc does not exist. Symlinking to dotfile.
-e ~/.irbrc is symlinked to your dotfiles.
-e ~/.tmux-mac.conf is symlinked to your dotfiles.
```
