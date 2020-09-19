#Changes each warp pad's color based on what item is thrown on them
	scoreboard players set @s wp.modSucc 0
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:red_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 1 run scoreboard players set @s wp.iconColor 1
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:green_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 2 run scoreboard players set @s wp.iconColor 2
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:purple_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 3 run scoreboard players set @s wp.iconColor 3
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:cyan_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 4 run scoreboard players set @s wp.iconColor 4
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:light_gray_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 5 run scoreboard players set @s wp.iconColor 5
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:gray_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 6 run scoreboard players set @s wp.iconColor 6
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:pink_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 7 run scoreboard players set @s wp.iconColor 7
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:lime_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 8 run scoreboard players set @s wp.iconColor 8
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:yellow_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 9 run scoreboard players set @s wp.iconColor 9
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 10 run scoreboard players set @s wp.iconColor 10
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:magenta_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 11 run scoreboard players set @s wp.iconColor 11
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:orange_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 12 run scoreboard players set @s wp.iconColor 12
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:blue_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 13 run scoreboard players set @s wp.iconColor 13
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:brown_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 14 run scoreboard players set @s wp.iconColor 14
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:black_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 15 run scoreboard players set @s wp.iconColor 15
	execute if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:white_dye",Count:1b}},limit=1,sort=nearest] store success score @s wp.modSucc unless score @s wp.iconColor matches 16 run scoreboard players set @s wp.iconColor 16

	execute if score @s wp.modSucc matches 1 at @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,limit=1,sort=nearest,dx=0,dy=0,dz=0] run particle witch ~ ~ ~ 0 0 0 0.2 25

	execute if score @s wp.modSucc matches 1 run kill @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,limit=1,sort=nearest,dx=0,dy=0,dz=0]

	execute if data entity @e[type=item,nbt={Item:{id:"minecraft:paper",Count:1b}},limit=1,sort=nearest,distance=..0.1] Item.tag.display.Name run function smoochypit:warppad/creation/warpmod/rename
	execute if data entity @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:1b}},limit=1,sort=nearest,distance=..0.1] Thrower[0] if score @s wp.linkedUUID matches 0 run function smoochypit:warppad/creation/warpmod/private
	execute if entity @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:1b}},limit=1,sort=nearest,distance=..0.1] unless score @s wp.streamFreq matches 64.. run function smoochypit:warppad/creation/warpmod/frequency