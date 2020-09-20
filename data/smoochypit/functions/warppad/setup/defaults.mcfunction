#Set warp UUID scoreboard objectives
	scoreboard players add @e[tag=wp.pad] wp.linkedUUID 0

#Tag tiers 2 and 3 as warpPadPlus
	tag @e[tag=wp.pad2,tag=!wp.padPlus] add wp.padPlus
	tag @e[tag=wp.pad3,tag=!wp.padPlus] add wp.padPlus

#Set default warp pad color & frequency
	scoreboard players add @e[tag=wp.pad] wp.iconColor 0
	scoreboard players add @e[tag=wp.pad] wp.streamFreq 0