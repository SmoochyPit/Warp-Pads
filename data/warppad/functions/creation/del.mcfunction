#Destruction of warp pads
#Level 1 Warp Pad
	execute as @e[tag=warpPad1] at @s unless block ~ ~-1 ~ gold_block run particle witch ~ ~-1 ~ 0 0 0 0.5 25
	execute as @e[tag=warpPad1] at @s unless block ~ ~-1 ~ gold_block run forceload remove ~ ~ 
	execute as @e[tag=warpPad1] at @s unless block ~ ~-1 ~ gold_block unless score @s warpStreamFreq matches 0 run summon item ~ ~-1 ~ {Tags:["redstonedrop"],Item:{id:"minecraft:redstone",Count:1b},PickupDelay:25s}
	execute as @e[tag=warpPad1] at @s unless block ~ ~-1 ~ gold_block unless score @s warpStreamFreq matches 0 positioned ~ ~-1 ~ store result entity @e[tag=redstonedrop,limit=1,sort=nearest] Item.Count byte 1.0 run scoreboard players get @s warpStreamFreq
	execute as @e[tag=warpPad1] at @s unless block ~ ~-1 ~ gold_block unless score @s linkedUUIDM matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:diamond",Count:1b},PickupDelay:25s}
	execute as @e[tag=warpPad1] at @s unless block ~ ~-1 ~ gold_block run summon item ~ ~-1 ~ {Tags:["maindrop"],Item:{id:"minecraft:golden_apple",Count:1b},PickupDelay:25s}
	execute as @e[tag=warpPad1] at @s unless block ~ ~-1 ~ gold_block run data modify entity @e[tag=maindrop,limit=1,sort=nearest] Item.tag.display.Name set from entity @s CustomName
	execute as @e[tag=warpPad1] at @s unless block ~ ~-1 ~ gold_block run kill @s
#Level 2 Warp Pad
	execute as @e[tag=warpPad2] at @s unless block ~ ~-1 ~ emerald_block run particle witch ~ ~-1 ~ 0 0 0 0.5 25
	execute as @e[tag=warpPad2] at @s unless block ~ ~-1 ~ emerald_block run forceload remove ~ ~
	execute as @e[tag=warpPad2] at @s unless block ~ ~-1 ~ emerald_block unless score @s warpStreamFreq matches 0 run summon item ~ ~-1 ~ {Tags:["redstonedrop"],Item:{id:"minecraft:redstone",Count:1b},PickupDelay:25s}
	execute as @e[tag=warpPad2] at @s unless block ~ ~-1 ~ emerald_block unless score @s warpStreamFreq matches 0 positioned ~ ~-1 ~ store result entity @e[tag=redstonedrop,limit=1,sort=nearest] Item.Count byte 1.0 run scoreboard players get @s warpStreamFreq
	execute as @e[tag=warpPad2] at @s unless block ~ ~-1 ~ emerald_block unless score @s linkedUUIDL matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:diamond",Count:1b},PickupDelay:25s}
	execute as @e[tag=warpPad2] at @s unless block ~ ~-1 ~ emerald_block run summon item ~ ~-1 ~ {Tags:["maindrop"],Item:{id:"minecraft:ghast_tear",Count:1b},PickupDelay:25s}
	execute as @e[tag=warpPad2] at @s unless block ~ ~-1 ~ emerald_block run data modify entity @e[tag=maindrop,limit=1,sort=nearest] Item.tag.display.Name set from entity @s CustomName
	execute as @e[tag=warpPad2] at @s unless block ~ ~-1 ~ emerald_block run kill @s
#Level 3 Warp Pad
	execute as @e[tag=warpPad3] at @s unless block ~ ~-1 ~ diamond_block run particle witch ~ ~-1 ~ 0 0 0 0.5 25
	execute as @e[tag=warpPad3] at @s unless block ~ ~-1 ~ diamond_block run forceload remove ~ ~ 
	execute as @e[tag=warpPad3] at @s unless block ~ ~-1 ~ diamond_block unless score @s warpStreamFreq matches 0 run summon item ~ ~-1 ~ {Tags:["redstonedrop"],Item:{id:"minecraft:redstone",Count:1b},PickupDelay:25s}
	execute as @e[tag=warpPad3] at @s unless block ~ ~-1 ~ diamond_block unless score @s warpStreamFreq matches 0 positioned ~ ~-1 ~ store result entity @e[tag=redstonedrop,limit=1,sort=nearest] Item.Count byte 1.0 run scoreboard players get @s warpStreamFreq
	execute as @e[tag=warpPad3] at @s unless block ~ ~-1 ~ diamond_block unless score @s linkedUUIDL matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:diamond",Count:1b},PickupDelay:25s}
	execute as @e[tag=warpPad3] at @s unless block ~ ~-1 ~ diamond_block run summon item ~ ~-1 ~ {Tags:["maindrop"],Item:{id:"minecraft:nether_star",Count:1b},PickupDelay:25s}
	execute as @e[tag=warpPad3] at @s unless block ~ ~-1 ~ diamond_block run data modify entity @e[tag=maindrop,limit=1,sort=nearest] Item.tag.display.Name set from entity @s CustomName
	execute as @e[tag=warpPad3] at @s unless block ~ ~-1 ~ diamond_block run kill @s
