execute store result score @s wp.linkedUUID run data get entity @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:1b}},limit=1,sort=nearest,dx=0,dy=0,dz=0] Thrower[0]
particle witch ~ ~ ~ 0 0 0 0.2 25
advancement grant @a[distance=..8,advancements={warppad:warppriv=false}] only warppad:warppriv
kill @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,limit=1,sort=nearest,distance=..0.1]