kill @e[tag=wp.locTemp]
#If player is on a tier 2 warp pad
#If found warp pad is level 1
	execute as @e[tag=!wp.sourcePad,tag=wp.pad1,tag=!wp.padIterated,limit=1,sort=nearest,tag=wp.inTier1] run function smoochypit:warppad/iterate/post/iconalign
	execute run tag @e[tag=!wp.sourcePad,tag=wp.pad1,limit=1,sort=nearest,tag=wp.inTier1,tag=!wp.padIterated] add wp.padIterated
	execute if entity @e[tag=!wp.sourcePad,tag=wp.pad1,tag=wp.inTier1,tag=!wp.padIterated] run function smoochypit:warppad/iterate/post/warp2
#If found warp pad is level 2 or 3
	execute as @e[tag=!wp.sourcePad,tag=wp.padPlus,tag=!wp.padIterated,limit=1,sort=nearest,tag=wp.inTier2] run function smoochypit:warppad/iterate/post/iconalign
	execute run tag @e[tag=!wp.sourcePad,tag=wp.padPlus,limit=1,sort=nearest,tag=wp.inTier2,tag=!wp.padIterated] add wp.padIterated
	execute if entity @e[tag=!wp.sourcePad,tag=wp.padPlus,tag=wp.inTier2,tag=!wp.padIterated] run function smoochypit:warppad/iterate/post/warp2