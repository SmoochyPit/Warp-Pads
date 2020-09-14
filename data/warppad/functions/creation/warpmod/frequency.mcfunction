scoreboard players add @s wp.streamFreq 1
particle witch ~ ~ ~ 0 0 0 0.2 25
advancement grant @a[distance=..8,advancements={warppad:warpfreq=false}] only warppad:warpfreq
execute if score @s wp.streamFreq matches 64 run advancement grant @a[distance=..8,advancements={warppad:warpfreq64=false}] only warppad:warpfreq64
title @a[distance=..8,tag=!global.ignore,tag=!global.ignore.gui] actionbar {"text":"Warp Stream Frequency set to ","color":"dark_purple","extra":[{"score":{"name":"@s","objective":"wp.streamFreq"}}]}
kill @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,limit=1,sort=nearest,distance=..0.1]