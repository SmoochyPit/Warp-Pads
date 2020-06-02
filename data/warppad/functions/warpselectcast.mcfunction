#Basic Raycast- for a whole 4 blocks.
tp @s ^ ^ ^0.25
tag @e[tag=warpLocIcon,distance=..0.25,limit=1,sort=nearest] add SelCastIcon
execute as @s at @s unless entity @e[tag=SelCastIcon] if entity @a[tag=currentSelCast,distance=..4] run function warppad:warpselectcast