function fish_prompt \
    --description 'Display the left prompt'

    if not functions -q powerline-setup # hack to disable when powerline used
        echo (hline_prompt)
    end

    set -l prefix

    set -l hline_color
    set -l cwd_color

    # Load static colors
    set -q fish_color_hline
    and set hline_color $fish_color_hline

    # Generate colors
    set -q hline_generate_color_hline
    and set hline_color (hline_prompt_generate_color {$USER}@{$hostname})

    # Just calculate this once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (echo $hostname|cut -d . -f 1)
    end

    switch $USER
        case root toor
            if set -q fish_color_cwd_root
                set cwd_color $fish_color_cwd_root
            else
                set cwd_color $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set cwd_color $fish_color_cwd
            set suffix '>'
    end

    set -l normal (set_color normal)
    echo -n -s (set_color $hline_color) "`--" $normal (set_color $cwd_color) $suffix $normal " " (fish_default_mode_prompt)
end
