data modify entity @s CustomName set from entity @e[type=item,limit=1,tag=!global.ignore,tag=!global.ignore.kill,sort=nearest,distance=..0.1] Item.tag.display.Name
particle witch ~ ~ ~ 0 0 0 0.2 25
advancement grant @a[distance=..8,advancements={warppad:warprename=false}] only warppad:warprename
kill @e[type=item,tag=!global.ignore,tag=!global.ignore.kill,limit=1,sort=nearest,dx=0,dy=0,dz=0]