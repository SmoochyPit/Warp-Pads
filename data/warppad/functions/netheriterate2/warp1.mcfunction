kill @e[tag=warpLocTemp]
#If player is on a tier 1 warp pad
#If found warp pad is level 1, 2 or 3
	execute as @e[tag=!sourcePad,tag=warpPad,tag=!warpPadIterated,limit=1,sort=nearest,tag=warpInNTier1] run function warppad:iconalign
	execute run tag @e[tag=!sourcePad,tag=warpPad,limit=1,sort=nearest,tag=warpInNTier1,tag=!warpPadIterated] add warpPadIterated
	execute if entity @e[tag=!sourcePad,tag=warpPad,tag=warpInNTier1,tag=!warpPadIterated] run function warppad:netheriterate2/warp1