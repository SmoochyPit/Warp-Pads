#This function nudges entities back to their original position from before they warped.

	execute if entity @s[scores={passZoffset=1..}] if block ~ ~ ~1 air run tp @s ~ ~ ~0.1
	execute if entity @s[scores={passZoffset=1..}] run scoreboard players remove @s passZoffset 1
	execute if entity @s[scores={passZoffset=..-1}] if block ~ ~ ~-1 air run tp @s ~ ~ ~-0.1
	execute if entity @s[scores={passZoffset=..-1}] run scoreboard players add @s passZoffset 1

#Call it again if they aren't fully aligned yet
	execute if entity @s[scores={passZoffset=1..}] at @s run function warppad:realignz
	execute if entity @s[scores={passZoffset=..-1}] at @s run function warppad:realignz