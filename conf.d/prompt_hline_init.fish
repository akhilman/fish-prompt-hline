
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# prompt colors
function generate_color
    echo $argv | sha256sum | tail --bytes +32 | head --bytes 6
end
set -qU fish_color_user; or set -U fish_color_user -o (generate_color (whoami))
set -qU fish_color_host; or set -U fish_color_host -o (generate_color (hostname))
set -qU fish_color_njobs; or set -U fish_color_njobs green
set -qU fish_color_status; or set -U fish_color_status red
set -qU fish_color_duration; or set -U fish_color_duration blue
set -qU fish_color_time; or set -U fish_color_time white
set -qU fish_color_vcs; or set -U fish_color_vcs yellow
set -qU fish_color_venv; or set -U fish_color_venv magenta
set -qU fish_color_cwd_root; or set -U fish_color_cwd_root -o red
set -qU fish_color_cwd; or set -U fish_color_cwd -o green

# rest colors
set -qU fish_color_autosuggestion; or set -U fish_color_autosuggestion 969896
set -qU fish_color_cancel; or set -U fish_color_cancel \x2dr
set -qU fish_color_command; or set -U fish_color_command c397d8
set -qU fish_color_comment; or set -U fish_color_comment e7c547
set -qU fish_color_end; or set -U fish_color_end c397d8
set -qU fish_color_error; or set -U fish_color_error d54e53
set -qU fish_color_escape; or set -U fish_color_escape cyan
set -qU fish_color_history_current; or set -U fish_color_history_current cyan
set -qU fish_color_match; or set -U fish_color_match cyan
set -qU fish_color_normal; or set -U fish_color_normal normal
set -qU fish_color_operator; or set -U fish_color_operator cyan
set -qU fish_color_param; or set -U fish_color_param 7aa6da
set -qU fish_color_quote; or set -U fish_color_quote b9ca4a
set -qU fish_color_redirection; or set -U fish_color_redirection 70c0b1
set -qU fish_color_search_match; or set -U fish_color_search_match \x2d\x2dbackground\x3dpurple
set -qU fish_color_selection; or set -U fish_color_selection \x2d\x2dbackground\x3dpurple
set -qU fish_color_valid_path; or set -U fish_color_valid_path \x2d\x2dunderline
set -qU fish_pager_color_completion; or set -U fish_pager_color_completion normal
set -qU fish_pager_color_description; or set -U fish_pager_color_description 555\x1eyellow
set -qU fish_pager_color_prefix; or set -U fish_pager_color_prefix cyan
set -qU fish_pager_color_progress; or set -U fish_pager_color_progress cyan

# repaint
function __fish_repaint_status --on-variable fish_color_status
    if status --is-interactive
        commandline -f repaint 2>/dev/null
    end
end
function __fish_repaint_duration --on-variable fish_color_duration
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
