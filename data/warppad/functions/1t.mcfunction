#This file runs every tick -- Use with caution!

#Tag player if they're using a warp pad
	execute as @e[tag=wp.pad] at @s align xyz as @a[dx=0,dy=0,dz=0,tag=!global.ignore,tag=!global.ignore.pos,limit=1,scores={wp.cooldown=0}] at @s unless entity @a[tag=wp.using,distance=..4] if block ~ ~-1 ~ gold_block run tag @s add wp.using
	execute as @e[tag=wp.pad] at @s align xyz as @a[dx=0,dy=0,dz=0,tag=!global.ignore,tag=!global.ignore.pos,limit=1,scores={wp.cooldown=0}] at @s unless entity @a[tag=wp.using,distance=..4] if block ~ ~-1 ~ emerald_block run tag @s add wp.using
	execute as @e[tag=wp.pad] at @s align xyz as @a[dx=0,dy=0,dz=0,tag=!global.ignore,tag=!global.ignore.pos,limit=1,scores={wp.cooldown=0}] at @s unless entity @a[tag=wp.using,distance=..4] if block ~ ~-1 ~ diamond_block run tag @s add wp.using
	execute as @a[tag=wp.using] at @s align xyz unless entity @e[tag=wp.pad,dx=0,dy=0,dz=0] run tag @s remove wp.using

#Run if a warp pad has an item on it
	scoreboard players add @e[type=item,tag=!global.ignore,tag=!global.ignore.kill] wp.spawnAnim 0

	execute at @e[tag=wp.pad] align xyz if entity @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,dx=0,dy=0,dz=0] run function warppad:precreation

	execute as @e[scores={wp.spawnAnim=0},type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:golden_apple",Count:1b}}] at @s if block ~ ~-1 ~ gold_block run function warppad:creation/new
	execute as @e[scores={wp.spawnAnim=0},type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:ghast_tear",Count:1b}}] at @s if block ~ ~-1 ~ emerald_block run function warppad:creation/new
	execute as @e[scores={wp.spawnAnim=0},type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] at @s if block ~ ~-1 ~ diamond_block run function warppad:creation/new

	execute if entity @e[scores={wp.spawnAnim=1..}] run function warppad:creation/newanim

	execute at @e[tag=wp.pad] unless block ~ ~-1 ~ #warppad:warpblocks run function warppad:creation/del

#Tag warp pads with global.ignore.pos and global.ignore

	tag @e[tag=wp.pad,tag=!global.ignore.pos] add global.ignore.pos
	tag @e[tag=wp.pad,tag=!global.ignore] add global.ignore

#Run prewarp if any players have wpUsing
    execute if entity @a[tag=wp.using] run function warppad:prewarp

#Cosmetics
    execute as @a[tag=wp.using] at @s run function warppad:cosmetics/cosmetics

#Cooldown message
    execute as @a[tag=!global.ignore,tag=!global.ignore.gui,tag=wp.spamHalt,scores={wp.guitimer=0}] at @s align xyz if entity @e[tag=wp.pad,dx=0,dy=0,dz=0] run title @s actionbar {"text":"You've warped too fast. Please wait...","color":"red"}
	execute as @a[tag=!global.ignore,tag=global.ignore.gui,tag=wp.spamHalt,scores={wp.guitimer=1..}] at @s align xyz if entity @e[tag=wp.pad,dx=0,dy=0,dz=0] run title @s actionbar {"text":"You've warped too fast. Please wait...","color":"red"}
	execute as @a[tag=!global.ignore,tag=!global.ignore.gui,tag=wp.spamHalt] at @s align xyz if entity @e[tag=wp.pad,dx=0,dy=0,dz=0] run scoreboard players set @s wp.guitimer 1
	execute as @a[tag=!global.ignore,tag=!global.ignore.gui,tag=wp.spamHalt] at @s align xyz if entity @e[tag=wp.pad,dx=0,dy=0,dz=0] run tag @s add global.ignore.gui

#Reset ID system if no players are using a warp pad
    execute unless entity @a[tag=wp.using] run tag @e remove wp.hasSelect
	execute unless entity @a[tag=wp.using] run scoreboard players reset * wp.tempID

#Remove wpIterated on all non-warping players
    tag @a[tag=!wp.using] remove wp.iterated

#Destroy unused markers after warp pad use
	execute as @e[tag=wp.locIcon] at @s positioned ~-5 ~-5 ~-5 unless entity @a[tag=wp.using,dx=10,dy=10,dz=10] run tp @s ~5 -1000 ~5
	execute as @e[tag=wp.locIcon] at @s positioned ~-5 ~-5 ~-5 unless entity @a[tag=wp.using,dx=10,dy=10,dz=10] run kill @s

#Resets "sneakClick" so that if the player isn't sneaking in the next tick, it won't be active.
	scoreboard players set @a wp.sneakClick 0