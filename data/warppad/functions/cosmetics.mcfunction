#Particle Effects for certain situations

#Displays the name above the markers when they are looked at.
	execute as @e[tag=warpLocIcon] run data merge entity @s {CustomNameVisible:false}
	execute as @e[tag=SelCastIcon] if data entity @s CustomName run data merge entity @s {CustomNameVisible:true}

#Passenger Ring
    scoreboard players add @e[tag=warpPad,sort=nearest,limit=1] anim1delay 1
    scoreboard players set @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1delay=3..}] anim1delay 1
    scoreboard players add @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1delay=1}] anim1time 1
    scoreboard players set @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=9..}] anim1time 1
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=1,anim1delay=1}] run particle witch ~ ~-.25 ~2 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=2,anim1delay=1}] run particle witch ~.77 ~-.25 ~1.85 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=3,anim1delay=1}] run particle witch ~1.4 ~-.25 ~1.4 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=4,anim1delay=1}] run particle witch ~1.85 ~-.25 ~.77 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=5,anim1delay=1}] run particle witch ~2 ~-.25 ~ 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=6,anim1delay=1}] run particle witch ~1.85 ~-.25 ~-.77 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=7,anim1delay=1}] run particle witch ~1.4 ~-.25 ~-1.4 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=8,anim1delay=1}] run particle witch ~-.77 ~-.25 ~1.85 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=1,anim1delay=1}] run particle witch ~ ~-.25 ~-2 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=2,anim1delay=1}] run particle witch ~-.77 ~-.25 ~-1.85 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=3,anim1delay=1}] run particle witch ~-1.4 ~-.25 ~-1.4 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=4,anim1delay=1}] run particle witch ~-1.85 ~-.25 ~-.77 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=5,anim1delay=1}] run particle witch ~-2 ~-.25 ~ 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=6,anim1delay=1}] run particle witch ~-1.85 ~-.25 ~.77 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=7,anim1delay=1}] run particle witch ~-1.4 ~-.25 ~1.4 0 0 0 0 1 force @a
    execute at @e[tag=warpPad,sort=nearest,distance=..1,scores={anim1time=8,anim1delay=1}] run particle witch ~.77 ~-.25 ~-1.85 0 0 0 0 1 force @a

#Selection Icon Particles
    scoreboard players add @e[tag=warpLocIcon,distance=..5] anim1delay 1
    scoreboard players set @e[tag=warpLocIcon,distance=..5,scores={anim1delay=0..}] anim1delay 1
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=0},distance=..5] at @s run particle minecraft:dust 0.75 0 0.75 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=1},distance=..5] at @s run particle minecraft:dust 1 0 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=2},distance=..5] at @s run particle minecraft:dust 0 0.4 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=3},distance=..5] at @s run particle minecraft:dust 0.5 0 1 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=4},distance=..5] at @s run particle minecraft:dust 0 0.5 0.5 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=5},distance=..5] at @s run particle minecraft:dust 0.75 0.75 0.75 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=6},distance=..5] at @s run particle minecraft:dust 0.25 0.25 0.25 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=7},distance=..5] at @s run particle minecraft:dust 1 0.5 0.75 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=8},distance=..5] at @s run particle minecraft:dust 0 0.8 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=9},distance=..5] at @s run particle minecraft:dust 1 1 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=10},distance=..5] at @s run particle minecraft:dust 0.5 0.75 1 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=11},distance=..5] at @s run particle minecraft:dust 1 0 1 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=12},distance=..5] at @s run particle minecraft:dust 1 0.5 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=13},distance=..5] at @s run particle minecraft:dust 0 0 1 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=14},distance=..5] at @s run particle minecraft:dust 0.5 0.25 0 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=15},distance=..5] at @s run particle minecraft:dust 0.1 0.1 0.1 0.5 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={iconColor1=16},distance=..5] at @s run particle minecraft:dust 1 1 1 0.5 ~ ~ ~ 0 0 0 1 1 force @a

    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=0},distance=..5] at @s run particle minecraft:dust 0.75 0 0.75 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=1},distance=..5] at @s run particle minecraft:dust 1 0 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=2},distance=..5] at @s run particle minecraft:dust 0 0.4 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=3},distance=..5] at @s run particle minecraft:dust 0.5 0 1 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=4},distance=..5] at @s run particle minecraft:dust 0 0.5 0.5 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=5},distance=..5] at @s run particle minecraft:dust 0.75 0.75 0.75 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=6},distance=..5] at @s run particle minecraft:dust 0.25 0.25 0.25 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=7},distance=..5] at @s run particle minecraft:dust 1 0.5 0.75 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=8},distance=..5] at @s run particle minecraft:dust 0 0.8 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=9},distance=..5] at @s run particle minecraft:dust 1 1 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=10},distance=..5] at @s run particle minecraft:dust 0.5 0.75 1 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=11},distance=..5] at @s run particle minecraft:dust 1 0 1 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=12},distance=..5] at @s run particle minecraft:dust 1 0.5 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=13},distance=..5] at @s run particle minecraft:dust 0 0 1 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=14},distance=..5] at @s run particle minecraft:dust 0.5 0.25 0 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=15},distance=..5] at @s run particle minecraft:dust 0.1 0.1 0.1 1 ~ ~ ~ 0 0 0 1 1 force @a
    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={iconColor1=16},distance=..5] at @s run particle minecraft:dust 1 1 1 1 ~ ~ ~ 0 0 0 1 1 force @a

#For unselected icons - UNUSED NOW, based particles off of proximity
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=1}] at @s run particle minecraft:dust 0.5 0 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=2}] at @s run particle minecraft:dust 1 0 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=3}] at @s run particle minecraft:dust 1 0.5 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=4}] at @s run particle minecraft:dust 1 1 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=5}] at @s run particle minecraft:dust 0.5 1 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=6}] at @s run particle minecraft:dust 0 1 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=7}] at @s run particle minecraft:dust 0 1 0.5 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=8}] at @s run particle minecraft:dust 0 1 1 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=9}] at @s run particle minecraft:dust 0 0.5 1 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=10}] at @s run particle minecraft:dust 0 0 1 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=11}] at @s run particle minecraft:dust 0.5 0 1 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=12}] at @s run particle minecraft:dust 1 0 1 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=13}] at @s run particle minecraft:dust 1 0 0.5 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=14}] at @s run particle minecraft:dust 0.25 0 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=15}] at @s run particle minecraft:dust 0.5 0 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=16}] at @s run particle minecraft:dust 0.5 0.25 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=17}] at @s run particle minecraft:dust 0.5 0.5 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=18}] at @s run particle minecraft:dust 0.25 0.5 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=19}] at @s run particle minecraft:dust 0 0.5 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=20}] at @s run particle minecraft:dust 0 0.5 0.5 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=21}] at @s run particle minecraft:dust 0 0.5 0.5 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=22}] at @s run particle minecraft:dust 0 0.25 0.5 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=23}] at @s run particle minecraft:dust 0 0 0.5 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=24}] at @s run particle minecraft:dust 0.25 0 0.5 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=25}] at @s run particle minecraft:dust 0.5 0 0.5 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=26}] at @s run particle minecraft:dust 0.5 0 0.25 1 ~ ~ ~ 0 0 0 1 1 force @a
#   execute as @e[tag=warpLocIcon,tag=!SelCastIcon,scores={warpTempID=27..}] at @s run particle minecraft:dust 1 1 1 1 ~ ~ ~ 0 0 0 1 1 force @a
#For selected icons
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon] at @s run particle minecraft:dust 0 0 0 1 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=1}] at @s run particle minecraft:dust 0.5 0 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=2}] at @s run particle minecraft:dust 1 0 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=3}] at @s run particle minecraft:dust 1 0.5 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=4}] at @s run particle minecraft:dust 1 1 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=5}] at @s run particle minecraft:dust 0.5 1 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=6}] at @s run particle minecraft:dust 0 1 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=7}] at @s run particle minecraft:dust 0 1 0.5 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=8}] at @s run particle minecraft:dust 0 1 1 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=9}] at @s run particle minecraft:dust 0 0.5 1 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=10}] at @s run particle minecraft:dust 0 0 1 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=11}] at @s run particle minecraft:dust 0.5 0 1 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=12}] at @s run particle minecraft:dust 1 0 1 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=13}] at @s run particle minecraft:dust 1 0 0.5 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=14}] at @s run particle minecraft:dust 0.25 0 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=15}] at @s run particle minecraft:dust 0.5 0 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=16}] at @s run particle minecraft:dust 0.5 0.25 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=17}] at @s run particle minecraft:dust 0.5 0.5 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=18}] at @s run particle minecraft:dust 0.25 0.5 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=19}] at @s run particle minecraft:dust 0 0.5 0 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=20}] at @s run particle minecraft:dust 0 0.5 0.5 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=21}] at @s run particle minecraft:dust 0 0.5 0.5 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=22}] at @s run particle minecraft:dust 0 0.25 0.5 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=23}] at @s run particle minecraft:dust 0 0 0.5 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=24}] at @s run particle minecraft:dust 0.25 0 0.5 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=25}] at @s run particle minecraft:dust 0.5 0 0.5 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=26}] at @s run particle minecraft:dust 0.5 0 0.25 1.5 ~ ~ ~ 0 0 0 1 1 force @a
#    execute as @e[tag=warpLocIcon,tag=SelCastIcon,scores={warpTempID=27..}] at @s run particle minecraft:dust 1 1 1 1.5 ~ ~ ~ 0 0 0 1 1 force @a