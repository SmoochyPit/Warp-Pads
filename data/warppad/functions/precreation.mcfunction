#This file runs every time an item is on a warp pad.

#Creation
    function warppad:creation/new

#Allows the warp pad to be renamed
	execute as @e[tag=wp.pad] at @s align xyz if entity @e[type=item,dx=0,dy=0,dz=0] at @s run function warppad:warpmod

	function warppad:setup/defaults