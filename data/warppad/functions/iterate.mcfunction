#This gets really really hard to follow. Stay with me, though.
#Source Pad
	tag @e remove sourcePad
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz run tag @e[tag=warpPad,dx=0,dy=0,dz=0,limit=1,sort=nearest] add sourcePad
	scoreboard players set @e[tag=sourcePad] negativeOne -1

#Tag every warp pad within a range
#Remove Tags
	tag @e[tag=warpPad] remove warpInTier1
	tag @e[tag=warpPad] remove warpInTier2
	tag @e[tag=warpPad] remove warpInTier3

#Get relative warp pad distances
#####################################################
#
# In order to optimize this section of code, I manually compare the coordinates of each warp pad with 6 square regions, each of which can be defined by the following equation:
#
#	Δx+Δy(tanθ)<=r/cosθ
#
# With r being the desired radius and θ being the amount of square rotations in degrees
#
#####################################################

#For 0 degree region
	execute as @e[tag=warpPad] run scoreboard players operation @s distX = @s warppadX
	execute as @e[tag=warpPad] run scoreboard players operation @s distZ = @s warppadZ
	execute as @e[tag=sourcePad,limit=1] at @e[tag=warpPad] run scoreboard players operation @e[tag=warpPad,limit=1,sort=nearest,distance=..0.1] distX -= @s warppadX
	execute as @e[tag=sourcePad,limit=1] at @e[tag=warpPad] run scoreboard players operation @e[tag=warpPad,limit=1,sort=nearest,distance=..0.1] distZ -= @s warppadZ
	execute as @e[tag=warpPad,scores={distX=..0}] run scoreboard players operation @s distX *= @e[tag=sourcePad,limit=1] negativeOne
	execute as @e[tag=warpPad,scores={distZ=..0}] run scoreboard players operation @s distZ *= @e[tag=sourcePad,limit=1] negativeOne

#Scale for more complex operations
	scoreboard players set @e[tag=sourcePad] distScale 1000

#For 45 degree region, tan(45) = 1
	execute as @e[tag=warpPad] run scoreboard players operation @s dist45 = @s distZ
	execute as @e[tag=warpPad] run scoreboard players operation @s dist45 += @s distX

#For 30 degree region, tan(30) = 0.577 = 1 / 1.732 ##### x / 1.732 = x / 1732 * 1000
	execute as @e[tag=warpPad] run scoreboard players operation @s dist30 = @s distZ
	scoreboard players set @e[tag=warpPad] distScale 1732
	execute as @e[tag=warpPad] run scoreboard players operation @s dist30 /= @s distScale
	execute as @e[tag=warpPad] run scoreboard players operation @s dist30 *= @e[tag=sourcePad,limit=1] distScale

	execute as @e[tag=warpPad] run scoreboard players operation @s dist60 += @s distX

#For 60 degree region, tan(60) = 1.732 ##### x * 1.732 = x * 1732 / 1000
	execute as @e[tag=warpPad] run scoreboard players operation @s dist60 = @s distZ
	#Reuse distScale from 30 degree region
	execute as @e[tag=warpPad] run scoreboard players operation @s dist60 *= @s distScale
	execute as @e[tag=warpPad] run scoreboard players operation @s dist60 /= @e[tag=sourcePad,limit=1] distScale

	execute as @e[tag=warpPad] run scoreboard players operation @s dist60 += @s distX

#For 15 degree region, tan(15) = 0.268 = 1 / 3.732 ##### x / 3.732 = x / 3732 * 1000
	execute as @e[tag=warpPad] run scoreboard players operation @s dist15 = @s distZ
	scoreboard players set @e[tag=warpPad] distScale 3732
	execute as @e[tag=warpPad] run scoreboard players operation @s dist15 /= @s distScale
	execute as @e[tag=warpPad] run scoreboard players operation @s dist15 *= @e[tag=sourcePad,limit=1] distScale

	execute as @e[tag=warpPad] run scoreboard players operation @s dist15 += @s distX

#For 75 degree region, tan(75) = 3.732 ##### x * 3.732 = x * 3732 / 1000
	execute as @e[tag=warpPad] run scoreboard players operation @s dist75 = @s distZ
	#Reuse distScale from 15 degree region
	execute as @e[tag=warpPad] run scoreboard players operation @s dist75 *= @s distScale
	execute as @e[tag=warpPad] run scoreboard players operation @s dist75 /= @e[tag=sourcePad,limit=1] distScale

	execute as @e[tag=warpPad] run scoreboard players operation @s dist75 += @s distX

#For warp pads in the overworld
#For level 1 warp pad
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=!netherWarp,tag=warpPad1,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad,scores={distX=..10000,distZ=..10000,dist45=..14143,dist30=..11548,dist60=..20000,dist15=..10353,dist75=..38638},tag=!netherWarp,tag=!endWarp] add warpInTier1

#For level 2 warp pad
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=!netherWarp,tag=warpPad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPadPlus,scores={distX=..50000,distZ=..50000,dist45=..70711,dist30=..57736,dist60=..100000,dist15=..51764,dist75=..193186},tag=!netherWarp,tag=!endWarp] add warpInTier2
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=!netherWarp,tag=warpPad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad1,scores={distX=..10000,distZ=..10000,dist45=..14143,dist30=..11548,dist60=..20000,dist15=..10353,dist75=..38638},tag=!netherWarp,tag=!endWarp] add warpInTier1

#For level 3 warp pad
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=!netherWarp,tag=warpPad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad3,tag=!netherWarp,tag=!endWarp] add warpInTier3
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=!netherWarp,tag=warpPad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad2,scores={distX=..50000,distZ=..50000,dist45=..70711,dist30=..57736,dist60=..100000,dist15=..51764,dist75=..193186},tag=!netherWarp,tag=!endWarp] add warpInTier2
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=!netherWarp,tag=warpPad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad1,scores={distX=..10000,distZ=..10000,dist45=..14143,dist30=..11548,dist60=..20000,dist15=..10353,dist75=..38638},tag=!netherWarp,tag=!endWarp] add warpInTier1

#For warp pads in the end
#For level 1 warp pad
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=endWarp,tag=!netherWarp,tag=warpPad1,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad,scores={distX=..10000,distZ=..10000,dist45=..14143,dist30=..11548,dist60=..20000,dist15=..10353,dist75=..38638},tag=!netherWarp,tag=endWarp] add warpInTier1

#For level 2 warp pad
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=endWarp,tag=!netherWarp,tag=warpPad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPadPlus,scores={distX=..50000,distZ=..50000,dist45=..70711,dist30=..57736,dist60=..100000,dist15=..51764,dist75=..193186},tag=!netherWarp,tag=endWarp] add warpInTier2
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=endWarp,tag=!netherWarp,tag=warpPad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad1,scores={distX=..10000,distZ=..10000,dist45=..14143,dist30=..11548,dist60=..20000,dist15=..10353,dist75=..38638},tag=!netherWarp,tag=endWarp] add warpInTier1

#For level 3 warp pad
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=endWarp,tag=!netherWarp,tag=warpPad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad3,tag=!netherWarp,tag=endWarp] add warpInTier3
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=endWarp,tag=!netherWarp,tag=warpPad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad2,scores={distX=..50000,distZ=..50000,dist45=..70711,dist30=..57736,dist60=..100000,dist15=..51764,dist75=..193186},tag=!netherWarp,tag=endWarp] add warpInTier2
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=endWarp,tag=!netherWarp,tag=warpPad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad1,scores={distX=..10000,distZ=..10000,dist45=..14143,dist30=..11548,dist60=..20000,dist15=..10353,dist75=..38638},tag=!netherWarp,tag=endWarp] add warpInTier1

#For warp pads in the nether
#For level 1 warp pad
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=netherWarp,tag=warpPad1,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad,scores={distX=..1250,distZ=..1250,dist45=..1768,dist30=..1444,dist60=..2500,dist15=..1295,dist75=..4830},tag=netherWarp,tag=!endWarp] add warpInTier1

#For level 2 warp pad
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=netherWarp,tag=warpPad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPadPlus,scores={distX=..6250,distZ=..6250,dist45=..8839,dist30=..7217,dist60=..12500,dist15=..6471,dist75=..24149},tag=netherWarp,tag=!endWarp] add warpInTier2
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=netherWarp,tag=warpPad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad1,scores={distX=..1250,distZ=..1250,dist45=..1768,dist30=..1444,dist60=..2500,dist15=..1295,dist75=..4830},tag=netherWarp,tag=!endWarp] add warpInTier1

#For level 3 warp pad
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=netherWarp,tag=warpPad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad3,tag=netherWarp,tag=!endWarp] add warpInTier3
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=netherWarp,tag=warpPad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad2,scores={distX=..6250,distZ=..6250,dist45=..8839,dist30=..7217,dist60=..12500,dist15=..6471,dist75=..24149},tag=netherWarp,tag=!endWarp] add warpInTier2
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s align xyz at @e[tag=!endWarp,tag=netherWarp,tag=warpPad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=warpPad1,scores={distX=..1250,distZ=..1250,dist45=..1768,dist30=..1444,dist60=..2500,dist15=..1295,dist75=..4830},tag=netherWarp,tag=!endWarp] add warpInTier1

#Remove private warp pads if their UUID doesn't match that of the player
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier1] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL matches 0 unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL = @s linkedUUIDL unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDM = @s linkedUUIDM run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier1
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier2] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL matches 0 unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL = @s linkedUUIDL unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDM = @s linkedUUIDM run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier2
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier3] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL matches 0 unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL = @s linkedUUIDL unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDM = @s linkedUUIDM run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier3
#For nether
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier1] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL matches 0 unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL = @s linkedUUIDL unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDM = @s linkedUUIDM run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier1
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier2] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL matches 0 unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL = @s linkedUUIDL unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDM = @s linkedUUIDM run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier2
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier3] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL matches 0 unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDL = @s linkedUUIDL unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] linkedUUIDM = @s linkedUUIDM run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier3

#Remove warp pads with different frequencies
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier1] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] warpStreamFreq = @e[tag=sourcePad,limit=1] warpStreamFreq run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier1
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier2] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] warpStreamFreq = @e[tag=sourcePad,limit=1] warpStreamFreq run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier2
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier3] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] warpStreamFreq = @e[tag=sourcePad,limit=1] warpStreamFreq run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier3
#For nether
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier1] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] warpStreamFreq = @e[tag=sourcePad,limit=1] warpStreamFreq run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier1
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier2] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] warpStreamFreq = @e[tag=sourcePad,limit=1] warpStreamFreq run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier2
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @e[tag=warpPad,tag=warpInTier3] unless score @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] warpStreamFreq = @e[tag=sourcePad,limit=1] warpStreamFreq run tag @e[tag=warpPad,distance=..0.1,limit=1,sort=nearest] remove warpInTier3

#For every player using a warp pad, run iterate2
	tag @e remove warpPadIterated
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s as @e[tag=sourcePad,distance=..1,limit=1] unless entity @s[tag=warpHasSelect] run scoreboard players set @e[tag=sourcePad,distance=..1,limit=1] warpTempID 1
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s as @e[tag=sourcePad,distance=..1,limit=1] unless entity @s[tag=warpHasSelect] run tag @s add warpHasSelect
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s if entity @e[tag=warpPad,distance=..1] at @e[tag=warpPad1,distance=..1,limit=1] run function warppad:iterate2/warp1
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s if entity @e[tag=warpPad,distance=..1] at @e[tag=warpPad2,distance=..1,limit=1] run function warppad:iterate2/warp2
	execute as @a[tag=wpUsing,tag=!wpIterated,limit=1] at @s if entity @e[tag=warpPad,distance=..1] at @e[tag=warpPad3,distance=..1,limit=1] run function warppad:iterate2/warp3
	tag @a[tag=wpUsing,tag=!wpIterated,limit=1] add wpIterated

#Again for each player who needs it fam
	execute if entity @a[tag=wpUsing,tag=!wpIterated] run function warppad:iterate