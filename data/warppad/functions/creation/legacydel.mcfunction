#Level 1
    execute as @e[tag=warpPad1] at @s unless block ~ ~-1 ~ gold_block unless score @s linkedUUIDL matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:diamond",Count:1b},PickupDelay:25s}
    execute as @e[tag=warpPad1] at @s unless block ~ ~-1 ~ gold_block unless score @s linkedUUIDL matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:quartz",Count:4b},PickupDelay:25s}
#Level 2
    execute as @e[tag=warpPad2] at @s unless block ~ ~-1 ~ emerald_block unless score @s linkedUUIDL matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:diamond",Count:1b},PickupDelay:25s}
    execute as @e[tag=warpPad2] at @s unless block ~ ~-1 ~ emerald_block unless score @s linkedUUIDL matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:phantom_membrane",Count:4b},PickupDelay:25s}
#Level 3
    execute as @e[tag=warpPad3] at @s unless block ~ ~-1 ~ diamond_block unless score @s linkedUUIDL matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:diamond",Count:1b},PickupDelay:25s}
    execute as @e[tag=warpPad3] at @s unless block ~ ~-1 ~ diamond_block unless score @s linkedUUIDL matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:ender_eye",Count:4b},PickupDelay:25s}