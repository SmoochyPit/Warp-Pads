#Destruction of warp pads

	execute if entity @e[tag=wp.pad,tag=wp.legacyPrivPad] run function smoochypit:warppad/creation/del/legacy

	execute as @e[tag=wp.pad1] at @s unless block ~ ~-1 ~ gold_block run function smoochypit:warppad/creation/del/pad/1
	execute as @e[tag=wp.pad2] at @s unless block ~ ~-1 ~ emerald_block run function smoochypit:warppad/creation/del/pad/2
	execute as @e[tag=wp.pad3] at @s unless block ~ ~-1 ~ diamond_block run function smoochypit:warppad/creation/del/pad/3