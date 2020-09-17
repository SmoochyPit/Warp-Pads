#This function nudges entities back to their original position from before they warped.

	execute if entity @s[scores={wp.passZoffset=1..}] if block ~ ~ ~0.5 #warppad:air if block ~ ~1 ~0.5 #warppad:air run tp @s ~ ~ ~0.1
	execute if entity @s[scores={wp.passZoffset=1..}] run scoreboard players remove @s wp.passZoffset 1
	execute if entity @s[scores={wp.passZoffset=..-1}] if block ~ ~ ~-0.5 #warppad:air if block ~ ~1 ~-0.5 #warppad:air run tp @s ~ ~ ~-0.1
	execute if entity @s[scores={wp.passZoffset=..-1}] run scoreboard players add @s wp.passZoffset 1

#Call it again if they aren't fully aligned yet
	execute if entity @s[scores={wp.passZoffset=1..}] at @s run function warppad:warping/passengers/realignz
	execute if entity @s[scores={wp.passZoffset=..-1}] at @s run function warppad:warping/passengers/realignz