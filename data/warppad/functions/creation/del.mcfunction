#Destruction of warp pads
#Legacy Private Warp Pad Fix
	execute if entity @e[tag=wp.pad,tag=wp.legacyPrivPad] run function warppad:creation/legacydel
#Level 1 Warp Pad
	execute as @e[tag=wp.pad1] at @s unless block ~ ~-1 ~ gold_block run particle witch ~ ~-1 ~ 0 0 0 0.5 25
	execute as @e[tag=wp.pad1] at @s unless block ~ ~-1 ~ gold_block run forceload remove ~ ~ 
	execute as @e[tag=wp.pad1] at @s unless block ~ ~-1 ~ gold_block unless score @s wp.streamFreq matches 0 run summon item ~ ~-1 ~ {Tags:["wp.redstonedrop"],Item:{id:"minecraft:redstone",Count:1b},PickupDelay:25s}
	execute as @e[tag=wp.pad1] at @s unless block ~ ~-1 ~ gold_block unless score @s wp.streamFreq matches 0 positioned ~ ~-1 ~ store result entity @e[tag=wp.redstonedrop,limit=1,sort=nearest] Item.Count byte 1.0 run scoreboard players get @s wp.streamFreq
	execute as @e[tag=wp.pad1] at @s unless block ~ ~-1 ~ gold_block unless score @s wp.linkedUUID matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:diamond",Count:1b},PickupDelay:25s}
	execute as @e[tag=wp.pad1] at @s unless block ~ ~-1 ~ gold_block run summon item ~ ~-1 ~ {Tags:["wp.maindrop"],Item:{id:"minecraft:golden_apple",Count:1b},PickupDelay:25s}
	execute as @e[tag=wp.pad1] at @s unless block ~ ~-1 ~ gold_block run data modify entity @e[tag=wp.maindrop,limit=1,sort=nearest] Item.tag.display.Name set from entity @s CustomName
	execute as @e[tag=wp.pad1] at @s unless block ~ ~-1 ~ gold_block run kill @s
#Level 2 Warp Pad
	execute as @e[tag=wp.pad2] at @s unless block ~ ~-1 ~ emerald_block run particle witch ~ ~-1 ~ 0 0 0 0.5 25
	execute as @e[tag=wp.pad2] at @s unless block ~ ~-1 ~ emerald_block run forceload remove ~ ~
	execute as @e[tag=wp.pad2] at @s unless block ~ ~-1 ~ emerald_block unless score @s wp.streamFreq matches 0 run summon item ~ ~-1 ~ {Tags:["wp.redstonedrop"],Item:{id:"minecraft:redstone",Count:1b},PickupDelay:25s}
	execute as @e[tag=wp.pad2] at @s unless block ~ ~-1 ~ emerald_block unless score @s wp.streamFreq matches 0 positioned ~ ~-1 ~ store result entity @e[tag=wp.redstonedrop,limit=1,sort=nearest] Item.Count byte 1.0 run scoreboard players get @s wp.streamFreq
	execute as @e[tag=wp.pad2] at @s unless block ~ ~-1 ~ emerald_block unless score @s wp.linkedUUID matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:diamond",Count:1b},PickupDelay:25s}
	execute as @e[tag=wp.pad2] at @s unless block ~ ~-1 ~ emerald_block run summon item ~ ~-1 ~ {Tags:["wp.maindrop"],Item:{id:"minecraft:ghast_tear",Count:1b},PickupDelay:25s}
	execute as @e[tag=wp.pad2] at @s unless block ~ ~-1 ~ emerald_block run data modify entity @e[tag=wp.maindrop,limit=1,sort=nearest] Item.tag.display.Name set from entity @s CustomName
	execute as @e[tag=wp.pad2] at @s unless block ~ ~-1 ~ emerald_block run kill @s
#Level 3 Warp Pad
	execute as @e[tag=wp.pad3] at @s unless block ~ ~-1 ~ diamond_block run particle witch ~ ~-1 ~ 0 0 0 0.5 25
	execute as @e[tag=wp.pad3] at @s unless block ~ ~-1 ~ diamond_block run forceload remove ~ ~ 
	execute as @e[tag=wp.pad3] at @s unless block ~ ~-1 ~ diamond_block unless score @s wp.streamFreq matches 0 run summon item ~ ~-1 ~ {Tags:["wp.redstonedrop"],Item:{id:"minecraft:redstone",Count:1b},PickupDelay:25s}
	execute as @e[tag=wp.pad3] at @s unless block ~ ~-1 ~ diamond_block unless score @s wp.streamFreq matches 0 positioned ~ ~-1 ~ store result entity @e[tag=wp.redstonedrop,limit=1,sort=nearest] Item.Count byte 1.0 run scoreboard players get @s wp.streamFreq
	execute as @e[tag=wp.pad3] at @s unless block ~ ~-1 ~ diamond_block unless score @s wp.linkedUUID matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:diamond",Count:1b},PickupDelay:25s}
	execute as @e[tag=wp.pad3] at @s unless block ~ ~-1 ~ diamond_block run summon item ~ ~-1 ~ {Tags:["wp.maindrop"],Item:{id:"minecraft:nether_star",Count:1b},PickupDelay:25s}
	execute as @e[tag=wp.pad3] at @s unless block ~ ~-1 ~ diamond_block run data modify entity @e[tag=wp.maindrop,limit=1,sort=nearest] Item.tag.display.Name set from entity @s CustomName
	execute as @e[tag=wp.pad3] at @s unless block ~ ~-1 ~ diamond_block run kill @s