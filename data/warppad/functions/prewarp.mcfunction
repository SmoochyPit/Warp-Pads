#This file runs when a warp pad is active

#Set player UUID scoreboard objectives
	scoreboard players add @a linkedUUID 0

	execute as @a[scores={linkedUUID=0}] store result score @s linkedUUID run data get entity @s UUID[0]

#Set warp pads' "warppadX" and "warppadZ" to corresponding coords, scaled by 10
	execute as @e[tag=warpPad] store result score @s warppadX run data get entity @s Pos[0] 10
	execute as @e[tag=warpPad] store result score @s warppadZ run data get entity @s Pos[2] 10
   
#Tag all untagged warp pads in the nether as "netherwarp"
	execute as @e[tag=warpPad,tag=!netherWarp] at @s in the_nether if entity @e[tag=warpPad,tag=!netherWarp,distance=..0.1] run tag @s add netherWarp
	execute as @e[tag=warpPad,tag=!endWarp] at @s in the_end if entity @e[tag=warpPad,tag=!endWarp,distance=..0.1] run tag @s add endWarp

#Tag player if they're a "passenger" (on the warp pad but not using it)
	tag @e remove wpPassenger
	execute as @e[tag=warpPad] at @s as @e[distance=..2,tag=!wpUsing,tag=!warpPad,tag=!warpLocIcon,tag=!warpLocTemp] positioned ~-2 ~-.5 ~-2 run tag @s[dx=3,dy=0,dz=3] add wpPassenger
#For every "passenger", set "passXoffset" and "passZoffset" to the positions relative to the warp pad (still scaled by 10)
	execute as @e[tag=wpPassenger] store result score @s passXoffset run data get entity @s Pos[0] 10
	execute as @e[tag=wpPassenger] at @s run scoreboard players operation @s passXoffset -= @e[tag=warpPad,limit=1,sort=nearest] warppadX
	execute as @e[tag=wpPassenger] store result score @s passZoffset run data get entity @s Pos[2] 10
	execute as @e[tag=wpPassenger] at @s run scoreboard players operation @s passZoffset -= @e[tag=warpPad,limit=1,sort=nearest] warppadZ
	scoreboard players reset @e[tag=!wpPassenger] passXoffset
	scoreboard players reset @e[tag=!wpPassenger] passZoffset

#Places the markers in the direction of other warp pads. -- warpHasSelect is when a warp has been assigned an id
	tag @a remove warpNoIter
	execute as @a at @s positioned ~-5 ~-5 ~-5 if entity @e[tag=warpLocIcon,dx=10,dy=10,dz=10] run tag @s add warpNoIter
	execute if entity @a[tag=wpUsing,tag=!warpNoIter,tag=!wpIterated] run function warppad:iterate

#Unselect any selected icons
	tag @e remove SelCastIcon

#Selects the marker if the player is looking at it
	execute as @a[tag=wpUsing] at @s run function warppad:warpselect

#Goes through every player who needs to teleport and flags them and their passengers as needing to teleport, then looks for the warp pad with the matching ID and teleports them. Finally, passengers regain their offset.
	tag @e remove wsIterated
	tag @e remove warpPilot
	tag @e remove wlIterated
	tag @e remove wpActivePass
	execute as @a[tag=wpUsing,scores={sneakClick=1..}] at @s at @e[tag=warpPad,limit=1,sort=nearest] positioned ~-5 ~-5 ~-5 if entity @e[tag=SelCastIcon,dx=10,dy=10,dz=10] positioned ~5 ~5 ~5 run function warppad:warpsetup
