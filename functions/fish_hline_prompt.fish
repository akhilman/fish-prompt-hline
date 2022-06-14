###
# Bell and execution time
##

function fish_hline_prompt

	set -l prompt_left
	set -l prompt_right
	set -l prompt_line
	set -l color_cwd
	set -qU fish_color_hline; or set -l fish_color_hline (hline_prompt_generate_color {$USER}@{$hostname})

	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (echo $hostname|cut -d . -f 1)
	end

	switch $USER
	case root toor
		if set -q fish_color_cwd_root
			set color_cwd $fish_color_cwd_root
		else
			set color_cwd $fish_color_cwd
		end
	case '*'
		set color_cwd $fish_color_cwd
	end

	set prompt_left "(" (prompt_pwd) ")"
	set prompt_right "(" "$USER" @ "$__fish_prompt_hostname" ")"

	set -l line_len (math $COLUMNS - (echo -sn $prompt_left $prompt_right | wc -m) - 3)
	if [ $line_len -gt 0 ]
		set prompt_line (printf '%*s' $line_len | tr ' ' '-')
	end

	set -l normal (set_color normal)
	set prompt_left (set_color $fish_color_hline) "(" $normal (set_color $color_cwd) (prompt_pwd) $normal (set_color $fish_color_hline) ")" $normal
	set prompt_right (set_color $fish_color_hline) "(" $normal (set_color $fish_color_user) "$USER" $normal @ (set_color $fish_color_host) "$__fish_prompt_hostname" (set_color $fish_color_hline) ")" $normal

	echo -sn (set_color $fish_color_hline) ".-" $prompt_left (set_color $fish_color_hline) $prompt_line $prompt_right (set_color $fish_color_hline) "-" $normal

end
