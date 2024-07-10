# We have own virualenv prompt
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# clear generated color cache
function __fish_repaint_generated_color_hue_offset --on-variable hline_generated_color_hue_offset
    if status --is-interactive
        set -eU __hline_prompnt_generated_colors_cache_keys
        set -eU __hline_prompnt_generated_colors_cache_values
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_generated_color_saturation --on-variable hline_generated_color_saturation
    if status --is-interactive
        set -eU __hline_prompnt_generated_colors_cache_keys
        set -eU __hline_prompnt_generated_colors_cache_values
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_generated_color_value --on-variable hline_generated_color_value
    if status --is-interactive
        set -eU __hline_prompnt_generated_colors_cache_keys
        set -eU __hline_prompnt_generated_colors_cache_values
        commandline -f repaint 2>/dev/null
    end
end

# repaint
function __fish_repaint_generate_cwd --on-variable hline_generate_color_cwd
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_generate_cwd_root --on-variable hline_generate_color_cwd_root
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_generate_hline --on-variable hline_generate_color_hline
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_generate_host --on-variable hline_generate_color_host
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_generate_user --on-variable hline_generate_color_user
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_generate_vcs --on-variable hline_generate_color_vcs
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_generate_venv --on-variable hline_generate_color_venv
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_duration --on-variable fish_color_duration
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_duration --on-variable fish_color_hline
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_duration --on-variable fish_color_njobs
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_status --on-variable fish_color_status
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_time --on-variable fish_color_time
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_vcs --on-variable fish_color_vcs
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_venv --on-variable fish_color_venv
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_user --on-variable fish_color_user
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_host --on-variable fish_color_host
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_cwd_root --on-variable fish_color_cwd_root
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_cwd --on-variable fish_color_cwd
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_bind_mode --on-variable fish_key_bindings
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
