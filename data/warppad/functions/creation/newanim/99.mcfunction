particle witch ~ ~0.25 ~ 0 0 0 0.5 25 normal @a[distance=..25]
execute at @s[tag=wp.spawn1] align xyz positioned ~.5 ~.5 ~.5 run summon armor_stand ~ ~ ~ {Marker:true,Invisible:true,NoGravity:true,Tags:["wp.pad","wp.pad1"]}
execute at @s[tag=wp.spawn2] align xyz positioned ~.5 ~.5 ~.5 run summon armor_stand ~ ~ ~ {Marker:true,Invisible:true,NoGravity:true,Tags:["wp.pad","wp.pad2"]}
execute at @s[tag=wp.spawn3] align xyz positioned ~.5 ~.5 ~.5 run summon armor_stand ~ ~ ~ {Marker:true,Invisible:true,NoGravity:true,Tags:["wp.pad","wp.pad3"]}
execute as @e[tag=wp.pad,distance=..1,limit=1] run function warppad:creation/newanim/post