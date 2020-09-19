#Creates and positions the icon

#Creates a temporary marker above current use wp.pad
	summon armor_stand ~ ~1.12 ~ {Silent:true,Marker:true,Invisible:true,NoGravity:true,Tags:["wp.locTemp"]}

#Positions that armor stand
	execute at @e[tag=wp.locTemp] run tp @e[tag=wp.locTemp,limit=1] ~ ~ ~ facing entity @s
	execute as @e[tag=wp.locTemp] at @s run tp @s ^ ^ ^2
	execute as @e[tag=wp.locTemp] at @s unless block ~ ~ ~ #smoochypit:warppad/air run function smoochypit:warppad/iterate/post/iconalignback

#Summon wp.locIcon- Creates an Armor Stand that can indicates direction for the user.
	execute at @e[tag=wp.locTemp,limit=1] run summon armor_stand ~ ~ ~ {Marker:true,NoGravity:true,Invisible:true,Tags:["wp.locIcon"]}

#Copy over name, color, etc
	execute at @e[tag=wp.locTemp,limit=1] at @e[tag=wp.locIcon,distance=..0.1,limit=1,sort=nearest] if data entity @s CustomName run data modify entity @e[tag=wp.locIcon,distance=..0.1,limit=1,sort=nearest] CustomName set from entity @s CustomName
	execute at @e[tag=wp.locTemp,limit=1] at @e[tag=wp.locIcon,distance=..0.1,limit=1,sort=nearest] run scoreboard players operation @e[tag=wp.locIcon,distance=..0.1,limit=1,sort=nearest] wp.iconColor = @s wp.iconColor

#Scoreboard Identifiers- Increments selected warp pad ID by 1 and all "uniterated warp pads" by 1
	scoreboard players add @e[tag=wp.pad,tag=!wp.padIterated,tag=!wp.sourcePad,tag=!wp.hasSelect] wp.tempID 1
	scoreboard players add @s[tag=!wp.hasSelect] wp.tempID 1
	execute at @e[tag=wp.locTemp,limit=1] run scoreboard players operation @e[tag=wp.locIcon,distance=..0.1,limit=1,sort=nearest] wp.tempID = @s wp.tempID
	tag @s add wp.hasSelect

	tp @e[tag=wp.locTemp] ~ -1000 ~
	kill @e[tag=wp.locTemp]