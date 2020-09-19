#Note: Under normal circumstances, no items with !global.ignore or tag=!global.ignore.kill should have wp.spawnAnim > 0

#Controls the animation and stuff.
	scoreboard players add @e[tag=!global.ignore,scores={wp.spawnAnim=1..}] wp.spawnAnim 1
	scoreboard players set @e[tag=!global.ignore,scores={wp.spawnAnim=100..}] wp.spawnAnim 0

#Safe guard
	scoreboard players reset @e[tag=global.ignore,scores={wp.spawnAnim=1..}] wp.spawnAnim
	scoreboard players reset @e[tag=global.ignore.kill,scores={wp.spawnAnim=1..}] wp.spawnAnim

#If blocks are broken
	execute as @e[scores={wp.spawnAnim=1..}] at @s unless block ~ ~-1 ~ #warppad:warpblocks run scoreboard players set @s wp.spawnAnim 0

#Tag secondary items
	tag @e[type=item,tag=!global.ignore,tag=!global.ignore.kill] remove wp.quartz4
	tag @e[type=item,tag=!global.ignore,tag=!global.ignore.kill] remove wp.phantom_membrane4
	tag @e[type=item,tag=!global.ignore,tag=!global.ignore.kill] remove wp.ender_eye4
	tag @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:quartz",Count:4b}}] add wp.quartz4
	tag @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:phantom_membrane",Count:4b}}] add wp.phantom_membrane4
	tag @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,nbt={Item:{id:"minecraft:ender_eye",Count:4b}}] add wp.ender_eye4

#Main
	execute as @e[scores={wp.spawnAnim=1..}] at @s run function smoochypit:warppad/creation/newanim/1-
	execute as @e[scores={wp.spawnAnim=1..50}] at @s run function smoochypit:warppad/creation/newanim/1-50
	execute as @e[scores={wp.spawnAnim=50}] at @s align xyz run function smoochypit:warppad/creation/newanim/50
	execute as @e[scores={wp.spawnAnim=1..98}] at @s unless entity @s[nbt={Item:{Count:1b}}] run scoreboard players set @s wp.spawnAnim 0
	execute as @e[scores={wp.spawnAnim=99}] at @s run function smoochypit:warppad/creation/newanim/99

	execute at @e[scores={wp.spawnAnim=1..25}] run particle portal ~ ~0.2 ~ 0 0 0 1 10 normal @a[distance=..25]
	execute at @e[scores={wp.spawnAnim=25..50}] run particle portal ~ ~0.25 ~ 0 0.1 0 2 100 normal @a[distance=..25]