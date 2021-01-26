#This function nudges entities back to their original position from before they warped.

	execute if entity @s[scores={wp.passZoffset=1..}] if block ~ ~ ~0.5 #smoochypit:warppad/warpnocoll if block ~ ~1 ~0.5 #smoochypit:warppad/warpnocoll run tp @s ~ ~ ~0.1
	scoreboard players remove @s[scores={wp.passZoffset=1..}] wp.passZoffset 1
	execute if entity @s[scores={wp.passZoffset=..-1}] if block ~ ~ ~-0.5 #smoochypit:warppad/warpnocoll if block ~ ~1 ~-0.5 #smoochypit:warppad/warpnocoll run tp @s ~ ~ ~-0.1
	scoreboard players add @s[scores={wp.passZoffset=..-1}] wp.passZoffset 1

#Call it again if they aren't fully aligned yet
	execute at @s[scores={wp.passZoffset=1..}] run function smoochypit:warppad/warping/passengers/realignz
	execute at @s[scores={wp.passZoffset=..-1}] run function smoochypit:warppad/warping/passengers/realignz