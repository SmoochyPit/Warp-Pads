#Remove deprecated UUID tags if and only if no legacy warp pads exist
    tag @e[tag=warpPad,scores={linkedUUIDL=1..,linkedUUIDM=1..}] add wp.legacyPrivPad
    execute if entity @e[tag=wp.legacyPrivPad] run tellraw @a {"text":"[Warp Pads] ","color":"yellow","extra":[{"text":"One or more legacy private warp pads have been detected. Hover this message for additional instructions.","color":"yellow","hoverEvent":{"action":"show_text","value":"These warp pads need to be recreated by their owner. Until then, they are able to be warped to by all players. Please warp to and destroy them. This will drop ALL items used in their creation (other than any dyes)."}}]}
    scoreboard objectives remove linkedUUIDL
    scoreboard objectives remove linkedUUIDM