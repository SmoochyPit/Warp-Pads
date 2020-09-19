tag @a[scores={wp.guitimer=8..}] remove global.ignore.gui
scoreboard players set @a[tag=!global.ignore,tag=!global.ignore.gui] wp.guitimer 0
scoreboard players add @a[scores={wp.guitimer=1..}] wp.guitimer 1
schedule function warppad:creation/warpmod/rmnogui 5t