scoreboard players add @s wp.streamFreq 1
particle witch ~ ~ ~ 0 0 0 0.2 25
advancement grant @a[distance=..8,advancements={warppad:warpfreq=false}] only warppad:warpfreq
execute if score @s wp.streamFreq matches 64 run advancement grant @a[distance=..8,advancements={warppad:warpfreq64=false}] only warppad:warpfreq64
title @a[distance=..8,tag=!global.ignore,tag=!global.ignore.gui,scores={wp.guitimer=0}] actionbar {"text":"Warp Stream Frequency set to ","color":"dark_purple","extra":[{"score":{"name":"@s","objective":"wp.streamFreq"}}]}
title @a[distance=..8,tag=!global.ignore,scores={wp.guitimer=1..}] actionbar {"text":"Warp Stream Frequency set to ","color":"dark_purple","extra":[{"score":{"name":"@s","objective":"wp.streamFreq"}}]}
scoreboard players set @a[distance=..8,tag=!global.ignore,tag=!global.ignore.gui] wp.guitimer 1
tag @a[distance=..8,tag=!global.ignore,tag=!global.ignore.gui] add global.ignore.gui
kill @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,limit=1,sort=nearest,distance=..0.1]