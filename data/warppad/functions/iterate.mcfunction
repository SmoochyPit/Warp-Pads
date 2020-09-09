#This gets really really hard to follow. Stay with me, though.
#Source Pad
	tag @e remove wp.sourcePad
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz run tag @e[tag=wp.pad,dx=0,dy=0,dz=0,limit=1,sort=nearest] add wp.sourcePad
	scoreboard players set @e[tag=wp.sourcePad] wp.negativeOne -1

#Tag every warp pad within a range
#Remove Tags
	tag @e[tag=wp.pad] remove wp.inTier1
	tag @e[tag=wp.pad] remove wp.inTier2
	tag @e[tag=wp.pad] remove wp.inTier3
	tag @a[tag=wp.using,tag=!wp.iterated,limit=1] remove wp.onTier1
	tag @a[tag=wp.using,tag=!wp.iterated,limit=1] remove wp.onTier2
	tag @a[tag=wp.using,tag=!wp.iterated,limit=1] remove wp.onTier3
#For players and what pad they're on
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=wp.pad1,dx=0,dy=0,dz=0,limit=1] run tag @s add wp.onTier1
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=wp.pad2,dx=0,dy=0,dz=0,limit=1] run tag @s add wp.onTier2
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=wp.pad3,dx=0,dy=0,dz=0,limit=1] run tag @s add wp.onTier3

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
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.distX = @s wp.padX
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.distZ = @s wp.padZ
	execute as @e[tag=wp.sourcePad,limit=1] at @e[tag=wp.pad] run scoreboard players operation @e[tag=wp.pad,limit=1,sort=nearest,distance=..0.1] wp.distX -= @s wp.padX
	execute as @e[tag=wp.sourcePad,limit=1] at @e[tag=wp.pad] run scoreboard players operation @e[tag=wp.pad,limit=1,sort=nearest,distance=..0.1] wp.distZ -= @s wp.padZ
	execute as @e[tag=wp.pad,scores={wp.distX=..0}] run scoreboard players operation @s wp.distX *= @e[tag=wp.sourcePad,limit=1] wp.negativeOne
	execute as @e[tag=wp.pad,scores={wp.distZ=..0}] run scoreboard players operation @s wp.distZ *= @e[tag=wp.sourcePad,limit=1] wp.negativeOne

#Scale for more complex operations
	scoreboard players set @e[tag=wp.sourcePad] wp.distScale 1000

#For 45 degree region, tan(45) = 1
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist45 = @s wp.distZ
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist45 += @s wp.distX

#For 30 degree region, tan(30) = 0.577 = 1 / 1.732 ##### x / 1.732 = x / 1732 * 1000
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist30 = @s wp.distZ
	scoreboard players set @e[tag=wp.pad] wp.distScale 1732
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist30 /= @s wp.distScale
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist30 *= @e[tag=wp.sourcePad,limit=1] wp.distScale

	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist60 += @s wp.distX

#For 60 degree region, tan(60) = 1.732 ##### x * 1.732 = x * 1732 / 1000
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist60 = @s wp.distZ
	#Reuse wp.distScale from 30 degree region
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist60 *= @s wp.distScale
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist60 /= @e[tag=wp.sourcePad,limit=1] wp.distScale

	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist60 += @s wp.distX

#For 15 degree region, tan(15) = 0.268 = 1 / 3.732 ##### x / 3.732 = x / 3732 * 1000
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist15 = @s wp.distZ
	scoreboard players set @e[tag=wp.pad] wp.distScale 3732
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist15 /= @s wp.distScale
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist15 *= @e[tag=wp.sourcePad,limit=1] wp.distScale

	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist15 += @s wp.distX

#For 75 degree region, tan(75) = 3.732 ##### x * 3.732 = x * 3732 / 1000
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist75 = @s wp.distZ
	#Reuse wp.distScale from 15 degree region
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist75 *= @s wp.distScale
	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist75 /= @e[tag=wp.sourcePad,limit=1] wp.distScale

	execute as @e[tag=wp.pad] run scoreboard players operation @s wp.dist75 += @s wp.distX

#For warp pads in the overworld
#For level 1 warp pad
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=!wp.netherWarp,tag=wp.pad1,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad,scores={wp.distX=..10000,wp.distZ=..10000,wp.dist45=..14143,wp.dist30=..11548,wp.dist60=..20000,wp.dist15=..10353,wp.dist75=..38638},tag=!wp.netherWarp,tag=!wp.endWarp] add wp.inTier1

#For level 2 warp pad
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=!wp.netherWarp,tag=wp.pad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.padPlus,scores={wp.distX=..50000,wp.distZ=..50000,wp.dist45=..70711,wp.dist30=..57736,wp.dist60=..100000,wp.dist15=..51764,wp.dist75=..193186},tag=!wp.netherWarp,tag=!wp.endWarp] add wp.inTier2
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=!wp.netherWarp,tag=wp.pad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad1,scores={wp.distX=..10000,wp.distZ=..10000,wp.dist45=..14143,wp.dist30=..11548,wp.dist60=..20000,wp.dist15=..10353,wp.dist75=..38638},tag=!wp.netherWarp,tag=!wp.endWarp] add wp.inTier1

#For level 3 warp pad
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=!wp.netherWarp,tag=wp.pad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad3,tag=!wp.netherWarp,tag=!wp.endWarp] add wp.inTier3
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=!wp.netherWarp,tag=wp.pad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad2,scores={wp.distX=..50000,wp.distZ=..50000,wp.dist45=..70711,wp.dist30=..57736,wp.dist60=..100000,wp.dist15=..51764,wp.dist75=..193186},tag=!wp.netherWarp,tag=!wp.endWarp] add wp.inTier2
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=!wp.netherWarp,tag=wp.pad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad1,scores={wp.distX=..10000,wp.distZ=..10000,wp.dist45=..14143,wp.dist30=..11548,wp.dist60=..20000,wp.dist15=..10353,wp.dist75=..38638},tag=!wp.netherWarp,tag=!wp.endWarp] add wp.inTier1

#For warp pads in the end
#For level 1 warp pad
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=wp.endWarp,tag=!wp.netherWarp,tag=wp.pad1,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad,scores={wp.distX=..10000,wp.distZ=..10000,wp.dist45=..14143,wp.dist30=..11548,wp.dist60=..20000,wp.dist15=..10353,wp.dist75=..38638},tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier1

#For level 2 warp pad
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=wp.endWarp,tag=!wp.netherWarp,tag=wp.pad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.padPlus,scores={wp.distX=..50000,wp.distZ=..50000,wp.dist45=..70711,wp.dist30=..57736,wp.dist60=..100000,wp.dist15=..51764,wp.dist75=..193186},tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier2
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=wp.endWarp,tag=!wp.netherWarp,tag=wp.pad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad1,scores={wp.distX=..10000,wp.distZ=..10000,wp.dist45=..14143,wp.dist30=..11548,wp.dist60=..20000,wp.dist15=..10353,wp.dist75=..38638},tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier1

#For level 3 warp pad
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=wp.endWarp,tag=!wp.netherWarp,tag=wp.pad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad3,tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier3
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=wp.endWarp,tag=!wp.netherWarp,tag=wp.pad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad2,scores={wp.distX=..50000,wp.distZ=..50000,wp.dist45=..70711,wp.dist30=..57736,wp.dist60=..100000,wp.dist15=..51764,wp.dist75=..193186},tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier2
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=wp.endWarp,tag=!wp.netherWarp,tag=wp.pad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad1,scores={wp.distX=..10000,wp.distZ=..10000,wp.dist45=..14143,wp.dist30=..11548,wp.dist60=..20000,wp.dist15=..10353,wp.dist75=..38638},tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier1

#For warp pads in the nether
#For level 1 warp pad
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=wp.netherWarp,tag=wp.pad1,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad,scores={wp.distX=..1250,wp.distZ=..1250,wp.dist45=..1768,wp.dist30=..1444,wp.dist60=..2500,wp.dist15=..1295,wp.dist75=..4830},tag=wp.netherWarp,tag=!wp.endWarp] add wp.inTier1

#For level 2 warp pad
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=wp.netherWarp,tag=wp.pad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.padPlus,scores={wp.distX=..6250,wp.distZ=..6250,wp.dist45=..8839,wp.dist30=..7217,wp.dist60=..12500,wp.dist15=..6471,wp.dist75=..24149},tag=wp.netherWarp,tag=!wp.endWarp] add wp.inTier2
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=wp.netherWarp,tag=wp.pad2,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad1,scores={wp.distX=..1250,wp.distZ=..1250,wp.dist45=..1768,wp.dist30=..1444,wp.dist60=..2500,wp.dist15=..1295,wp.dist75=..4830},tag=wp.netherWarp,tag=!wp.endWarp] add wp.inTier1

#For level 3 warp pad
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=wp.netherWarp,tag=wp.pad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad3,tag=wp.netherWarp,tag=!wp.endWarp] add wp.inTier3
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=wp.netherWarp,tag=wp.pad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad2,scores={wp.distX=..6250,wp.distZ=..6250,wp.dist45=..8839,wp.dist30=..7217,wp.dist60=..12500,wp.dist15=..6471,wp.dist75=..24149},tag=wp.netherWarp,tag=!wp.endWarp] add wp.inTier2
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s align xyz at @e[tag=!wp.endWarp,tag=wp.netherWarp,tag=wp.pad3,dx=0,dy=0,dz=0,limit=1] run tag @e[tag=wp.pad1,scores={wp.distX=..1250,wp.distZ=..1250,wp.dist45=..1768,wp.dist30=..1444,wp.dist60=..2500,wp.dist15=..1295,wp.dist75=..4830},tag=wp.netherWarp,tag=!wp.endWarp] add wp.inTier1

#Remove private warp pads if their UUID doesn't match that of the player
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @e[tag=wp.pad,tag=wp.inTier1] unless score @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] wp.linkedUUID matches 0 unless score @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] wp.linkedUUID = @s wp.linkedUUID run tag @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] remove wp.inTier1
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @e[tag=wp.pad,tag=wp.inTier2] unless score @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] wp.linkedUUID matches 0 unless score @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] wp.linkedUUID = @s wp.linkedUUID run tag @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] remove wp.inTier2
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @e[tag=wp.pad,tag=wp.inTier3] unless score @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] wp.linkedUUID matches 0 unless score @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] wp.linkedUUID = @s wp.linkedUUID run tag @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] remove wp.inTier3

#Remove warp pads with different frequencies
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @e[tag=wp.pad,tag=wp.inTier1] unless score @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] wp.streamFreq = @e[tag=wp.sourcePad,limit=1] wp.streamFreq run tag @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] remove wp.inTier1
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @e[tag=wp.pad,tag=wp.inTier2] unless score @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] wp.streamFreq = @e[tag=wp.sourcePad,limit=1] wp.streamFreq run tag @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] remove wp.inTier2
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @e[tag=wp.pad,tag=wp.inTier3] unless score @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] wp.streamFreq = @e[tag=wp.sourcePad,limit=1] wp.streamFreq run tag @e[tag=wp.pad,distance=..0.1,limit=1,sort=nearest] remove wp.inTier3

#For every player using a warp pad, run iterate2
	tag @e remove wp.padIterated
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s as @e[tag=wp.sourcePad,distance=..1,limit=1] unless entity @s[tag=wp.hasSelect] run scoreboard players set @e[tag=wp.sourcePad,distance=..1,limit=1] wp.tempID 1
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s as @e[tag=wp.sourcePad,distance=..1,limit=1] unless entity @s[tag=wp.hasSelect] run tag @s add wp.hasSelect
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s if entity @e[tag=wp.pad,distance=..1] at @e[tag=wp.pad1,distance=..1,limit=1] run function warppad:iterate2/warp1
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s if entity @e[tag=wp.pad,distance=..1] at @e[tag=wp.pad2,distance=..1,limit=1] run function warppad:iterate2/warp2
	execute as @a[tag=wp.using,tag=!wp.iterated,limit=1] at @s if entity @e[tag=wp.pad,distance=..1] at @e[tag=wp.pad3,distance=..1,limit=1] run function warppad:iterate2/warp3
	tag @a[tag=wp.using,tag=!wp.iterated,limit=1] add wp.iterated

#Again for each player who needs it fam
	execute if entity @a[tag=wp.using,tag=!wp.iterated] run function warppad:iterate