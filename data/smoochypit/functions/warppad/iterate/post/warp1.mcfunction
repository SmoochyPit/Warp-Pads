kill @e[tag=wp.locTemp]
#If player is on a tier 1 warp pad
#If found warp pad is level 1, 2 or 3
	execute as @e[tag=!wp.sourcePad,tag=wp.pad,tag=!wp.padIterated,limit=1,sort=nearest,tag=wp.inTier1] run function smoochypit:warppad/iterate/post/iconalign
	execute run tag @e[tag=!wp.sourcePad,tag=wp.pad,limit=1,sort=nearest,tag=wp.inTier1,tag=!wp.padIterated] add wp.padIterated
	execute if entity @e[tag=!wp.sourcePad,tag=wp.pad,tag=wp.inTier1,tag=!wp.padIterated] run function smoochypit:warppad/iterate/post/warp1