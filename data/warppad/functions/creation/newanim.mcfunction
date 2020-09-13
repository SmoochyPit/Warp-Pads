#Note: Under normal circumstances, no items with !global.ignore or tag=!global.ignore.kill should have wp.spawnAnim > 0

#Controls the animation and stuff.
	scoreboard players add @e[tag=!global.ignore,scores={wp.spawnAnim=1..}] wp.spawnAnim 1
	scoreboard players set @e[tag=!global.ignore,scores={wp.spawnAnim=100..}] wp.spawnAnim 0

#Animation- The particle effects for the creation of a warp pad.
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=1..50},tag=wp.spawn1] at @s unless entity @e[distance=..0.5,tag=!global.ignore,tag=!global.ignore.kill,type=item,nbt={Item:{id:"minecraft:quartz",Count:4b}}] run scoreboard players set @s wp.spawnAnim 0
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=1..50},tag=wp.spawn2] at @s unless entity @e[distance=..0.5,tag=!global.ignore,tag=!global.ignore.kill,type=item,nbt={Item:{id:"minecraft:phantom_membrane",Count:4b}}] run scoreboard players set @s wp.spawnAnim 0
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=1..50},tag=wp.spawn3] at @s unless entity @e[distance=..0.5,tag=!global.ignore,tag=!global.ignore.kill,type=item,nbt={Item:{id:"minecraft:ender_eye",Count:4b}}] run scoreboard players set @s wp.spawnAnim 0
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=1..98}] at @s unless entity @s[nbt={Item:{Count:1b}}] run scoreboard players set @s wp.spawnAnim 0
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=1..}] run data merge entity @s {PickupDelay:10s}
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=1..},tag=wp.spawn1] as @e[distance=..0.5,type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:quartz",Count:4b}}] run data merge entity @s {PickupDelay:10s,Motion:[0.0,0.0,0.0],NoGravity:true}
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=1..},tag=wp.spawn2] as @e[distance=..0.5,type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:phantom_membrane",Count:4b}}] run data merge entity @s {PickupDelay:10s,Motion:[0.0,0.0,0.0],NoGravity:true}
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=1..},tag=wp.spawn3] as @e[distance=..0.5,type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:ender_eye",Count:4b}}] run data merge entity @s {PickupDelay:10s,Motion:[0.0,0.0,0.0],NoGravity:true}
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=1..25}] run particle portal ~ ~0.2 ~ 0 0 0 1 10 normal @a[distance=..25]
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=50},tag=wp.spawn1] align xyz run kill @e[dx=0,dy=0,dz=0,type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:quartz",Count:4b}}]
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=50},tag=wp.spawn2] align xyz run kill @e[dx=0,dy=0,dz=0,type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:phantom_membrane",Count:4b}}]
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=50},tag=wp.spawn3] align xyz run kill @e[dx=0,dy=0,dz=0,type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:ender_eye",Count:4b}}]
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=50}] align xyz positioned ~0.5 ~0.25 ~0.5 run particle witch ~ ~ ~ 0 0 0 0.2 25 normal @a[distance=..25]
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=25..50}] run particle portal ~ ~0.25 ~ 0 0.1 0 2 100 normal @a[distance=..25]
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=99}] run particle witch ~ ~0.25 ~ 0 0 0 0.5 25 normal @a[distance=..25]

#This is where it creates the warp pad.
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=99},tag=wp.spawn1] align xyz positioned ~.5 ~.5 ~.5 run summon armor_stand ~ ~ ~ {Marker:true,Invisible:true,NoGravity:true,Tags:["wp.pad","wp.pad1"]}
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=99},tag=wp.spawn2] align xyz positioned ~.5 ~.5 ~.5 run summon armor_stand ~ ~ ~ {Marker:true,Invisible:true,NoGravity:true,Tags:["wp.pad","wp.pad2"]}
	execute at @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=99},tag=wp.spawn3] align xyz positioned ~.5 ~.5 ~.5 run summon armor_stand ~ ~ ~ {Marker:true,Invisible:true,NoGravity:true,Tags:["wp.pad","wp.pad3"]}
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=99}] at @s as @e[tag=wp.pad,distance=..1,limit=1] at @s if data entity @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,distance=..1,limit=1,sort=nearest] Item.tag.display.Name run data modify entity @s CustomName set from entity @e[scores={wp.spawnAnim=99},tag=!global.ignore,tag=!global.ignore.kill,type=item,distance=..1,limit=1,sort=nearest] Item.tag.display.Name
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=99}] at @s as @e[tag=wp.pad,distance=..1,limit=1] at @s run forceload add ~ ~
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=99},tag=wp.spawn1] at @s as @e[tag=wp.pad,distance=..1,limit=1] at @s run advancement grant @a[distance=..15,advancements={warppad:warppad1=false}] only warppad:warppad1
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=99},tag=wp.spawn2] at @s as @e[tag=wp.pad,distance=..1,limit=1] at @s run advancement grant @a[distance=..15,advancements={warppad:warppad2=false}] only warppad:warppad2
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=99},tag=wp.spawn3] at @s as @e[tag=wp.pad,distance=..1,limit=1] at @s run advancement grant @a[distance=..15,advancements={warppad:warppad3=false}] only warppad:warppad3
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=99}] run function warppad:setup/defaults
	execute as @e[tag=!global.ignore,tag=!global.ignore.kill,scores={wp.spawnAnim=99}] run kill @s