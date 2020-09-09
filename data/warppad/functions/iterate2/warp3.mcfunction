kill @e[tag=wp.locTemp]
#If player is on a tier 3 warp pad
#If found warp pad is level 1
	execute as @e[tag=!wp.sourcePad,tag=wp.pad1,tag=!wp.padIterated,limit=1,sort=nearest,tag=wp.inTier1] run function warppad:iconalign
	tag @e[tag=!wp.sourcePad,tag=wp.pad1,limit=1,sort=nearest,tag=wp.inTier1,tag=!wp.padIterated] add wp.padIterated
	execute if entity @e[tag=!wp.sourcePad,tag=wp.pad1,tag=wp.inTier1,tag=!wp.padIterated] run function warppad:iterate2/warp3
#If found warp pad is level 2
	execute as @e[tag=!wp.sourcePad,tag=wp.pad2,tag=!wp.padIterated,limit=1,sort=nearest,tag=wp.inTier2] run function warppad:iconalign
	tag @e[tag=!wp.sourcePad,tag=wp.pad2,limit=1,sort=nearest,tag=wp.inTier2,tag=!wp.padIterated] add wp.padIterated
	execute if entity @e[tag=!wp.sourcePad,tag=wp.pad2,tag=wp.inTier2,tag=!wp.padIterated] run function warppad:iterate2/warp3
#If found warp pad is level 3
	execute as @e[tag=!wp.sourcePad,tag=wp.pad3,tag=!wp.padIterated,limit=1,sort=nearest,tag=wp.inTier3] run function warppad:iconalign
	tag @e[tag=!wp.sourcePad,tag=wp.pad3,limit=1,sort=nearest,tag=wp.inTier3,tag=!wp.padIterated] add wp.padIterated
	execute if entity @e[tag=!wp.sourcePad,tag=wp.pad3,tag=wp.inTier3,tag=!wp.padIterated] run function warppad:iterate2/warp3