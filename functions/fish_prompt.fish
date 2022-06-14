#/usr/bin/fish

function fish_prompt --description 'Write out the prompt'

	set -qU fish_color_hline; or set -l fish_color_hline (hline_prompt_generate_color {$USER}@{$hostname})

	if not functions -q powerline-setup  # hack to disable when powerline used
		echo (fish_hline_prompt)
	end

	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (echo $hostname|cut -d . -f 1)
	end

	set -l color_cwd
	set -l prefix
	switch $USER
	case root toor
		if set -q fish_color_cwd_root
			set color_cwd $fish_color_cwd_root
		else
			set color_cwd $fish_color_cwd
		end
		set suffix '#'
	case '*'
		set color_cwd $fish_color_cwd
		set suffix '>'
	end

	set -l normal (set_color normal)
	echo -n -s (set_color $fish_color_hline) "`--" $normal (set_color $color_cwd) $suffix $normal " " (fish_default_mode_prompt)
end
