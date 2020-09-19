#This file runs every time an item is on a warp pad.

#Allows the warp pad to be renamed
	execute as @e[tag=wp.pad] at @s align xyz if entity @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,dx=0,dy=0,dz=0] at @s run function smoochypit:warppad/creation/warpmod

	function smoochypit:warppad/setup/defaults