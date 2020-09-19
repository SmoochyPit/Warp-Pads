#Particle Effects for certain situations

#Displays the name above the markers when they are looked at.
	execute as @e[tag=wp.locIcon] run data merge entity @s {CustomNameVisible:false}
	execute as @e[tag=wp.selCastIcon] if data entity @s CustomName run data merge entity @s {CustomNameVisible:true}

#Passenger Ring
    scoreboard players add @e[tag=wp.pad,sort=nearest,limit=1] wp.anim1delay 1
    scoreboard players set @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1delay=3..}] wp.anim1delay 1
    scoreboard players add @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1delay=1}] wp.anim1time 1
    scoreboard players set @e[tag=wp.pad,sort=nearest,distance=..1,scores={wp.anim1time=9..}] wp.anim1time 1
    execute as @e[tag=wp.pad,sort=nearest,limit=1,distance=..1,scores={wp.anim1delay=1}] at @s run function warppad:cosmetics/ring

#Selection Icon Particles
    execute as @e[tag=wp.locIcon,tag=!wp.selCastIcon,distance=..5] at @s run function warppad:cosmetics/icons
    execute as @e[tag=wp.locIcon,tag=wp.selCastIcon,distance=..5] at @s run function warppad:cosmetics/selectedicons