#/usr/bin/fish

function fish_right_prompt

	set -l last_status $status
    set -l duration_prompt
    set -l time_prompt
    set -l prompt_line
    set -l vcs_prompt
    set -l venv_prompt
    set -l normal (set_color normal)

    # status
	if test $last_status -ne 0
		set status_prompt (set_color $fish_color_status) " [$last_status]"
	end

    # duration
    if test -n "$CMD_DURATION" -a "$CMD_DURATION" -gt 10000

        set duration_prompt (set_color $fish_color_duration)

        set -l d (math -s0 "$CMD_DURATION / 1000 / 60 / 60 / 24")
        set -l h (math -s0 "$CMD_DURATION / 1000 / 60 / 60 % 24")
        set -l m (math -s0 "$CMD_DURATION / 1000 / 60 % 60")
        set -l s (math -s0 "$CMD_DURATION / 1000 % 60")

        if [ $d -gt 0 ]
            set duration_prompt $duration_prompt " " $d "d"
        end
        if [ $h -gt 0 ]
            set duration_prompt $duration_prompt " " $h "h"
        end
        if [ $m -gt 0 ]
            set duration_prompt $duration_prompt " " $m "m"
        end
        set duration_prompt $duration_prompt " " $s "s" $normal
    end

    # jobs
    set -l number_jobs (jobs | wc -l)
    if [ $number_jobs -gt 0 ]
        set njobs_prompt " " (set_color $fish_color_njobs) "<$number_jobs>" $normal
    end

    # vcs
    set vcs_prompt (set_color $fish_color_vcs) (__fish_vcs_prompt) $normal

    # venv
    if [ -n "$VIRTUAL_ENV" ]
        set venv_prompt " " (set_color $fish_color_venv) "[" (basename $VIRTUAL_ENV) "]" $normal
    end

    # time
    set time_prompt " " (set_color $fish_color_time) (date "+%k:%M") $normal

    echo -sn $status_prompt $duration_prompt $njobs_prompt $vcs_prompt $venv_prompt $time_prompt " "
end
