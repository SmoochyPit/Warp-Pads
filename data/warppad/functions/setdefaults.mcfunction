#Set warp UUID scoreboard objectives
	scoreboard players add @e[tag=warpPad] linkedUUIDL 0
	scoreboard players add @e[tag=warpPad] linkedUUIDM 0

#Tag tiers 2 and 3 as warpPadPlus
	tag @e[tag=warpPad2,tag=!warpPadPlus] add warpPadPlus
	tag @e[tag=warpPad3,tag=!warpPadPlus] add warpPadPlus

#Set default warp pad color & frequency
	scoreboard players add @e[tag=warpPad] iconColor1 0
	scoreboard players add @e[tag=warpPad] warpStreamFreq 0