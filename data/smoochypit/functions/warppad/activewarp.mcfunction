#This file runs when a warp pad is active

#Run smoochypit:warppad/setup/defaults
	function smoochypit:warppad/setup/defaults
#Set player UUID scoreboard objectives
	scoreboard players add @a wp.linkedUUID 0

	execute as @a[scores={wp.linkedUUID=0}] store result score @s wp.linkedUUID run data get entity @s UUID[0]

#Set warp pads' "wp.padX" and "wp.padZ" to corresponding coords, scaled by 10
	execute as @e[tag=wp.pad] store result score @s wp.padX run data get entity @s Pos[0] 10
	execute as @e[tag=wp.pad] store result score @s wp.padZ run data get entity @s Pos[2] 10
   
#Tag all untagged warp pads in the nether as "netherwarp"
	execute as @e[tag=wp.pad,tag=!wp.netherWarp] at @s in the_nether if entity @e[tag=wp.pad,tag=!wp.netherWarp,distance=..0.1] run tag @s add wp.netherWarp
	execute as @e[tag=wp.pad,tag=!wp.endWarp] at @s in the_end if entity @e[tag=wp.pad,tag=!wp.endWarp,distance=..0.1] run tag @s add wp.endWarp

#Tag player if they're a "passenger" (on the warp pad but not using it)
	tag @e remove wp.passenger
	execute as @e[tag=wp.pad] at @s as @e[distance=..2,tag=!wp.using,tag=!wp.pad,tag=!wp.locIcon,tag=!wp.locTemp,type=!#smoochypit:warppad/nonwarpable,tag=!global.ignore,tag=!global.ignore.pos] positioned ~-2 ~-.5 ~-2 run tag @s[dx=3,dy=0,dz=3] add wp.passenger
#For every "wp.passenger", set "wp.passXoffset" and "wp.passZoffset" to the positions relative to the warp pad (still scaled by 10)
	execute as @e[tag=wp.passenger] store result score @s wp.passXoffset run data get entity @s Pos[0] 10
	execute as @e[tag=wp.passenger] at @s run scoreboard players operation @s wp.passXoffset -= @e[tag=wp.pad,limit=1,sort=nearest] wp.padX
	execute as @e[tag=wp.passenger] store result score @s wp.passZoffset run data get entity @s Pos[2] 10
	execute as @e[tag=wp.passenger] at @s run scoreboard players operation @s wp.passZoffset -= @e[tag=wp.pad,limit=1,sort=nearest] wp.padZ
	scoreboard players reset @e[tag=!wp.passenger,tag=!global.ignore] wp.passXoffset
	scoreboard players reset @e[tag=!wp.passenger,tag=!global.ignore] wp.passZoffset

#Places the markers in the direction of other warp pads. -- warpHasSelect is when a warp has been assigned an id
	tag @a remove wp.noIterate
	execute as @a at @s positioned ~-5 ~-5 ~-5 if entity @e[tag=wp.locIcon,dx=10,dy=10,dz=10] run tag @s add wp.noIterate
	execute if entity @a[tag=wp.using,tag=!wp.noIterate,tag=!wp.iterated] run function smoochypit:warppad/iterate/iterate

#Unselect any selected icons
	tag @e remove wp.selCastIcon

#Selects the marker if the player is looking at it
	execute as @a[tag=wp.using] at @s run function smoochypit:warppad/selection/select

#Goes through every player who needs to teleport and flags them and their passengers as needing to teleport, then looks for the warp pad with the matching ID and teleports them. Finally, passengers regain their offset.
	tag @e remove wp.wsIterated
	tag @e remove wp.pilot
	tag @e remove wp.wlIterated
	tag @e remove wp.activePass
	execute as @a[tag=wp.using,scores={wp.sneakClick=1..}] at @s at @e[tag=wp.pad,limit=1,sort=nearest] positioned ~-5 ~-5 ~-5 if entity @e[tag=wp.selCastIcon,dx=10,dy=10,dz=10] positioned ~5 ~5 ~5 run function smoochypit:warppad/warping/setup