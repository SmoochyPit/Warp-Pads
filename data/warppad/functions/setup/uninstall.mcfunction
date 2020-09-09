#This file detects if warp pads exist and if they do not, uninstalls.

#This stuff runs at load.

execute unless entity @e[tag=wp.pad] run function warppad:setup/rmobj
execute if entity @e[tag=wp.pad] run tellraw @a {"text":"One or more warp pads are still active. To destroy them all, run ","color":"yellow","extra":[{"text":"/function warppad:setup/forceuninstall","color":"red","clickEvent":{"action":"suggest_command","value":"/function warppad:setup/forceuninstall"}}]}