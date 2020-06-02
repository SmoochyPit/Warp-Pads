#This function nudges entities back to their original position from before they warped.

	execute if entity @s[scores={passXoffset=1..}] if block ~1 ~ ~ air run tp @s ~0.1 ~ ~
	execute if entity @s[scores={passXoffset=1..}] run scoreboard players remove @s passXoffset 1
	execute if entity @s[scores={passXoffset=..-1}] if block ~-1 ~ ~ air run tp @s ~-0.1 ~ ~
	execute if entity @s[scores={passXoffset=..-1}] run scoreboard players add @s passXoffset 1

#Call it again if they aren't fully aligned yet
	execute if entity @s[scores={passXoffset=1..}] at @s run function warppad:realignx
	execute if entity @s[scores={passXoffset=..-1}] at @s run function warppad:realignx