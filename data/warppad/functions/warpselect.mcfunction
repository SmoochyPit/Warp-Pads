#Tags the icon with a small raycast.

#Tags
	tag @e remove wp.selCast
	tag @s add wp.selCast

#Creation- Like undead things, but from thin air.
	tp @e[tag=wp.selTrace] ~ -1000 ~
	summon armor_stand ~ ~ ~ {Silent:true,Marker:true,Invisible:true,NoGravity:true,Tags:["wp.selTrace"]}
	tp @e[tag=wp.selTrace,limit=1] @s
	tp @e[tag=wp.selTrace,limit=1] ~ ~1.64 ~

#Tag for currently selected icon
	tag @e[distance=..5] remove wp.selCastIcon
	execute as @e[tag=wp.selTrace] at @s run function warppad:warpselectcast
	tp @e[tag=wp.selTrace] ~ -1000 ~
	kill @e[tag=wp.selTrace]