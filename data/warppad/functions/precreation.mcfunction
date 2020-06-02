#This file runs every time an item is on a warp pad.

#Warp pad setup and creation

#Creation
    function warppad:creation/new

#Allows the warp pad to be renamed
	execute as @e[tag=warpPad] at @s align xyz if entity @e[type=item,dx=0,dy=0,dz=0] at @s run function warppad:warpmod

	function warppad:setdefaults

#schedule function warppad:precreation 5s 