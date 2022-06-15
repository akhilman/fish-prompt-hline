function hline_prompt_generate_color \
	--description "Generate pseudorandom color form string seed"

	set -q fish_generated_color_hue_offset; or set -l fish_generated_color_hue_offset 0
	set -q fish_generated_color_saturation; or set -l fish_generated_color_saturation 25
	set -q fish_generated_color_value; or set -l fish_generated_color_value 80

	# Hue: 0 <= H <= 360
	# Saturation: 0 <= S <= 100
	# Value: 0 <= V <= 100

	set -l H_offset $fish_generated_color_hue_offset
    set -l S $fish_generated_color_saturation
    set -l V $fish_generated_color_value

	set -l hash (echo $argv | md5sum | head -c 32)
	set -l H 0
	for n in (seq 1 4 32)
		set H (math --scale 0 "bitxor($H, 0x"(string sub -s $n -l 4 $hash)")")
	end
	set H (math --scale 3 "abs($H / 0xffff * 360 + $H_offset) % 360")

	# echo H $H S $S V $V

    set -l C (math --scale 3 "($V / 100) * ($S / 100)")
    set -l X (math --scale 3 "$C * (1 - abs(($H / 60) % 2 - 1))")
    set -l m (math --scale 3 "$V / 100 - $C")

	# echo C $C X $X m $m

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
	
	# echo R1 $R G1 $G B1 $B

	set R (math --scale 0 "min(255, max(0, (($R + $m) * 255)))")
	set G (math --scale 0 "min(255, max(0, (($G + $m) * 255)))")
	set B (math --scale 0 "min(255, max(0, (($B + $m) * 255)))")
	
	# echo R $R G $G B $B

	set -l color (printf "%02x%02x%02x" $R $G $B)

	echo $color
end

# hline_prompt_generate_color $argv
