#Not just yet, though.
	scoreboard players set @s wp.cooldown 3
	tag @a[scores={wp.cooldown=1..}] remove wp.using
	scoreboard players add @s[tag=wp.onTier1] wp.spam 25
	scoreboard players add @s[tag=wp.onTier2] wp.spam 35
	scoreboard players add @s[tag=wp.onTier3] wp.spam 1

#Advancements
	scoreboard players set @s wp.passCount 0
	execute at @a[tag=wp.activePass] run scoreboard players add @s wp.passCount 1
	execute if score @s wp.passCount matches 4.. run advancement grant @s[tag=wp.pilot,advancements={smoochypit:warppad/warpgroup=false}] only smoochypit:warppad/warpgroup
	execute if entity @e[type=creeper,tag=wp.activePass] run advancement grant @s[tag=wp.pilot,advancements={smoochypit:warppad/warpcreep=false}] only smoochypit:warppad/warpcreep
	execute if entity @s[tag=wp.pilot,advancements={smoochypit:warppad/warp50000=false},nbt={SelectedItem:{id:"minecraft:poppy"}}] if entity @e[tag=wp.pad3,distance=..0.1] if entity @s[distance=50000..] run advancement grant @s[tag=wp.pilot] only smoochypit:warppad/warp50000
	execute unless entity @e[tag=wp.pad,distance=..0.1,scores={wp.linkedUUID=0}] if entity @a[tag=wp.activePass] run advancement grant @s[advancements={smoochypit:warppad/privpass=false}] only smoochypit:warppad/privpass
	advancement grant @s[tag=wp.pilot,advancements={smoochypit:warppad/warped=false}] only smoochypit:warppad/warped
	execute if entity @e[type=wolf,tag=wp.activePass] run advancement grant @s[tag=wp.pilot,advancements={smoochypit:warppad/warpdog=false}] only smoochypit:warppad/warpdog
	advancement grant @a[tag=wp.activePass,advancements={smoochypit:warppad/warppass=false}] only smoochypit:warppad/warppass

#Teleport the "pilot"
	tp @s[tag=wp.pilot] ~ ~-0.5 ~
	playsound minecraft:ui.toast.in player @a[distance=..8] ~ ~ ~ 0.75 1.2

#More Advancements

#Teleport and align each "passenger"
	tp @e[tag=wp.activePass] ~ ~-0.5 ~
	execute as @e[tag=wp.activePass,scores={wp.passXoffset=..-1}] at @s run function smoochypit:warppad/warping/passengers/realignx
	execute as @e[tag=wp.activePass,scores={wp.passXoffset=1..}] at @s run function smoochypit:warppad/warping/passengers/realignx
	execute as @e[tag=wp.activePass,scores={wp.passZoffset=..-1}] at @s run function smoochypit:warppad/warping/passengers/realignz
	execute as @e[tag=wp.activePass,scores={wp.passZoffset=1..}] at @s run function smoochypit:warppad/warping/passengers/realignz