function smoochypit:warppad/setup/install

execute as @e[tag=warpPad] at @s run scoreboard players operation @s wp.spawnAnim = @s warpSpawnAnim
#sneakClick
#tempID
#warpCooldown
#warpSpam
execute as @e[tag=warpPad] at @s run scoreboard players operation @s wp.padX = @s warppadX
execute as @e[tag=warpPad] at @s run scoreboard players operation @s wp.padZ = @s warppadZ
#passXoffset
#passZoffset
#anim1time
#anim1delay
execute as @e[tag=warpPad] at @s run scoreboard players operation @s wp.iconColor = @s iconColor1
execute as @e[tag=warpPad] at @s run scoreboard players operation @s wp.linkedUUID = @s linkedUUID
execute as @e[tag=warpPad] at @s run scoreboard players operation @s wp.streamFreq = @s warpStreamFreq
#modSucc
#passCount
#negativeOne
#distX
#distZ
#distScale
#dist15
#dist30
#dist45
#dist60
#dist75

function smoochypit:warppad/setup/legacyuninst