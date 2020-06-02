kill @e[tag=warpLocTemp]
#If player is on a tier 2 warp pad
#If found warp pad is level 1
	execute as @e[tag=!sourcePad,tag=warpPad1,tag=!warpPadIterated,limit=1,sort=nearest,tag=warpInNTier1] run function warppad:iconalign
	execute run tag @e[tag=!sourcePad,tag=warpPad1,limit=1,sort=nearest,tag=warpInNTier1,tag=!warpPadIterated] add warpPadIterated
	execute if entity @e[tag=!sourcePad,tag=warpPad1,tag=warpInNTier1,tag=!warpPadIterated] run function warppad:netheriterate2/warp2
#If found warp pad is level 2 or 3
	execute as @e[tag=!sourcePad,tag=warpPadPlus,tag=!warpPadIterated,limit=1,sort=nearest,tag=warpInNTier2] run function warppad:iconalign
	execute run tag @e[tag=!sourcePad,tag=warpPadPlus,limit=1,sort=nearest,tag=warpInNTier2,tag=!warpPadIterated] add warpPadIterated
	execute if entity @e[tag=!sourcePad,tag=warpPadPlus,tag=warpInNTier2,tag=!warpPadIterated] run function warppad:netheriterate2/warp2