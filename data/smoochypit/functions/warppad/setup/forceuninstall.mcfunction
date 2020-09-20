#This function will kill all warp pads in the world and uninstalls.

execute as @e[tag=wp.pad] at @s run setblock ~ ~-1 ~ air destroy
execute as @e[tag=wp.pad] at @s run forceload remove ~ ~
#kill @e[tag=wp.pad]

schedule function smoochypit:warppad/setup/uninstall 2t