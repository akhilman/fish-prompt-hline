# HLine promp migration 0.2.0 -> 0.3.0

set -qU fish_generate_color_cwd
	and set -U hline_generate_color_cwd $fish_generate_color_cwd
	and set -eU fish_generate_color_cwd
set -qU fish_generate_color_hline
	and set -U hline_generate_color_hline $fish_generate_color_hline
	and set -eU fish_generate_color_hline
set -qU fish_generate_color_host
	and set -U hline_generate_color_host $fish_generate_color_host
	and set -eU fish_generate_color_host
set -qU fish_generate_color_user
	and set -U hline_generate_color_user $fish_generate_color_user
	and set -eU fish_generate_color_user
set -qU fish_generate_color_vcs
	and set -U hline_generate_color_vcs $fish_generate_color_vcs
	and set -eU fish_generate_color_vcs
set -qU fish_generate_color_venv
	and set -U hline_generate_color_venv $fish_generate_color_venv
	and set -eU fish_generate_color_venv

set -qU fish_generated_color_hue_offset
	and set -U hline_generated_color_hue_offset $fish_generated_color_hue_offset
	and set -eU fish_generated_color_hue_offset
set -qU fish_generated_color_saturation
	and set -U hline_generated_color_saturation $fish_generated_color_saturation
	and set -eU fish_generated_color_saturation
set -qU fish_generated_color_value
	and set -U hline_generated_color_value $fish_generated_color_value
	and set -eU fish_generated_color_value
