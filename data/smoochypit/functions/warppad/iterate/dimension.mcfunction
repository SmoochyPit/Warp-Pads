execute at @e[tag=!wp.endWarp,tag=!wp.netherWarp,tag=wp.pad,dx=0,dy=0,dz=0,limit=1] run function smoochypit:warppad/iterate/tag/overworld
execute at @e[tag=wp.endWarp,tag=!wp.netherWarp,tag=wp.pad,dx=0,dy=0,dz=0,limit=1] run function smoochypit:warppad/iterate/tag/end
execute at @e[tag=!wp.endWarp,tag=wp.netherWarp,tag=wp.pad,dx=0,dy=0,dz=0,limit=1] run function smoochypit:warppad/iterate/tag/nether