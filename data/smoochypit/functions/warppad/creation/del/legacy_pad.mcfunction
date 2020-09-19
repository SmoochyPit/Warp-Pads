    summon item ~ ~-1 ~ {Item:{id:"minecraft:diamond",Count:1b},PickupDelay:25s}
#Level 1
    execute unless block ~ ~-1 ~ gold_block run summon item ~ ~-1 ~ {Item:{id:"minecraft:quartz",Count:4b},PickupDelay:25s}
#Level 2
    execute unless block ~ ~-1 ~ emerald_block run summon item ~ ~-1 ~ {Item:{id:"minecraft:phantom_membrane",Count:4b},PickupDelay:25s}
#Level 3
    execute unless block ~ ~-1 ~ diamond_block run summon item ~ ~-1 ~ {Item:{id:"minecraft:ender_eye",Count:4b},PickupDelay:25s}