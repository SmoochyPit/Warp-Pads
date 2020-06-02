#This file is unused. It was an early cosmetics file.

execute as @a[tag=wpUsing] at @s run scoreboard players set @e[tag=warpPad,distance=..5,limit=1,scores={anim1time=100..}] anim1time 0
execute as @a[tag=wpUsing] at @s run scoreboard players add @e[tag=warpPad,distance=..5,limit=1] anim1time 1
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~ ~-.25 ~2 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~1.4 ~-.25 ~1.4 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~ ~-.25 ~-2 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~-1.4 ~-.25 ~1.4 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~2 ~-.25 ~ 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~1.4 ~-.25 ~-1.4 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~-2 ~-.25 ~ 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~-1.4 ~-.25 ~-1.4 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~1.85 ~-.25 ~.77 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~-1.85 ~-.25 ~.77 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~1.85 ~-.25 ~-.77 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~-1.85 ~-.25 ~-.77 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~.77 ~-.25 ~1.85 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~-.77 ~-.25 ~1.85 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~.77 ~-.25 ~-1.85 0 0 0 0 1 force @a
execute as @a[tag=wpUsing] at @s at @e[tag=warpPad,distance=..5,limit=1] run particle flame ~-.77 ~-.25 ~-1.85 0 0 0 0 1 force @a
execute as @e[tag=warpLocIcon,tag=!SelCastIcon] at @s run particle minecraft:dust 1 0 1 1 ~ ~ ~ 0 0 0 1 1 force @a
execute as @e[tag=warpLocIcon,tag=SelCastIcon] at @s run particle minecraft:dust 0.25 0 1 1 ~ ~ ~ 0 0 0 1 1 force @a