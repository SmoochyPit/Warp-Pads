#Creates and positions the icon

#Creates a temporary marker above current use warppad
	summon armor_stand ~ ~1.12 ~ {Silent:true,Marker:true,Invisible:true,NoGravity:true,Tags:["warpLocTemp"]}

#Positions that armor stand
	execute at @e[tag=warpLocTemp] run tp @e[tag=warpLocTemp,limit=1] ~ ~ ~ facing entity @s
	execute as @e[tag=warpLocTemp] at @s run tp @s ^ ^ ^2
	execute as @e[tag=warpLocTemp] at @s unless block ~ ~ ~ #warppad:air run function warppad:iconalignback

#Summon warpLocIcon- Creates an Armor Stand that can indicates direction for the user.
	execute at @e[tag=warpLocTemp,limit=1] run summon armor_stand ~ ~ ~ {Marker:true,NoGravity:true,Invisible:true,Tags:["warpLocIcon"]}

#Copy over name, color, etc
	execute at @e[tag=warpLocTemp,limit=1] at @e[tag=warpLocIcon,distance=..0.1,limit=1,sort=nearest] if data entity @s CustomName run data modify entity @e[tag=warpLocIcon,distance=..0.1,limit=1,sort=nearest] CustomName set from entity @s CustomName
	execute at @e[tag=warpLocTemp,limit=1] at @e[tag=warpLocIcon,distance=..0.1,limit=1,sort=nearest] run scoreboard players operation @e[tag=warpLocIcon,distance=..0.1,limit=1,sort=nearest] iconColor1 = @s iconColor1

#Scoreboard Identifiers- Increments selected warp pad ID by 1 and all "uniterated warp pads" by 1
	scoreboard players add @e[tag=warpPad,tag=!warpPadIterated,tag=!sourcePad,tag=!warpHasSelect] warpTempID 1
	scoreboard players add @s[tag=!warpHasSelect] warpTempID 1
	execute at @e[tag=warpLocTemp,limit=1] run scoreboard players operation @e[tag=warpLocIcon,distance=..0.1,limit=1,sort=nearest] warpTempID = @s warpTempID
	tag @s add warpHasSelect

	tp @e[tag=warpLocTemp] ~ -1000 ~
	kill @e[tag=warpLocTemp]