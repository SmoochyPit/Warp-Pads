#For level 1 warp pad
	tag @e[tag=wp.pad,scores={wp.distX=..50000,wp.distZ=..50000,wp.dist45=..70711,wp.dist30=..57736,wp.dist60=..100000,wp.dist15=..51764,wp.dist75=..193186},tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier1

#For level 2 warp pad
	tag @e[tag=wp.padPlus,scores={wp.distX=..250000,wp.distZ=..250000,wp.dist45=..353554,wp.dist30=..288676,wp.dist60=..500000,wp.dist15=..258820,wp.dist75=..965926},tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier2
	tag @e[tag=wp.pad1,scores={wp.distX=..50000,wp.distZ=..50000,wp.dist45=..70711,wp.dist30=..57736,wp.dist60=..100000,wp.dist15=..51764,wp.dist75=..193186},tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier1

#For level 3 warp pad
	tag @e[tag=wp.pad3,tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier3
	tag @e[tag=wp.pad2,scores={wp.distX=..250000,wp.distZ=..250000,wp.dist45=..353554,wp.dist30=..288676,wp.dist60=..500000,wp.dist15=..258820,wp.dist75=..965926},tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier2
	tag @e[tag=wp.pad1,scores={wp.distX=..50000,wp.distZ=..50000,wp.dist45=..70711,wp.dist30=..57736,wp.dist60=..100000,wp.dist15=..51764,wp.dist75=..193186},tag=!wp.netherWarp,tag=wp.endWarp] add wp.inTier1