###
# Bell and execution time
##

function hline_prompt \
	--description "Draw horizontal line over shell prompt"

	set -l prompt_left
	set -l prompt_right
	set -l prompt_line

	set -l color_cwd
	set -l hline_color
	set -l host_color
	set -l user_color

	# Load static colors
	set -q fish_color_cwd
		or set cwd_color $fish_color_cwd
	set -q fish_color_hline
		or set hline_color $fish_color_hline
	set -q fish_color_host
		or set host_color $fish_color_host
	set -q fish_color_user
		or set user_color $fish_color_user

	# Generate colors
	set -q hline_generate_color_hline
		and set hline_color (hline_prompt_generate_color {$USER}@{$hostname})
	set -q hline_generate_color_host
		and set host_color (hline_prompt_generate_color $hostname)
	set -q hline_generate_color_user
		and set user_color (hline_prompt_generate_color $USER)

	if set -q hline_generate_color_cwd
		set cwd_color (hline_prompt_generate_color $PWD)
	else if [ $USER = root -o $USER = toor ]; and set -q fish_color_cwd_root
		set cwd_color $fish_color_cwd_root
	end

	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (echo $hostname|cut -d . -f 1)
	end

	set prompt_left "(" (prompt_pwd) ")"
	set prompt_right "(" "$USER" @ "$__fish_prompt_hostname" ")"

	set -l line_len (math $COLUMNS - (echo -sn $prompt_left $prompt_right | wc -m) - 3)
	if [ $line_len -gt 0 ]
		set prompt_line (printf '%*s' $line_len | tr ' ' '-')
	end

	set -l normal (set_color normal)
	set prompt_left (set_color $hline_color) "(" $normal (set_color $cwd_color) (prompt_pwd) $normal (set_color $hline_color) ")" $normal
	set prompt_right (set_color $hline_color) "(" $normal (set_color $user_color) "$USER" $normal @ (set_color $host_color) "$__fish_prompt_hostname" (set_color $hline_color) ")" $normal

	echo -sn (set_color $hline_color) ".-" $prompt_left (set_color $hline_color) $prompt_line $prompt_right (set_color $hline_color) "-" $normal

end
