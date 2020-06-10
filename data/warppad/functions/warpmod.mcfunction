#It made sense at the time.

#Copies named paper's name to warp pad
	scoreboard players set @s modSucc 0
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if data entity @e[type=item,nbt={Item:{id:"minecraft:paper",Count:1b}},limit=1,sort=nearest,distance=..0.1] Item.tag.display.Name store success score @s modSucc run data modify entity @s CustomName set from entity @e[type=item,limit=1,sort=nearest,distance=..0.1] Item.tag.display.Name
	execute align xyz if score @s modSucc matches 1 at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] run particle witch ~ ~ ~ 0 0 0 0.2 25
	execute align xyz if score @s modSucc matches 1 run advancement grant @a[distance=..8,advancements={warppad:warprename=false}] only warppad:warprename
	execute align xyz if score @s modSucc matches 1 if entity @s[nbt={CustomName:"{\"text\":\"Karen\"}"}] run advancement grant @a[distance=..8,advancements={warppad:renamekaren=false}] only warppad:renamekaren
	execute align xyz if score @s modSucc matches 1 if entity @s[nbt={CustomName:"{\"text\":\"Kevin\"}"}] run advancement grant @a[distance=..8,advancements={warppad:renamekaren=false}] only warppad:renamekaren
	execute align xyz if score @s modSucc matches 1 run kill @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0]


#Changes each warp pad's color based on what item is thrown on them
	scoreboard players set @s modSucc 0
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:red_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 1 run scoreboard players set @s iconColor1 1
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:green_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 2 run scoreboard players set @s iconColor1 2
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:purple_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 3 run scoreboard players set @s iconColor1 3
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:cyan_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 4 run scoreboard players set @s iconColor1 4
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:light_gray_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 5 run scoreboard players set @s iconColor1 5
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:gray_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 6 run scoreboard players set @s iconColor1 6
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:pink_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 7 run scoreboard players set @s iconColor1 7
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:lime_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 8 run scoreboard players set @s iconColor1 8
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:yellow_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 9 run scoreboard players set @s iconColor1 9
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 10 run scoreboard players set @s iconColor1 10
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:magenta_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 11 run scoreboard players set @s iconColor1 11
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:orange_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 12 run scoreboard players set @s iconColor1 12
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:blue_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 13 run scoreboard players set @s iconColor1 13
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:brown_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 14 run scoreboard players set @s iconColor1 14
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:black_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 15 run scoreboard players set @s iconColor1 15
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[distance=..0.1,nbt={Item:{id:"minecraft:white_dye",Count:1b}}] store success score @s modSucc unless score @s iconColor1 matches 16 run scoreboard players set @s iconColor1 16
#witch particles
	execute align xyz if score @s modSucc matches 1 at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] run particle witch ~ ~ ~ 0 0 0 0.2 25
#kill item
	execute align xyz if score @s modSucc matches 1 run kill @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0]

#private warp
	scoreboard players set @s modSucc 0
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if data entity @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:1b}},limit=1,sort=nearest,distance=..0.1] Thrower[0] if score @s linkedUUID matches 0 store success score @s modSucc store result score @s linkedUUID run data get entity @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:1b}},limit=1,sort=nearest,dx=0,dy=0,dz=0] Thrower[0]
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if data entity @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:1b}},limit=1,sort=nearest,distance=..0.1] Thrower[0] if score @s modSucc matches 1 at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] run particle witch ~ ~ ~ 0 0 0 0.2 25
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if data entity @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:1b}},limit=1,sort=nearest,distance=..0.1] Thrower[0] if score @s modSucc matches 1 run advancement grant @a[distance=..8,advancements={warppad:warppriv=false}] only warppad:warppriv
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if data entity @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:1b}},limit=1,sort=nearest,distance=..0.1] Thrower[0] if score @s modSucc matches 1 run kill @e[type=item,limit=1,sort=nearest,distance=..0.1]

#frequency increase
	scoreboard players set @s modSucc 0
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:1b}},limit=1,sort=nearest,distance=..0.1] unless score @s warpStreamFreq matches 64.. store success score @s modSucc run scoreboard players add @s warpStreamFreq 1
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:1b}},limit=1,sort=nearest,distance=..0.1] if score @s modSucc matches 1 at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] run particle witch ~ ~ ~ 0 0 0 0.2 25
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:1b}},limit=1,sort=nearest,distance=..0.1] if score @s modSucc matches 1 run advancement grant @a[distance=..8,advancements={warppad:warpfreq=false}] only warppad:warpfreq
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:1b}},limit=1,sort=nearest,distance=..0.1] if score @s modSucc matches 1 if score @s warpStreamFreq matches 64 run advancement grant @a[distance=..8,advancements={warppad:warpfreq64=false}] only warppad:warpfreq64
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:1b}},limit=1,sort=nearest,distance=..0.1] if score @s modSucc matches 1 run title @a[distance=..8] actionbar {"text":"Warp Stream Frequency set to ","color":"dark_purple","extra":[{"score":{"name":"@s","objective":"warpStreamFreq"}}]}
	execute align xyz at @e[type=item,limit=1,sort=nearest,dx=0,dy=0,dz=0] if entity @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:1b}},limit=1,sort=nearest,distance=..0.1] if score @s modSucc matches 1 run kill @e[type=item,limit=1,sort=nearest,distance=..0.1]