#This function nudges entities back to their original position from before they warped.

	execute if entity @s[scores={wp.passXoffset=1..}] if block ~0.5 ~ ~ #warppad:air if block ~0.5 ~1 ~ #warppad:air run tp @s ~0.1 ~ ~
	execute if entity @s[scores={wp.passXoffset=1..}] run scoreboard players remove @s wp.passXoffset 1
	execute if entity @s[scores={wp.passXoffset=..-1}] if block ~-0.5 ~ ~ #warppad:air if block ~-0.5 ~1 ~ #warppad:air run tp @s ~-0.1 ~ ~
	execute if entity @s[scores={wp.passXoffset=..-1}] run scoreboard players add @s wp.passXoffset 1

#Call it again if they aren't fully aligned yet
	execute if entity @s[scores={wp.passXoffset=1..}] at @s run function warppad:warping/passengers/realignx
	execute if entity @s[scores={wp.passXoffset=..-1}] at @s run function warppad:warping/passengers/realignx