#as every warp pad
#at that same warp pad
#
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
#All distances to the tenth of a block

#For 0 degree region
	scoreboard players operation @s wp.distX = @s wp.padX
    scoreboard players operation @s wp.distZ = @s wp.padZ
	scoreboard players operation @s wp.distX -= @e[tag=wp.sourcePad,limit=1] wp.padX
	scoreboard players operation @s wp.distZ -= @e[tag=wp.sourcePad,limit=1] wp.padZ
	execute if score @s wp.distX matches ..0 run scoreboard players operation @s wp.distX *= @e[tag=wp.sourcePad,limit=1] wp.negativeOne
	execute if score @s wp.distZ matches ..0 run scoreboard players operation @s wp.distZ *= @e[tag=wp.sourcePad,limit=1] wp.negativeOne

#Scale for more complex operations
	scoreboard players set @e[tag=wp.sourcePad] wp.distScale 1000

#For 45 degree region, tan(45) = 1
	scoreboard players operation @s wp.dist45 = @s wp.distZ
	scoreboard players operation @s wp.dist45 += @s wp.distX

#For 30 degree region, tan(30) = 0.577 = 1 / 1.732 ##### x / 1.732 = x / 1732 * 1000
	scoreboard players operation @s wp.dist30 = @s wp.distZ
	scoreboard players set @s wp.distScale 1732
	scoreboard players operation @s wp.dist30 *= @e[tag=wp.sourcePad,limit=1] wp.distScale
	scoreboard players operation @s wp.dist30 /= @s wp.distScale

	scoreboard players operation @s wp.dist30 += @s wp.distX

#For 60 degree region, tan(60) = 1.732 ##### x * 1.732 = x * 1732 / 1000
	scoreboard players operation @s wp.dist60 = @s wp.distZ
	#Reuse wp.distScale from 30 degree region
	scoreboard players operation @s wp.dist60 *= @s wp.distScale
	scoreboard players operation @s wp.dist60 /= @e[tag=wp.sourcePad,limit=1] wp.distScale

	scoreboard players operation @s wp.dist60 += @s wp.distX

#For 15 degree region, tan(15) = 0.268 = 1 / 3.732 ##### x / 3.732 = x / 3732 * 1000
	scoreboard players operation @s wp.dist15 = @s wp.distZ
	scoreboard players set @s wp.distScale 3732
	scoreboard players operation @s wp.dist15 *= @e[tag=wp.sourcePad,limit=1] wp.distScale
	scoreboard players operation @s wp.dist15 /= @s wp.distScale

	scoreboard players operation @s wp.dist15 += @s wp.distX

#For 75 degree region, tan(75) = 3.732 ##### x * 3.732 = x * 3732 / 1000
	scoreboard players operation @s wp.dist75 = @s wp.distZ
	#Reuse wp.distScale from 15 degree region
	scoreboard players operation @s wp.dist75 *= @s wp.distScale
	scoreboard players operation @s wp.dist75 /= @e[tag=wp.sourcePad,limit=1] wp.distScale

	scoreboard players operation @s wp.dist75 += @s wp.distX