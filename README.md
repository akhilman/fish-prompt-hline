# fish-prompt-hline
Fish re-implementation of the Adam2 shell prompt from zsh

![Screenshot](screenshot.png)


Installation
------------

### [Fisherman](https://github.com/fisherman/fisherman)

    fisher add akhilman/fish-prompt-hline

Then restart fish or call `$ . ~/.config/fish/conf.d/prompt_hline_init.fish`


Configuration
-------------

The colors for the host and user names are generated from the host
and user names respectively.  Use the
[`fish_config`](https://fishshell.com/docs/current/cmds/fish_config.html)
to change the colors.
Or do:
```
set -U fish_color_host blue
set -U fish_color_user -o white
```
See man color for more info.
