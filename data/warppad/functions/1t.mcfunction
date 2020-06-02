#This file runs every tick -- Use with caution!

#Tag player if they're using a warp pad
	execute as @e[tag=warpPad] at @s align xyz as @a[dx=0,dy=0,dz=0,limit=1,scores={warpCooldown=0}] at @s unless entity @a[tag=wpUsing,distance=..4] if block ~ ~-1 ~ gold_block run tag @s add wpUsing
	execute as @e[tag=warpPad] at @s align xyz as @a[dx=0,dy=0,dz=0,limit=1,scores={warpCooldown=0}] at @s unless entity @a[tag=wpUsing,distance=..4] if block ~ ~-1 ~ emerald_block run tag @s add wpUsing
	execute as @e[tag=warpPad] at @s align xyz as @a[dx=0,dy=0,dz=0,limit=1,scores={warpCooldown=0}] at @s unless entity @a[tag=wpUsing,distance=..4] if block ~ ~-1 ~ diamond_block run tag @s add wpUsing
	execute as @a[tag=wpUsing] at @s align xyz unless entity @e[tag=warpPad,dx=0,dy=0,dz=0] run tag @s remove wpUsing

#Run if a warp pad has an item on it
	scoreboard players add @e[type=item] warpSpawnAnim 0

	execute at @e[tag=warpPad] align xyz if entity @e[type=item,dx=0,dy=0,dz=0] run function warppad:precreation

	execute as @e[scores={warpSpawnAnim=0},type=item,nbt={Item:{id:"minecraft:golden_apple",Count:1b}}] at @s if block ~ ~-1 ~ gold_block run function warppad:creation/new
	execute as @e[scores={warpSpawnAnim=0},type=item,nbt={Item:{id:"minecraft:ghast_tear",Count:1b}}] at @s if block ~ ~-1 ~ emerald_block run function warppad:creation/new
	execute as @e[scores={warpSpawnAnim=0},type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] at @s if block ~ ~-1 ~ diamond_block run function warppad:creation/new

	execute if entity @e[scores={warpSpawnAnim=1..}] run function warppad:creation/newanim
	
	execute at @e[tag=warpPad] unless block ~ ~-1 ~ #warppad:warpblocks run function warppad:creation/del

#Run prewarp if any players have wpUsing
    execute if entity @a[tag=wpUsing] run function warppad:prewarp

#Cosmetics
    execute as @a[tag=wpUsing] at @s run function warppad:cosmetics

#Cooldown message
    execute as @a[tag=warpSpamHalt] at @s align xyz if entity @e[tag=warpPad,dx=0,dy=0,dz=0] run title @s actionbar {"text":"You've warped too fast. Please wait...","color":"red"}

#Reset ID system if no players are using a warp pad
    execute unless entity @a[tag=wpUsing] run tag @e remove warpHasSelect
	execute unless entity @a[tag=wpUsing] run scoreboard players reset * warpTempID

#Remove wpIterated on all non-warping players
    tag @a[tag=!wpUsing] remove wpIterated

#Destroy unused markers after warp pad use
	execute as @e[tag=warpLocIcon] at @s positioned ~-5 ~-5 ~-5 unless entity @a[tag=wpUsing,dx=10,dy=10,dz=10] run tp @s ~5 -1000 ~5
	execute as @e[tag=warpLocIcon] at @s positioned ~-5 ~-5 ~-5 unless entity @a[tag=wpUsing,dx=10,dy=10,dz=10] run kill @s

#Resets "sneakClick" so that if the player isn't sneaking in the next tick, it won't be active.
	scoreboard players set @a sneakClick 0