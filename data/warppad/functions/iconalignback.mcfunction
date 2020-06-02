#This function teleports warpLocTemp backwards (^ ^ ^-0.1) if it's in a block.
	tp @s ^ ^ ^-0.1
	execute as @e[tag=warpLocTemp] at @s unless block ~ ~ ~ #warppad:air run function warppad:iconalignback