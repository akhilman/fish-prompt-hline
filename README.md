# fish-prompt-hline

Fish re-implementation of the Adam2 shell prompt from zsh

![Screenshot](screenshot.png)

## Installation

### [Fisherman](https://github.com/fisherman/fisherman)

    fisher add akhilman/fish-prompt-hline

Then restart fish or call `source ~/.config/fish/conf.d/prompt_hline_init.fish`

## Configuration

Choose a colorscheme with
[`fish_config`](https://fishshell.com/docs/current/cmds/fish_config.html).

If you do not like the horizontal line color generated from the username and hostname change it with:

```fish
set -U fish_color_hline RRGGBB
```

See `man set_color` for more options.

Unset colors for user and host to allow prompt to generate them for you:

```fish
set -eU fish_color_user
set -eU fish_color_host
```

Unset cwd color to generate it:

```fish
set -eU fish_color_cwd
```

Set colours of the right prompt:

```fish
set -U fish_color_duration blue
set -U fish_color_njobs green
set -U fish_color_status --background red white
set -U fish_color_time white
set -U fish_color_vcs yellow
set -U fish_color_venv magenta
```
