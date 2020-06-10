#This stuff runs at load.

scoreboard objectives add warpSpawnAnim dummy
scoreboard objectives add sneakClick minecraft.custom:minecraft.sneak_time
scoreboard objectives add warpTempID dummy
scoreboard objectives add warpCooldown dummy
scoreboard objectives add warpSpam dummy
scoreboard objectives add warppadX dummy
scoreboard objectives add warppadZ dummy
scoreboard objectives add passXoffset dummy
scoreboard objectives add passZoffset dummy
scoreboard objectives add anim1time dummy
scoreboard objectives add anim1delay dummy
scoreboard objectives add iconColor1 dummy
scoreboard objectives add linkedUUID dummy
#Remove deprecated UUID tags if and only if no legacy warp pads exist
    scoreboard objectives add legacyWarp dummy
    execute store success score a legacyWarp if entity @e[tag=warpPad,scores={linkedUUIDL=1..,linkedUUIDM=1..}]
    execute if score a legacyWarp matches 1 run tellraw @a {"text":"[Warp Pads] ","color":"yellow","extra":[{"text":"One or more legacy private warp pads have been detected. Hover this message for additional instructions.","color":"yellow","hoverEvent":{"action":"show_text","value":"These warp pads need to be recreated by their owner. Until then, they are able to be warped to by all players. Please warp to and destroy them. This will drop ALL items used in their creation (other than any dyes)."}}]}
    execute unless score a legacyWarp matches 1 run scoreboard objectives remove linkedUUIDL
    execute unless score a legacyWarp matches 1 run scoreboard objectives remove linkedUUIDM
    scoreboard objectives remove legacyWarp
scoreboard objectives add warpStreamFreq dummy
scoreboard objectives add modSucc dummy
scoreboard objectives add passCount dummy
scoreboard objectives add negativeOne dummy
scoreboard objectives add distX dummy
scoreboard objectives add distZ dummy
scoreboard objectives add distScale dummy
scoreboard objectives add dist15 dummy
scoreboard objectives add dist30 dummy
scoreboard objectives add dist45 dummy
scoreboard objectives add dist60 dummy
scoreboard objectives add dist75 dummy


tellraw @a {"text":"Warp Pads ","color":"green","extra":[{"text":"v1.2.2","color":"light_purple","hoverEvent":{"action":"show_text","value":"For Minecraft 1.16, By SmoochyPit"}},{"text":" has successfully loaded.","color":"green"}]}