kill @e[tag=warpLocTemp]
#If player is on a tier 3 warp pad
#If found warp pad is level 1
	execute as @e[tag=!sourcePad,tag=warpPad1,tag=!warpPadIterated,limit=1,sort=nearest,tag=warpInNTier1] run function warppad:iconalign
	tag @e[tag=!sourcePad,tag=warpPad1,limit=1,sort=nearest,tag=warpInNTier1,tag=!warpPadIterated] add warpPadIterated
	execute if entity @e[tag=!sourcePad,tag=warpPad1,tag=warpInNTier1,tag=!warpPadIterated] run function warppad:netheriterate2/warp3
#If found warp pad is level 2
	execute as @e[tag=!sourcePad,tag=warpPad2,tag=!warpPadIterated,limit=1,sort=nearest,tag=warpInNTier2] run function warppad:iconalign
	tag @e[tag=!sourcePad,tag=warpPad2,limit=1,sort=nearest,tag=warpInNTier2,tag=!warpPadIterated] add warpPadIterated
	execute if entity @e[tag=!sourcePad,tag=warpPad2,tag=warpInNTier2,tag=!warpPadIterated] run function warppad:netheriterate2/warp3
#If found warp pad is level 3
	execute as @e[tag=!sourcePad,tag=warpPad3,tag=!warpPadIterated,limit=1,sort=nearest,tag=warpInNTier3] run function warppad:iconalign
	tag @e[tag=!sourcePad,tag=warpPad3,limit=1,sort=nearest,tag=warpInNTier3,tag=!warpPadIterated] add warpPadIterated
	execute if entity @e[tag=!sourcePad,tag=warpPad3,tag=warpInNTier3,tag=!warpPadIterated] run function warppad:netheriterate2/warp3