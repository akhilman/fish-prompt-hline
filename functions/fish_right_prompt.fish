function fish_right_prompt \
    --description "Display the right prompt"

    # Save status before we call `hline_prompt_generate_color`
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    set -l duration_prompt
    set -l time_prompt
    set -l prompt_line
    set -l vcs_prompt
    set -l venv_prompt
    set -l normal (set_color normal)

    set -l fish_vcs_prompt (__fish_vcs_prompt)

    set -l vcs_color
    set -l venv_color

    # Load static colors
    set -q fish_color_vcs
    and set vcs_color $fish_color_vcs
    set -q fish_color_venv
    and set venv_color $fish_color_venv

    # Generate colors
    set -q hline_generate_color_vcs
    and set vcs_color (hline_prompt_generate_color $fish_vcs_prompt)
    set -q hline_generate_color_venv
    and set venv_color (hline_prompt_generate_color $VIRTUAL_ENV)

    # pipestatus
    # The status code was stollen from default fish prompt.
    # If the status was carried over (e.g. after `set`), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l pipestatus_prompt (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    # duration
    if test -n "$CMD_DURATION" -a "$CMD_DURATION" -gt 10000

        set duration_prompt (set_color $fish_color_duration)

        set -l d (math -s0 "$CMD_DURATION / 1000 / 60 / 60 / 24")
        set -l h (math -s0 "$CMD_DURATION / 1000 / 60 / 60 % 24")
        set -l m (math -s0 "$CMD_DURATION / 1000 / 60 % 60")
        set -l s (math -s0 "$CMD_DURATION / 1000 % 60")

        if [ $d -gt 0 ]
            set duration_prompt $duration_prompt " " $d d
        end
        if [ $h -gt 0 ]
            set duration_prompt $duration_prompt " " $h h
        end
        if [ $m -gt 0 ]
            set duration_prompt $duration_prompt " " $m m
        end
        set duration_prompt $duration_prompt " " $s s $normal
    end

    # jobs
    set -l number_jobs (jobs | wc -l)
    if [ $number_jobs -gt 0 ]
        set njobs_prompt " " (set_color $fish_color_njobs) "<$number_jobs>" $normal
    end

    # vcs
    set vcs_prompt (set_color $vcs_color) $fish_vcs_prompt $normal

    # venv
    if [ -n "$VIRTUAL_ENV" ]
        set venv_prompt " " (set_color $venv_color) "[" (basename $VIRTUAL_ENV) "]" $normal
    end

    # time
    set time_prompt " " (set_color $fish_color_time) (date "+%k:%M") $normal

    echo -sn $pipestatus_prompt $duration_prompt $njobs_prompt $vcs_prompt $venv_prompt $time_prompt " "
end
