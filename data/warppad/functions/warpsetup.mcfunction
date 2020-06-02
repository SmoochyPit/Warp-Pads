#This file is necessary to set up a few tags for each warp pad, and is important to keeping the system multiplayer-friendly

#recursion 101
	tag @e remove warpPilot
	tag @e remove wlIterated
	tag @e remove wpActivePass
	tag @a[tag=wpUsing,tag=!wsIterated,limit=1,sort=nearest,scores={sneakClick=1..}] add warpPilot
	execute as @a[tag=warpPilot,limit=1,sort=nearest] at @s at @e[tag=warpPad,limit=1,sort=nearest] if entity @e[tag=SelCastIcon,distance=..10] run function warppad:warplaunch
	tag @a[tag=warpPilot,limit=1,sort=nearest] add wsIterated

#call it again as the next player if another player is found
	execute if entity @a[tag=wpUsing,tag=!wsIterated,scores={sneakClick=1..}] as @a[tag=wpUsing,tag=!wsIterated,limit=1,sort=nearest,scores={sneakClick=1..}] at @s at @e[tag=warpPad,limit=1,sort=nearest] if entity @e[tag=SelCastIcon,distance=..10] run function warppad:warpsetup
