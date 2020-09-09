#This function will kill all warp pads in the world and uninstalls.

execute as @e[tag=wp.pad] at @s run setblock ~ ~ ~ air destroy
execute as @e[tag=wp.pad] at @s run forceload remove ~ ~
#kill @e[tag=wp.pad]

schedule function warppad:setup/uninstall 2t