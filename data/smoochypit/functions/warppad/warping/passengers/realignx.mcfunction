#This function nudges entities back to their original position from before they warped.

	execute if entity @s[scores={wp.passXoffset=1..}] if block ~0.5 ~ ~ #smoochypit:warppad/air if block ~0.5 ~1 ~ #smoochypit:warppad/air run tp @s ~0.1 ~ ~
	scoreboard players remove @s[scores={wp.passXoffset=1..}] wp.passXoffset 1
	execute if entity @s[scores={wp.passXoffset=..-1}] if block ~-0.5 ~ ~ #smoochypit:warppad/air if block ~-0.5 ~1 ~ #smoochypit:warppad/air run tp @s ~-0.1 ~ ~
	scoreboard players add @s[scores={wp.passXoffset=..-1}] wp.passXoffset 1

#Call it again if they aren't fully aligned yet
	execute if entity @s[scores={wp.passXoffset=1..}] at @s run function smoochypit:warppad/warping/passengers/realignx
	execute if entity @s[scores={wp.passXoffset=..-1}] at @s run function smoochypit:warppad/warping/passengers/realignx