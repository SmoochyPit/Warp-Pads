particle witch ~ ~-1 ~ 0 0 0 0.5 25
forceload remove ~ ~
execute unless score @s wp.streamFreq matches 0 run summon item ~ ~-1 ~ {Tags:["wp.redstonedrop"],Item:{id:"minecraft:redstone",Count:1b},PickupDelay:25s}
execute unless score @s wp.streamFreq matches 0 positioned ~ ~-1 ~ store result entity @e[tag=wp.redstonedrop,limit=1,sort=nearest] Item.Count byte 1.0 run scoreboard players get @s wp.streamFreq
execute unless score @s wp.linkedUUID matches 0 run summon item ~ ~-1 ~ {Item:{id:"minecraft:diamond",Count:1b},PickupDelay:25s}