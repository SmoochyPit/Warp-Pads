execute unless entity @e[tag=warpPad] run function smoochypit:warppad/setup/install

#Legacy support
    #If linkedUUIDL objective exists
execute if entity @e[tag=warpPad] as @e[tag=warpPad] if score @s linkedUUIDL matches -2147483648..2147483647 run function smoochypit:warppad/setup/legacypriv
execute if entity @e[tag=warpPad] run function smoochypit:warppad/setup/legacyobj
tag @e[tag=warpPad] remove wp.legacyPriv

execute if entity @e[tag=warpPad] run function smoochypit:warppad/setup/legacytags