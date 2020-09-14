data merge entity @s {PickupDelay:10s}
execute if entity @s[tag=wp.spawn1] as @e[distance=..0.5,tag=wp.quartz4] run data merge entity @s {PickupDelay:10s,Motion:[0.0,0.0,0.0],NoGravity:true}
execute if entity @s[tag=wp.spawn2] as @e[distance=..0.5,tag=wp.phantom_membrane4] run data merge entity @s {PickupDelay:10s,Motion:[0.0,0.0,0.0],NoGravity:true}
execute if entity @s[tag=wp.spawn3] as @e[distance=..0.5,tag=wp.ender_eye4] run data merge entity @s {PickupDelay:10s,Motion:[0.0,0.0,0.0],NoGravity:true}