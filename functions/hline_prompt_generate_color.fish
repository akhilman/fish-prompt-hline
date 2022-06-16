function hline_prompt_generate_color \
	--description "Generate pseudorandom color form string seed"

	set -l cached_color_keys (string split ":" $__hline_prompnt_generated_colors_cache_keys)
	set -l cached_color_values (string split ":" $__hline_prompnt_generated_colors_cache_values)

	set -l cache_key (string escape --style=var "$argv")
	if set -q __hline_prompnt_generated_colors_cache_keys
		if set -l index (contains -i $cache_key $cached_color_keys)
			echo $cached_color_values[$index]
			return
		end
	end

	set -l H_offset 0  # 0 <= H <= 360
    set -l S 25  # 0 <= S <= 100
    set -l V 80  # 0 <= V <= 100

	set -q fish_generated_color_hue_offset
		and set H_offset $fish_generated_color_hue_offset
	set -q fish_generated_color_saturation
		and set S $fish_generated_color_saturation
	set -q fish_generated_color_value
		and set V $fish_generated_color_value

	set -l hash (echo $argv | md5sum | head -c 32)
	set -l H 0
	for n in (seq 1 4 32)
		set H (math --scale 0 "bitxor($H, 0x"(string sub -s $n -l 4 $hash)")")
	end
	set H (math --scale 3 "abs($H / 0xffff * 360 + $H_offset) % 360")

    set -l C (math --scale 3 "($V / 100) * ($S / 100)")
    set -l X (math --scale 3 "$C * (1 - abs(($H / 60) % 2 - 1))")
    set -l m (math --scale 3 "$V / 100 - $C")

	set -L R
	set -L G
	set -L B

    if [ (math --scale 0 $H) -le 60 ]
        set R $C
        set G $X
        set B 0
    else if [ (math --scale 0 $H) -le 120 ]
        set R $X
        set G $C
        set B 0
    else if [ (math --scale 0 $H) -le 180 ]
        set R 0
        set G $C
        set B $X
    else if [ (math --scale 0 $H) -le 240 ]
        set R 0
        set G $X
        set B $C
    else if [ (math --scale 0 $H) -le 300 ]
        set R $X
        set G 0
        set B $C
	else
        set R $C
        set G 0
        set B $X
    end
	
	set R (math --scale 0 "min(255, max(0, (($R + $m) * 255)))")
	set G (math --scale 0 "min(255, max(0, (($G + $m) * 255)))")
	set B (math --scale 0 "min(255, max(0, (($B + $m) * 255)))")
	
	set -l color (printf "%02x%02x%02x" $R $G $B)

	set -U __hline_prompnt_generated_colors_cache_keys (string join ":" $cache_key $cached_color_keys[1..128])
	set -U __hline_prompnt_generated_colors_cache_values (string join ":" $color $cached_color_values[1..128])

	echo $color
end
