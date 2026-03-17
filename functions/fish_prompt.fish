function fish_prompt \
    --description 'Display the left prompt'

    if not functions -q powerline-setup # hack to disable when powerline used
        echo (hline_prompt)
    end

    set -l prefix

    # Load static colors
    set -l cwd_color normal
    set -q fish_color_cwd; and set cwd_color $fish_color_cwd
    fish_is_root_user; and set -q fish_color_cwd_root; and set cwd_color $fish_color_cwd_root
    set -l hline_color $cwd_color

    if fish_is_root_user
        set suffix '#'
    else
        set suffix '>'
    end

    set -q fish_color_hline
    and set hline_color $fish_color_hline

    # Generate colors
    set -q hline_generate_color_hline
    and set hline_color (hline_prompt_generate_color {$USER}@{$hostname})

    # Just calculate this once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (echo $hostname|cut -d . -f 1)
    end

    set -l normal (set_color normal)
    echo -n -s (set_color $hline_color) "`--" $normal (set_color $cwd_color) $suffix $normal " " (fish_default_mode_prompt)
end
