
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# default colors
set -qU fish_color_user; or set -U fish_color_user -o green
set -qU fish_color_host; or set -U fish_color_host -o cyan
set -qU fish_color_njobs; or set -U fish_color_njobs green
set -qU fish_color_status; or set -U fish_color_status red
set -qU fish_color_duration; or set -U fish_color_duration blue
set -qU fish_color_time; or set -U fish_color_time white
set -qU fish_color_vcs; or set -U fish_color_vcs yellow
set -qU fish_color_venv; or set -U fish_color_venv magenta
set -qU fish_color_cwd_root; or set -U fish_color_cwd_root red
set -qU fish_color_cwd; or set -U fish_color_cwd green

# repaint
function __fish_repaint_status --on-variable fish_color_status
    if status --is-interactive
        commandline -f repaint ^/dev/null
    end
end
function __fish_repaint_duration --on-variable fish_color_duration
    if status --is-interactive
        commandline -f repaint ^/dev/null
    end
end
function __fish_repaint_time --on-variable fish_color_time
    if status --is-interactive
        commandline -f repaint ^/dev/null
    end
end
function __fish_repaint_vcs --on-variable fish_color_vcs
    if status --is-interactive
        commandline -f repaint ^/dev/null
    end
end
function __fish_repaint_venv --on-variable fish_color_venv
    if status --is-interactive
        commandline -f repaint ^/dev/null
    end
end
function __fish_repaint_user --on-variable fish_color_user
    if status --is-interactive
        echo (fish_hline_prompt)
        commandline -f repaint ^/dev/null
    end
end
function __fish_repaint_host --on-variable fish_color_host
    if status --is-interactive
        echo (fish_hline_prompt)
        commandline -f repaint ^/dev/null
    end
end
function __fish_repaint_cwd_root --on-variable fish_color_cwd_root
    if status --is-interactive
        echo (fish_hline_prompt)
        commandline -f repaint ^/dev/null
    end
end
function __fish_repaint_cwd --on-variable fish_color_cwd
    if status --is-interactive
        echo (fish_hline_prompt)
        commandline -f repaint ^/dev/null
    end
end
function __fish_repaint_bind_mode --on-variable fish_key_bindings
    if status --is-interactive
        commandline -f repaint ^/dev/null
    end
end

# drawing hline
function __fish_hline_prompt_preprompt --on-event fish_prompt
    echo (fish_hline_prompt)
end
