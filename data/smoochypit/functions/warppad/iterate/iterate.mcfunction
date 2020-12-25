#This gets really really hard to follow. Stay with me, though.
#Source Pad
	tag @e remove wp.sourcePad
	execute align xyz run tag @e[tag=wp.pad,dx=0,dy=0,dz=0,limit=1] add wp.sourcePad
	scoreboard players set @e[tag=wp.sourcePad] wp.negativeOne -1

#Tag every warp pad within a range
#Remove Tags
	tag @e[tag=wp.pad] remove wp.inTier1
	tag @e[tag=wp.pad] remove wp.inTier2
	tag @e[tag=wp.pad] remove wp.inTier3
	tag @s remove wp.onTier1
	tag @s remove wp.onTier2
	tag @s remove wp.onTier3
#For players and what pad they're on
	execute if entity @e[tag=wp.pad1,dx=0,dy=0,dz=0,limit=1] run tag @s add wp.onTier1
	execute if entity @e[tag=wp.pad2,dx=0,dy=0,dz=0,limit=1] run tag @s add wp.onTier2
	execute if entity @e[tag=wp.pad3,dx=0,dy=0,dz=0,limit=1] run tag @s add wp.onTier3

	execute as @e[tag=wp.pad] at @s run function smoochypit:warppad/iterate/circleop

#Add warp pads that meet criteria in the dimension
	function smoochypit:warppad/iterate/dimension

#Remove private warp pads if their UUID doesn't match that of the player
	execute as @e[tag=wp.pad,tag=wp.inTier1] unless score @s wp.linkedUUID matches 0 unless score @s wp.linkedUUID = @p[tag=wp.using] wp.linkedUUID run tag @s remove wp.inTier1
	execute as @e[tag=wp.pad,tag=wp.inTier2] unless score @s wp.linkedUUID matches 0 unless score @s wp.linkedUUID = @p[tag=wp.using] wp.linkedUUID run tag @s remove wp.inTier2
	execute as @e[tag=wp.pad,tag=wp.inTier3] unless score @s wp.linkedUUID matches 0 unless score @s wp.linkedUUID = @p[tag=wp.using] wp.linkedUUID run tag @s remove wp.inTier3

#Remove warp pads with different frequencies
	execute as @e[tag=wp.pad,tag=wp.inTier1] unless score @s wp.streamFreq = @e[tag=wp.sourcePad,limit=1] wp.streamFreq run tag @s remove wp.inTier1
	execute as @e[tag=wp.pad,tag=wp.inTier2] unless score @s wp.streamFreq = @e[tag=wp.sourcePad,limit=1] wp.streamFreq run tag @s remove wp.inTier2
	execute as @e[tag=wp.pad,tag=wp.inTier3] unless score @s wp.streamFreq = @e[tag=wp.sourcePad,limit=1] wp.streamFreq run tag @s remove wp.inTier3

#For every player using a warp pad, run iterate2
	tag @e remove wp.padIterated
	execute as @e[tag=wp.sourcePad,limit=1] unless entity @s[tag=wp.hasSelect] run scoreboard players set @s wp.tempID 1
	execute as @e[tag=wp.sourcePad,limit=1] unless entity @s[tag=wp.hasSelect] run tag @s add wp.hasSelect
	execute if entity @e[tag=wp.pad,distance=..1] at @e[tag=wp.pad1,distance=..1,limit=1] run function smoochypit:warppad/iterate/post/warp1
	execute if entity @e[tag=wp.pad,distance=..1] at @e[tag=wp.pad2,distance=..1,limit=1] run function smoochypit:warppad/iterate/post/warp2
	execute if entity @e[tag=wp.pad,distance=..1] at @e[tag=wp.pad3,distance=..1,limit=1] run function smoochypit:warppad/iterate/post/warp3
	tag @s add wp.iterated

#Again for each player who needs it fam
	execute as @p[tag=wp.using,tag=!wp.iterated,tag=!wp.noIterate] at @s align xyz run function smoochypit:warppad/iterate/iterate