#Tags the icon with a small raycast.

#Tags
	tag @e remove currentSelCast
	tag @s add currentSelCast

#Creation- Like undead things, but from thin air.
	tp @e[tag=warpSelectTrace] ~ -1000 ~
	summon armor_stand ~ ~ ~ {Silent:true,Marker:true,Invisible:true,NoGravity:true,Tags:["warpSelectTrace"]}
	tp @e[tag=warpSelectTrace,limit=1] @s
	tp @e[tag=warpSelectTrace,limit=1] ~ ~1.64 ~

#Tag for currently selected icon
	tag @e[distance=..5] remove SelCastIcon
	execute as @e[tag=warpSelectTrace] at @s run function warppad:warpselectcast
	tp @e[tag=warpSelectTrace] ~ -1000 ~
	kill @e[tag=warpSelectTrace]