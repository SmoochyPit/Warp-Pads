#This file is the reworked teleportation system, which now uses predetermined values instead of a laggy stupid raycast system.

#recursion 102
	tag @e[tag=wp.pad,limit=1,sort=nearest] add wp.wlIterated

#warp or retry - note: "wp.hasSelect" is a requirement to run, and may break in complicated ways without.
	execute if score @e[tag=wp.selCastIcon,limit=1,sort=nearest] wp.tempID = @e[tag=wp.pad,limit=1,sort=nearest,tag=wp.hasSelect] wp.tempID as @p[tag=wp.pilot] at @s at @e[tag=wp.pad,distance=..5] run tag @e[tag=wp.passenger,distance=..5] add wp.activePass
	execute if score @e[tag=wp.selCastIcon,limit=1,sort=nearest] wp.tempID = @e[tag=wp.pad,limit=1,sort=nearest,tag=wp.hasSelect] wp.tempID at @e[tag=wp.pad,limit=1,sort=nearest,tag=wp.hasSelect] run function smoochypit:warppad/warping/players
	execute if entity @e[tag=wp.pad,tag=!wp.wlIterated,limit=1,sort=nearest,tag=wp.hasSelect] at @e[tag=wp.pad,tag=!wp.wlIterated,limit=1,sort=nearest,tag=wp.hasSelect] run function smoochypit:warppad/warping/launch