#Basic Raycast- for a whole 4 blocks.
tp @s ^ ^ ^0.25
tag @e[tag=wp.locIcon,distance=..0.25,limit=1,sort=nearest] add wp.selCastIcon
execute as @s at @s unless entity @e[tag=wp.selCastIcon] if entity @a[tag=wp.selCast,distance=..4] run function warppad:selection/cast