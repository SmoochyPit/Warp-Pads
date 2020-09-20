#Note: Under normal circumstances, no items with !global.ignore or tag=!global.ignore.kill should have wp.spawnAnim > 0
#When wp.spawnAnim > 1, it begins the animation. When it reaches 99, it finishes the animation.

#Controls the animation and stuff.
	scoreboard players add @s wp.spawnAnim 1

#Cancel
	execute if score @s wp.spawnAnim matches 1.. unless block ~ ~-1 ~ #smoochypit:warppad/warpblocks run function smoochypit:warppad/creation/newanim/cancel
	execute if score @s wp.spawnAnim matches 1..99 unless entity @s[nbt={Item:{Count:1b}}] run function smoochypit:warppad/creation/newanim/cancel

#Main
	execute if score @s wp.spawnAnim matches 1.. run function smoochypit:warppad/creation/newanim/1-
	execute if score @s wp.spawnAnim matches 1..50 run function smoochypit:warppad/creation/newanim/1-50
	execute if score @s wp.spawnAnim matches 50 align xyz run function smoochypit:warppad/creation/newanim/50
	execute if score @s wp.spawnAnim matches 99 run function smoochypit:warppad/creation/newanim/99

	execute if score @s wp.spawnAnim matches 1..25 run particle portal ~ ~0.2 ~ 0 0 0 1 10 normal @a[distance=..25]
	execute if score @s wp.spawnAnim matches 25..50 run particle portal ~ ~0.25 ~ 0 0.1 0 2 100 normal @a[distance=..25]