#Controls the animation and stuff.
	scoreboard players add @e[scores={warpSpawnAnim=1..}] warpSpawnAnim 1
	scoreboard players set @e[scores={warpSpawnAnim=100..}] warpSpawnAnim 0

#Animation- The particle effects for the creation of a warp pad.
	execute as @e[scores={warpSpawnAnim=1..50},tag=warpSpawn1] at @s unless entity @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:quartz",Count:4b}}] run scoreboard players set @s warpSpawnAnim 0
	execute as @e[scores={warpSpawnAnim=1..50},tag=warpSpawn2] at @s unless entity @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:phantom_membrane",Count:4b}}] run scoreboard players set @s warpSpawnAnim 0
	execute as @e[scores={warpSpawnAnim=1..50},tag=warpSpawn3] at @s unless entity @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:ender_eye",Count:4b}}] run scoreboard players set @s warpSpawnAnim 0
	execute as @e[scores={warpSpawnAnim=1..98}] at @s unless entity @s[nbt={Item:{Count:1b}}] run scoreboard players set @s warpSpawnAnim 0
	execute as @e[scores={warpSpawnAnim=1..}] run data merge entity @s {PickupDelay:10s}
	execute at @e[scores={warpSpawnAnim=1..},tag=warpSpawn1] as @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:quartz",Count:4b}}] run data merge entity @s {PickupDelay:10s,Motion:[0.0,0.0,0.0],NoGravity:true}
	execute at @e[scores={warpSpawnAnim=1..},tag=warpSpawn2] as @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:phantom_membrane",Count:4b}}] run data merge entity @s {PickupDelay:10s,Motion:[0.0,0.0,0.0],NoGravity:true}
	execute at @e[scores={warpSpawnAnim=1..},tag=warpSpawn3] as @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:ender_eye",Count:4b}}] run data merge entity @s {PickupDelay:10s,Motion:[0.0,0.0,0.0],NoGravity:true}
	execute at @e[scores={warpSpawnAnim=1..25}] run particle portal ~ ~0.2 ~ 0 0 0 1 10 normal @a[distance=..25]
	#execute at @e[scores={warpSpawnAnim=1..100}] align xyz positioned ~0.5 ~0.5 ~0.5 run particle enchanted_hit ~ ~ ~ 0 0 0 0.2 5
	execute at @e[scores={warpSpawnAnim=50},tag=warpSpawn1] align xyz run kill @e[dx=0,dy=0,dz=0,type=item,nbt={Item:{id:"minecraft:quartz",Count:4b}}]
	execute at @e[scores={warpSpawnAnim=50},tag=warpSpawn2] align xyz run kill @e[dx=0,dy=0,dz=0,type=item,nbt={Item:{id:"minecraft:phantom_membrane",Count:4b}}]
	execute at @e[scores={warpSpawnAnim=50},tag=warpSpawn3] align xyz run kill @e[dx=0,dy=0,dz=0,type=item,nbt={Item:{id:"minecraft:ender_eye",Count:4b}}]
	execute at @e[scores={warpSpawnAnim=50}] align xyz positioned ~0.5 ~0.25 ~0.5 run particle witch ~ ~ ~ 0 0 0 0.2 25
	execute at @e[scores={warpSpawnAnim=25..50}] run particle portal ~ ~0.25 ~ 0 0.1 0 2 100 normal @a[distance=..25]
	#execute at @e[scores={warpSpawnAnim=199}] run particle item blue_terracotta ~ ~ ~ 0 0 0 0.8 100
	execute at @e[scores={warpSpawnAnim=99}] run particle witch ~ ~0.25 ~ 0 0 0 0.5 25

#This is where it creates the warp pad.
#Level 1 Warp Pad
	execute at @e[scores={warpSpawnAnim=99},tag=warpSpawn1] align xyz positioned ~.5 ~.5 ~.5 run summon armor_stand ~ ~ ~ {Marker:true,Invisible:true,NoGravity:true,Tags:["warpPad","warpPad1"]}
	execute at @e[scores={warpSpawnAnim=99},tag=warpSpawn2] align xyz positioned ~.5 ~.5 ~.5 run summon armor_stand ~ ~ ~ {Marker:true,Invisible:true,NoGravity:true,Tags:["warpPad","warpPad2"]}
	execute at @e[scores={warpSpawnAnim=99},tag=warpSpawn3] align xyz positioned ~.5 ~.5 ~.5 run summon armor_stand ~ ~ ~ {Marker:true,Invisible:true,NoGravity:true,Tags:["warpPad","warpPad3"]}
	execute as @e[scores={warpSpawnAnim=99}] at @s as @e[tag=warpPad,distance=..1,limit=1] at @s if data entity @e[type=item,distance=..1,limit=1,sort=nearest] Item.tag.display.Name run data modify entity @s CustomName set from entity @e[scores={warpSpawnAnim=99},type=item,distance=..1,limit=1,sort=nearest] Item.tag.display.Name
	execute as @e[scores={warpSpawnAnim=99}] at @s as @e[tag=warpPad,distance=..1,limit=1] at @s run forceload add ~ ~
	execute as @e[scores={warpSpawnAnim=99},tag=warpSpawn1] at @s as @e[tag=warpPad,distance=..1,limit=1] at @s run advancement grant @a[distance=..15,advancements={warppad:warppad1=false}] only warppad:warppad1
	execute as @e[scores={warpSpawnAnim=99},tag=warpSpawn2] at @s as @e[tag=warpPad,distance=..1,limit=1] at @s run advancement grant @a[distance=..15,advancements={warppad:warppad2=false}] only warppad:warppad2
	execute as @e[scores={warpSpawnAnim=99},tag=warpSpawn3] at @s as @e[tag=warpPad,distance=..1,limit=1] at @s run advancement grant @a[distance=..15,advancements={warppad:warppad3=false}] only warppad:warppad3
	execute as @e[scores={warpSpawnAnim=99}] run function warppad:setdefaults
	execute as @e[scores={warpSpawnAnim=99}] run kill @s