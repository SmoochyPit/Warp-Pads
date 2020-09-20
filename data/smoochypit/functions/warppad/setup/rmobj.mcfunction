#Remove all objectives

schedule clear #smoochypit:warppad/tick
schedule clear smoochypit:warppad/creation/warpmod/rmnogui
schedule clear smoochypit:warppad/spam/coolit
schedule clear smoochypit:warppad/spam/spam

scoreboard objectives remove wp.spawnAnim
scoreboard objectives remove wp.sneakClick
scoreboard objectives remove wp.tempID
scoreboard objectives remove wp.cooldown
scoreboard objectives remove wp.spam
scoreboard objectives remove wp.padX
scoreboard objectives remove wp.padZ
scoreboard objectives remove wp.passXoffset
scoreboard objectives remove wp.passZoffset
scoreboard objectives remove wp.anim1time
scoreboard objectives remove wp.anim1delay
scoreboard objectives remove wp.iconColor
scoreboard objectives remove wp.linkedUUID
scoreboard objectives remove wp.streamFreq
scoreboard objectives remove wp.modSucc
scoreboard objectives remove wp.passCount
scoreboard objectives remove wp.negativeOne
scoreboard objectives remove wp.distX
scoreboard objectives remove wp.distZ
scoreboard objectives remove wp.distScale
scoreboard objectives remove wp.dist15
scoreboard objectives remove wp.dist30
scoreboard objectives remove wp.dist45
scoreboard objectives remove wp.dist60
scoreboard objectives remove wp.dist75
scoreboard objectives remove wp.guitimer

tag @a remove wp.noIterate
tag @a remove wp.onTier1
tag @a remove wp.onTier2
tag @a remove wp.onTier3
tag @a remove wp.pilot
tag @a remove wp.selCast
tag @a remove wp.wsIterated

tellraw @a {"text":"Warp Pads has been uninstalled successfully. Disable or remove from data packs folder before reloading.","color":"green"}