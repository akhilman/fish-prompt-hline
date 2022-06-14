#/usr/bin/fish

function fish_right_prompt \
	--description "Display the right prompt"

	set -q fish_color_duration; or set -l fish_color_duration blue
	set -q fish_color_njobs; or set -l fish_color_njobs green
	set -q fish_color_status; or set -l fish_color_status --background red white
	set -q fish_color_time; or set -l fish_color_time white
	set -q fish_color_vcs
		or set -l fish_color_venv (hline_prompt_generate_color (__fish_vcs_prompt))
	set -q fish_color_venv
		or set -l fish_color_venv (hline_prompt_generate_color $VIRTUAL_ENV)

	set -l last_pipestatus $pipestatus
	set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
	set -l duration_prompt
	set -l time_prompt
	set -l prompt_line
	set -l vcs_prompt
	set -l venv_prompt
	set -l normal (set_color normal)

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

	echo -sn $pipestatus_prompt $duration_prompt $njobs_prompt $vcs_prompt $venv_prompt $time_prompt " "
end
