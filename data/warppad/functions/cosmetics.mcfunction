#Particle Effects for certain situations

#Displays the name above the markers when they are looked at.
	execute as @e[tag=wp.locIcon] run data merge entity @s {CustomNameVisible:false}
	execute as @e[tag=wp.selCastIcon] if data entity @s CustomName run data merge entity @s {CustomNameVisible:true}

#Passenger Ring
    scoreboard players add @e[tag=wp.pad,sort=nearest,limit=1] wp.anim1delay 1
    scoreboard players set @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1delay=3..}] wp.anim1delay 1
    scoreboard players add @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1delay=1}] wp.anim1time 1
    scoreboard players set @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=9..}] wp.anim1time 1
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=1,wp.anim1delay=1}] run particle witch ~ ~-.25 ~2 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=2,wp.anim1delay=1}] run particle witch ~.77 ~-.25 ~1.85 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=3,wp.anim1delay=1}] run particle witch ~1.4 ~-.25 ~1.4 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=4,wp.anim1delay=1}] run particle witch ~1.85 ~-.25 ~.77 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=5,wp.anim1delay=1}] run particle witch ~2 ~-.25 ~ 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=6,wp.anim1delay=1}] run particle witch ~1.85 ~-.25 ~-.77 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=7,wp.anim1delay=1}] run particle witch ~1.4 ~-.25 ~-1.4 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=8,wp.anim1delay=1}] run particle witch ~-.77 ~-.25 ~1.85 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=1,wp.anim1delay=1}] run particle witch ~ ~-.25 ~-2 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=2,wp.anim1delay=1}] run particle witch ~-.77 ~-.25 ~-1.85 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=3,wp.anim1delay=1}] run particle witch ~-1.4 ~-.25 ~-1.4 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=4,wp.anim1delay=1}] run particle witch ~-1.85 ~-.25 ~-.77 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=5,wp.anim1delay=1}] run particle witch ~-2 ~-.25 ~ 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=6,wp.anim1delay=1}] run particle witch ~-1.85 ~-.25 ~.77 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=7,wp.anim1delay=1}] run particle witch ~-1.4 ~-.25 ~1.4 0 0 0 0 1 force @a
    execute at @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=8,wp.anim1delay=1}] run particle witch ~.77 ~-.25 ~-1.85 0 0 0 0 1 force @a

#Selection Icon Particles
    scoreboard players add @e[tag=wp.locIcon,distance=..5] wp.anim1delay 1
    scoreboard players set @e[tag=wp.locIcon,distance=..5,scores={wp.anim1delay=0..}] wp.anim1delay 1
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=0},distance=..5] at @s run particle minecraft:dust 0.75 0 0.75 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=1},distance=..5] at @s run particle minecraft:dust 1 0 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=2},distance=..5] at @s run particle minecraft:dust 0 0.4 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=3},distance=..5] at @s run particle minecraft:dust 0.5 0 1 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=4},distance=..5] at @s run particle minecraft:dust 0 0.5 0.5 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=5},distance=..5] at @s run particle minecraft:dust 0.75 0.75 0.75 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=6},distance=..5] at @s run particle minecraft:dust 0.25 0.25 0.25 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=7},distance=..5] at @s run particle minecraft:dust 1 0.5 0.75 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=8},distance=..5] at @s run particle minecraft:dust 0 0.8 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=9},distance=..5] at @s run particle minecraft:dust 1 1 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=10},distance=..5] at @s run particle minecraft:dust 0.5 0.75 1 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=11},distance=..5] at @s run particle minecraft:dust 1 0 1 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=12},distance=..5] at @s run particle minecraft:dust 1 0.5 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=13},distance=..5] at @s run particle minecraft:dust 0 0 1 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=14},distance=..5] at @s run particle minecraft:dust 0.5 0.25 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=15},distance=..5] at @s run particle minecraft:dust 0.1 0.1 0.1 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,scores={wp.iconColor=16},distance=..5] at @s run particle minecraft:dust 1 1 1 0.5 ~ ~ ~ 0 0 0 1 1 force @a

    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=0},distance=..5] at @s run particle minecraft:dust 0.75 0 0.75 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=1},distance=..5] at @s run particle minecraft:dust 1 0 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=2},distance=..5] at @s run particle minecraft:dust 0 0.4 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=3},distance=..5] at @s run particle minecraft:dust 0.5 0 1 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=4},distance=..5] at @s run particle minecraft:dust 0 0.5 0.5 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=5},distance=..5] at @s run particle minecraft:dust 0.75 0.75 0.75 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=6},distance=..5] at @s run particle minecraft:dust 0.25 0.25 0.25 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=7},distance=..5] at @s run particle minecraft:dust 1 0.5 0.75 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=8},distance=..5] at @s run particle minecraft:dust 0 0.8 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=9},distance=..5] at @s run particle minecraft:dust 1 1 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=10},distance=..5] at @s run particle minecraft:dust 0.5 0.75 1 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=11},distance=..5] at @s run particle minecraft:dust 1 0 1 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=12},distance=..5] at @s run particle minecraft:dust 1 0.5 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=13},distance=..5] at @s run particle minecraft:dust 0 0 1 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=14},distance=..5] at @s run particle minecraft:dust 0.5 0.25 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=15},distance=..5] at @s run particle minecraft:dust 0.1 0.1 0.1 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,scores={wp.iconColor=16},distance=..5] at @s run particle minecraft:dust 1 1 1 1 ~ ~ ~ 0 0 0 1 1 force @a