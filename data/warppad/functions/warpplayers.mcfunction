#Not just yet, though.
	scoreboard players set @s warpCooldown 3
	tag @a[scores={warpCooldown=1..}] remove wpUsing
	scoreboard players add @s[tag=onWarp1] warpSpam 25
	scoreboard players add @s[tag=onWarp2] warpSpam 35
	scoreboard players add @s[tag=onWarp3] warpSpam 1

#Advancements
	scoreboard players set @s passCount 0
	execute at @a[tag=wpActivePass] run scoreboard players add @s passCount 1
	execute if score @s passCount matches 4.. run advancement grant @s[tag=warpPilot,advancements={warppad:warpgroup=false}] only warppad:warpgroup
	execute if entity @e[type=creeper,tag=wpActivePass] run advancement grant @s[tag=warpPilot,advancements={warppad:warpcreep=false}] only warppad:warpcreep
	execute if entity @s[tag=warpPilot,advancements={warppad:warp50000=false},nbt={SelectedItem:{id:"minecraft:poppy"}}] if entity @e[tag=warpPad3,distance=..0.1] if entity @s[distance=50000..] run advancement grant @s[tag=warpPilot] only warppad:warp50000
	execute unless entity @e[tag=warpPad,distance=..0.1,scores={linkedUUID=0}] if entity @a[tag=wpActivePass] run advancement grant @s[advancements={warppad:privpass=false}] only warppad:privpass
	advancement grant @s[tag=warpPilot,advancements={warppad:warped=false}] only warppad:warped
	execute if entity @e[type=wolf,tag=wpActivePass] run advancement grant @s[tag=warpPilot,advancements={warppad:warpdog=false}] only warppad:warpdog
	advancement grant @a[tag=wpActivePass,advancements={warppad:warppass=false}] only warppad:warppass

#Teleport the "pilot"
	tp @s[tag=warpPilot] ~ ~-0.5 ~
	playsound minecraft:ui.toast.in player @a[distance=..8] ~ ~ ~ 0.75 1.2

#More Advancements

#Teleport and align each "passenger"
	tp @e[tag=wpActivePass] ~ ~-0.5 ~
	execute as @e[tag=wpActivePass,scores={passXoffset=..-1}] at @s run function warppad:realignx
	execute as @e[tag=wpActivePass,scores={passXoffset=1..}] at @s run function warppad:realignx
	execute as @e[tag=wpActivePass,scores={passZoffset=..-1}] at @s run function warppad:realignz
	execute as @e[tag=wpActivePass,scores={passZoffset=1..}] at @s run function warppad:realignz