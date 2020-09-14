execute if entity @s[tag=wp.spawn1] run kill @e[dx=0,dy=0,dz=0,tag=wp.quartz4]
execute if entity @s[tag=wp.spawn2] run kill @e[dx=0,dy=0,dz=0,tag=wp.phantom_membrane4]
execute if entity @s[tag=wp.spawn3] run kill @e[dx=0,dy=0,dz=0,tag=wp.ender_eye4]
execute positioned ~0.5 ~0.25 ~0.5 run particle witch ~ ~ ~ 0 0 0 0.2 25 normal @a[distance=..25]