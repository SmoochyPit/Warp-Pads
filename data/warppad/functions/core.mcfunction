#Warp Pad system, by SmoochyPit -- THIS FILE IS NOW UNUSED

#Set player UUID scoreboard objectives -- PREWARP
#	scoreboard players add @a linkedUUIDL 0
#	scoreboard players add @a linkedUUIDM 0
#
#	execute as @a[scores={linkedUUIDL=0}] store result score @s linkedUUIDL run data get entity @s UUIDLeast 0.0000000001
#	execute as @a[scores={linkedUUIDM=0}] store result score @s linkedUUIDM run data get entity @s UUIDMost 0.0000000001

#Set blank warp pad UUIDs to 0 -- PRECREATION
#	scoreboard players add @e[tag=warpPad] linkedUUIDL 0
#	scoreboard players add @e[tag=warpPad] linkedUUIDM 0

#To prevent unintentional warping -- coolit
#	scoreboard players add @a warpCooldown 0
#	scoreboard players remove @a[scores={warpCooldown=1..}] warpCooldown 1
#	tag @a[scores={warpCooldown=1..}] remove wpUsing

#Set default warp pad color & frequency -- PRECREATION
#	scoreboard players add @e[tag=warpPad] iconColor1 0
#	scoreboard players add @e[tag=warpPad] warpStreamFreq 0

#Set warp pads' "warppadX" and "warppadZ" to corresponding coords, scaled by 10 -- PREWARP
#	execute as @e[tag=warpPad] store result score @s warppadX run data get entity @s Pos[0] 10
#	execute as @e[tag=warpPad] store result score @s warppadZ run data get entity @s Pos[2] 10

#Punish spamming warp pads -- coolit
#	tag @a[scores={warpSpam=..100,warpCooldown=0},tag=warpSpamHalt] remove warpSpamHalt
#	advancement grant @a[scores={warpSpam=100..},advancements={warppad:warpspam=false}] only warppad:warpspam
#	tag @a[scores={warpSpam=100..}] add warpSpamHalt
#	scoreboard players set @a[scores={warpSpam=100..}] warpCooldown 400
#	scoreboard players set @a[scores={warpSpam=100..}] warpSpam 0
#	scoreboard players set @a[gamemode=creative] warpSpam 0

#Tag player if they're using a warp pad -- 1t
#	execute as @e[tag=warpPad] at @s align xyz as @a[dx=0,dy=0,dz=0,limit=1,scores={warpCooldown=0}] at @s unless entity @a[tag=wpUsing,distance=..4] if block ~ ~-1 ~ gold_block run tag @s add wpUsing
#	execute as @e[tag=warpPad] at @s align xyz as @a[dx=0,dy=0,dz=0,limit=1,scores={warpCooldown=0}] at @s unless entity @a[tag=wpUsing,distance=..4] if block ~ ~-1 ~ emerald_block run tag @s add wpUsing
#	execute as @e[tag=warpPad] at @s align xyz as @a[dx=0,dy=0,dz=0,limit=1,scores={warpCooldown=0}] at @s unless entity @a[tag=wpUsing,distance=..4] if block ~ ~-1 ~ diamond_block run tag @s add wpUsing
#	execute as @a[tag=wpUsing] at @s align xyz unless entity @e[tag=warpPad,dx=0,dy=0,dz=0] run tag @s remove wpUsing
#	execute as @e[tag=warpPad] at @s align xyz unless entity @a[dx=0,dy=0,dz=0] run tag @s remove wpUsing

#Tag player if they're a "passenger" (on the warp pad but not using it) -- PREWARP
#	tag @e remove wpPassenger
#	execute as @e[tag=warpPad] at @s as @e[distance=..2,tag=!wpUsing,tag=!warpPad,tag=!warpLocIcon,tag=!warpLocTemp] positioned ~-2 ~-.5 ~-2 run tag @s[dx=3,dy=0,dz=3] add wpPassenger
#For every "passenger", set "passXoffset" and "passZoffset" to the positions relative to the warp pad (still scaled by 10)
#	execute as @e[tag=wpPassenger] store result score @s passXoffset run data get entity @s Pos[0] 10
#	execute as @e[tag=wpPassenger] at @s run scoreboard players operation @s passXoffset -= @e[tag=warpPad,limit=1,sort=nearest] warppadX
#	execute as @e[tag=wpPassenger] at @s run scoreboard players operation @s passZoffset -= @e[tag=warpPad,limit=1,sort=nearest] warppadZ
#	execute as @e[tag=wpPassenger] store result score @s passZoffset run data get entity @s Pos[2] 10
#	scoreboard players reset @e[tag=!wpPassenger] passXoffset
#	scoreboard players reset @e[tag=!wpPassenger] passZoffset

#Destroy Markers after warp pad use -- 1t
#	execute as @e[tag=warpLocIcon] at @s positioned ~-5 ~-5 ~-5 unless entity @a[tag=wpUsing,dx=10,dy=10,dz=10] run tp @s ~5 -1000 ~5
#	execute as @e[tag=warpLocIcon] at @s positioned ~-5 ~-5 ~-5 unless entity @a[tag=wpUsing,dx=10,dy=10,dz=10] run kill @s
#	tag @a[tag=!wpUsing] remove wpIterated

#Displays the name above the markers when they are looked at. -- COSMETICS
#	execute as @e[tag=warpLocIcon] run data merge entity @s {CustomNameVisible:false}
#	execute as @e[tag=SelCastIcon] if data entity @s CustomName run data merge entity @s {CustomNameVisible:true}

#Places the markers in the direction of other warp pads. -- PREWARP
#	execute unless entity @a[tag=wpUsing] run tag @e remove warpHasSelect
#	execute unless entity @a[tag=wpUsing] run scoreboard players reset * warpTempID
#	tag @a remove warpNoIter
#	execute as @a at @s positioned ~-5 ~-5 ~-5 if entity @e[tag=warpLocIcon,dx=10,dy=10,dz=10] run tag @s add warpNoIter
#	execute if entity @a[tag=wpUsing,tag=!warpNoIter] run function warppad:iterate

#Unselect any selected icons -- PREWARP
#	tag @e remove SelCastIcon

#Selects the marker if the player is looking at it -- PREWARP
#	execute as @a[tag=wpUsing] at @s run function warppad:warpselect

#Goes through every player who needs to teleport and flags them and their passengers as needing to teleport, then looks for the warp pad with the matching ID and teleports them. Finally, passengers regain their offset. -- PREWARP
#	tag @e remove wsIterated
#	tag @e remove warpPilot
#	tag @e remove wlIterated
#	tag @e remove wpActivePass
#	execute as @a[tag=wpUsing,scores={sneakClick=1..}] at @s at @e[tag=warpPad,limit=1,sort=nearest] positioned ~-5 ~-5 ~-5 if entity @e[tag=SelCastIcon,dx=10,dy=10,dz=10] positioned ~5 ~5 ~5 run function warppad:warpsetup

#Resets "sneakClick" so that if the player isn't sneaking in the next tick, it won't be active. -- PREWARP
#	scoreboard players set @a sneakClick 0