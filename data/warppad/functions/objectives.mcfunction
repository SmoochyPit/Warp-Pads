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
scoreboard objectives add linkedUUIDL dummy
scoreboard objectives add linkedUUIDM dummy
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


tellraw @a {"text":"Warp Pads ","color":"dark_red","extra":[{"text":"v1.2","color":"light_purple","hoverEvent":{"action":"show_text","value":"For Minecraft 1.14.4-1.15.2, By SmoochyPit"}},{"text":" has successfully loaded.","color":"dark_red"}]}