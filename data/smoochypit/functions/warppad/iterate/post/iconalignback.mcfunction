#This function teleports wp.locTemp backwards (^ ^ ^-0.1) if it's in a block.
	tp @s ^ ^ ^-0.1
	execute as @e[tag=wp.locTemp] at @s unless block ~ ~ ~ #smoochypit:warppad/warpnocoll if entity @e[tag=wp.pad,distance=..5] run function smoochypit:warppad/iterate/post/iconalignback