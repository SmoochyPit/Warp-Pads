#This file controls cooldown and spam timers

#To prevent unintentional warping
	scoreboard players add @a warpCooldown 0
	tag @a[scores={warpCooldown=1..}] remove wpUsing
	scoreboard players remove @a[scores={warpCooldown=1..}] warpCooldown 1

#Punish spamming warp pads
	tag @a[scores={warpSpam=..100,warpCooldown=0},tag=warpSpamHalt] remove warpSpamHalt
	advancement grant @a[scores={warpSpam=100..},advancements={warppad:warpspam=false}] only warppad:warpspam
	tag @a[scores={warpSpam=100..}] add warpSpamHalt
	scoreboard players set @a[scores={warpSpam=100..}] warpCooldown 60
	scoreboard players set @a[scores={warpSpam=100..}] warpSpam 0
	scoreboard players set @a[gamemode=creative] warpSpam 0

schedule function warppad:coolit 5t