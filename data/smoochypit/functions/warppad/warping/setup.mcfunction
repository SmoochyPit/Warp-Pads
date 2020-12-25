#This file is necessary to set up a few tags for each warp pad, and is important to keeping the system multiplayer-friendly

#recursion 101
	tag @e remove wp.pilot
	tag @e remove wp.wlIterated
	tag @e remove wp.activePass
	tag @p[tag=wp.using,tag=!wp.wsIterated,scores={wp.sneakClick=1..}] add wp.pilot
	execute as @p[tag=wp.pilot] at @s at @e[tag=wp.pad] if entity @e[tag=wp.selCastIcon,distance=..10] run function smoochypit:warppad/warping/launch
	tag @a[tag=wp.pilot] add wp.wsIterated

#call it again as the next player if another player is found
	execute as @p[tag=wp.using,tag=!wp.wsIterated,scores={wp.sneakClick=1..}] at @s at @e[tag=wp.pad,limit=1,sort=nearest] if entity @e[tag=wp.selCastIcon,distance=..10] run function smoochypit:warppad/warping/setup