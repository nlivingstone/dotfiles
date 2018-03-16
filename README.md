
# dotfiles

## Install

There are many ways to go about achieving this. Some prefer to use `cp` or `mv` however doing so will result in the contents of your current dotfiles being discarded. Useful if you're looking to start fresh with something new, not so much if you're curious or just getting started. 

The method outlined below will allow you to use the dotfiles from this repo without discarding the contents of your current dotfiles.

1. Clone repo to a directory of your choosing. This guide assumes the repo is located in `~/dotfiles`
    ```
    git clone git@github.com:nlivingstone/dotfiles.git ~/dotfiles
    ```

2. To utilize the bash_profile found in this repo, add the following to the .bash_profile located in your home directory. _Notice that the file we're sourcing is not prefaced with a "."_
    ```
    source ~/dotfiles/bash_profile
    ```
3. Thats it! 