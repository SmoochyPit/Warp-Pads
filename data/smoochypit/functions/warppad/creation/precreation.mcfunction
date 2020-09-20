#This file runs every time an item is on a warp pad.

#Allows the warp pad to be renamed
	execute as @e[tag=wp.pad] at @s align xyz at @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,limit=1,sort=nearest,dx=0,dy=0,dz=0] run function smoochypit:warppad/creation/warpmod

	function smoochypit:warppad/setup/defaults