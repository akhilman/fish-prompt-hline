if set -q _hline_prompt_version; and string match -q "0.3" $_hline_prompt_version
    set -l frozen_config $__fish_config_dir/conf.d/fish_prompt_hline_fronzen_config.fish
    echo \# Fish_prompt_hline v0.5 does not uses universal variables anymore. | tee $frozen_config
    echo \# All current settings are dumped to $frozen_config | tee -a $frozen_config
    echo \# >>$frozen_config
    echo \# See also https://fishshell.com/docs/4.5/relnotes.html#fish-4-3-0-released-december-28-2025 . >>$frozen_config
    echo >>$frozen_config

    if set -qU fish_color_duration
        echo "set -g fish_color_duration $fish_color_duration" >>$frozen_config
        set -eU fish_color_duration
    end
    if set -qU fish_color_hline
        echo "set -g fish_color_hline $fish_color_hline" >>$frozen_config
        set -eU fish_color_hline
    end
    if set -qU fish_color_njobs
        echo "set -g fish_color_njobs $fish_color_njobs" >>$frozen_config
        set -eU fish_color_njobs
    end
    if set -qU fish_color_status
        echo "set -g fish_color_status $fish_color_status" >>$frozen_config
        set -eU fish_color_status
    end
    if set -qU fish_color_time
        echo "set -g fish_color_time $fish_color_time" >>$frozen_config
        set -eU fish_color_time
    end
    if set -qU fish_color_vcs
        echo "set -g fish_color_vcs $fish_color_vcs" >>$frozen_config
        set -eU fish_color_vcs
    end
    if set -qU fish_color_venv
        echo "set -g fish_color_venv $fish_color_venv" >>$frozen_config
        set -eU fish_color_venv
    end

    if set -qU hline_generate_color_cwd
        echo "set -g hline_generate_color_cwd $hline_generate_color_cwd" >>$frozen_config
        set -eU hline_generate_color_cwd
    end
    if set -qU hline_generate_color_hline
        echo "set -g hline_generate_color_hline $hline_generate_color_hline" >>$frozen_config
        set -eU hline_generate_color_hline
    end
    if set -qU hline_generate_color_host
        echo "set -g hline_generate_color_host $hline_generate_color_host" >>$frozen_config
        set -eU hline_generate_color_host
    end
    if set -qU hline_generate_color_user
        echo "set -g hline_generate_color_user $hline_generate_color_user" >>$frozen_config
        set -eU hline_generate_color_user
    end
    if set -qU hline_generate_color_vcs
        echo "set -g hline_generate_color_vcs $hline_generate_color_vcs" >>$frozen_config
        set -eU hline_generate_color_vcs
    end
    if set -qU hline_generate_color_venv
        echo "set -g hline_generate_color_venv $hline_generate_color_venv" >>$frozen_config
        set -eU hline_generate_color_venv
    end

    if set -qU hline_generated_color_hue_offset
        echo "set -g hline_generated_color_hue_offset $hline_generated_color_hue_offset" >$frozen_config
        set -eU hline_generated_color_hue_offset
    end
    if set -qU hline_generated_color_saturation
        echo "set -g hline_generated_color_saturation $hline_generated_color_saturation" >>$frozen_config
        set -eU hline_generated_color_saturation
    end
    if set -qU hline_generated_color_value
        echo "set -g hline_generated_color_value $hline_generated_color_value" >>$frozen_config
        set -eU hline_generated_color_value
    end

    # Drop generated color cache
    if set -qU _hline_prompt_generated_colors_cache
        set -eU _hline_prompt_generated_colors_cache
    end

    set -eU _hline_prompt_version
end
