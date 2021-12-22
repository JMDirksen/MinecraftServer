# Setup
scoreboard objectives add onjoin dummy
scoreboard objectives add onjoin_timer dummy

# Make sure all online players have a onjoin score set
scoreboard players add @a onjoin 0

# Start 5 sec. timer for players with a onjoin score of 0
scoreboard players set @a[scores={onjoin=0}] onjoin_timer 100

# Send message to players with a onjoin_timer score of 1
execute @a[scores={onjoin_timer=1}] ~ ~ ~ tellraw @s {"rawtext":[{"text":"§aWelcome §6"},{"selector":"@s"}]}
execute @a[scores={onjoin_timer=1}] ~ ~ ~ tellraw @s {"rawtext":[{"text":"§aJoin our §9Discord §a@ §bdiscord.gg/waXRv5HQWk"}]}

# Countdown timer
scoreboard players remove @a[scores={onjoin_timer=1..}] onjoin_timer 1

# Set onjoin score to 0 for offline players
scoreboard players set * onjoin 0
scoreboard players set @a onjoin 1
