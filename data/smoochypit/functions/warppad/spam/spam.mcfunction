#This function will repeat itself every x seconds to reset the "warpSpam" objective.

scoreboard players set @a wp.spam 0

schedule function smoochypit:warppad/spam/spam 15s