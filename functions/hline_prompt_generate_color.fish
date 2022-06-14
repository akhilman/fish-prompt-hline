function hline_prompt_generate_color \
	-d "Generate pseudorandom color form string seed"
	echo $argv | sha1sum | head --bytes 6
end
