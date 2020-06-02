#This file is the reworked teleportation system, which now uses predetermined values instead of a laggy stupid raycast system.

#recursion 102
	tag @e[tag=warpPad,limit=1,sort=nearest] add wlIterated

#warp or retry - note: "warpHasSelect" is a requirement to run, and may break in complicated ways without.
	execute if score @e[tag=SelCastIcon,limit=1,sort=nearest] warpTempID = @e[tag=warpPad,limit=1,sort=nearest,tag=warpHasSelect] warpTempID as @a[tag=warpPilot,limit=1,sort=nearest] at @s at @e[tag=warpPad,distance=..5] run tag @e[tag=wpPassenger,distance=..5] add wpActivePass
	execute if score @e[tag=SelCastIcon,limit=1,sort=nearest] warpTempID = @e[tag=warpPad,limit=1,sort=nearest,tag=warpHasSelect] warpTempID at @e[tag=warpPad,limit=1,sort=nearest,tag=warpHasSelect] run function warppad:warpplayers
	execute if entity @e[tag=warpPad,tag=!wlIterated,limit=1,sort=nearest,tag=warpHasSelect] at @e[tag=warpPad,tag=!wlIterated,limit=1,sort=nearest,tag=warpHasSelect] run function warppad:warplaunch