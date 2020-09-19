execute if data entity @e[type=item,scores={wp.spawnAnim=99},distance=..1,limit=1,sort=nearest] Item.tag.display.Name run data modify entity @s CustomName set from entity @e[scores={wp.spawnAnim=99},type=item,distance=..1,limit=1,sort=nearest] Item.tag.display.Name
forceload add ~ ~
execute if entity @e[scores={wp.spawnAnim=99},tag=wp.spawn1] at @s run advancement grant @a[distance=..15,advancements={smoochypit:warppad/warppad1=false}] only smoochypit:warppad/warppad1
execute if entity @e[scores={wp.spawnAnim=99},tag=wp.spawn2] at @s run advancement grant @a[distance=..15,advancements={smoochypit:warppad/warppad2=false}] only smoochypit:warppad/warppad2
execute if entity @e[scores={wp.spawnAnim=99},tag=wp.spawn3] at @s run advancement grant @a[distance=..15,advancements={smoochypit:warppad/warppad3=false}] only smoochypit:warppad/warppad3
function smoochypit:warppad/setup/defaults
kill @e[scores={wp.spawnAnim=99}]