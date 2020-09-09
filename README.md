# Warp Pads

Warp Pads is a data pack for Minecraft: Java Edition enabling players to create and teleport between warp pads in the world. It is designed to be balanced for survival Minecraft, but beneficial for players in all game modes.

## About

### Features

* Multiplayer friendly
* No additional resource packs required
* Effectively infinite warp distances
* Balanced tiers for each game stage
* Warp pad customization
    * Warp pad labeling
    * Warp pad indicator colors
    * Warp pad decoration
* Very low performance impact
* Custom advancements
* Warp stream frequencies for extra organization
* No constant cooldowns or long animations
    * Rapid warping on lower tiers will trigger a cooldown to encourage higher tiers
* Private warp pads linked to players
* Warping passenger system

### A Brief History

I started this project Fall 2018. I was able to accomplish very basic functionality. However, due to the technical limitations of data packs at the time, it was mostly a proof-of-concept and could only warp to warp pads within render distance. However, in Minecraft version 1.14.4, an important change was made that would enable this data pack to become what it is now: data packs could now use `/forceload`. So, in July 2019, I began adding to and rewriting the code for the data pack and by August, I was ready to share it with the internet. Since then, many features and changes have been made.

## Usage

To warp, stand on a warp pad, look at the indicator for the desired warp pad and sneak (Left-Shift by default). Any mobs or players on top of the warp pad will be warped, too.

### Creation

Each warp pad requires a primary item and four secondary items to be dropped onto a base block. Instructions for each tier are as follows:
* Tier 1 - Throw a Golden Apple and 4 Nether Quartz on top of a Gold Block. Has a maximum radius of 1000 blocks.
* Tier 2 - Throw a Ghast Tear and 4 Phantom Membranes on top of an Emerald Block. Has a maximum radius of 5000 blocks.
* Tier 3 - Throw a Nether Star and 4 Ender Pearls on top of a Diamond Block. Has no maximum distance.

Warp Pads must be more than 3 blocks apart from one another.

### Labeling 

* To label a warp pad, name the primary item prior to creating the warp pad.
* To relabel a warp pad, throw a named piece of Paper on top of the warp pad after it has been created.

### Destruction

To destroy any warp pad, break the block as you normally would with the proper tool.

The following items will be dropped (if applicable):
* The primary item, possibly named
    * Golden Apple
    * Ghast Tear
    * Nether Star
* The base block
    * Gold Block
    * Emerald Block
    * Diamond Block
* All Redstone Dust used in changing the warp stream frequency
* A Diamond for a private warp pad

The following items will *not* be dropped:
* Four secondary items
    * Nether Quartz
    * Phantom Membranes
    * Ender Pearls
* Any dyes used in changing the icon color

### Other

* To change the color of the warp pad icon, throw the corresponding Dye on top of the warp pad.
* To change the warp stream frequency, throw a Redstone Dust on top of a warp pad.
* To make a warp pad private, throw a Diamond on top of the ward pad.

Warp pads in the nether are limited to 1/8th the distance of those in the overworld.

## Installation
### Step 1 - Download

1. Click [releases](https://github.com/SmoochyPit/Warp-Pads/releases)
2. Find the latest release
3. Choose one of the following ways to download: (Option 1 is recommended if available).
    1. Under assets, click "WarpPadsvX.X.X.zip" to download the archived data pack. *This file **should not** be unzipped before installation*
    2. Under assets, click "Source Code (zip)" to download the zipped data pack folder. *This file needs to be unzipped before installation*
4. Select one of the following methods for installing the data pack:

### Step 2 - Data pack menu (New singleplayer worlds) (Very Easy)

1. In the Singleplayer menu, click "Create New World"
2. Click "Data Packs"
3. Drag the downloaded file onto your Minecraft window (toggle fullscreen with F11)
4. Click "Yes"
5. Hover over Warp Pads in the menu and click the right arrow to add it to the list of selected data packs
6. Click "Done" and change any other world options you want
7. Click "Create New World"

### Step 2 - Manual installation (Existing singleplayer or multiplayer worlds) (Easy)

1. Place the downloaded file into the `[worldname]\datapacks` folder on your server or singleplayer world (located at `C:\Users\[user]\AppData\Roaming\.minecraft\saves\[worldname]\datapacks` by default in Windows)
2. Either restart the world or server, or run the `/reload` command. If successful on `/reload`, the pack will announce to all players in chat: "Warp Pads has loaded"

At this point, Warp Pads will now be installed in your Minecraft world.

### Step 3 - Updating

1. Follow step 1 to download the latest release
2. Delete the previous installation (Refer to step 2 for locating this file)
3. Follow step 2 to install the new data pack manually
4. Run `/reload` with a player online to check for any errors

### Support

Supports Minecraft: Java Edition 1.16-1.16.3. A legacy version supporting Minecraft 1.14.4-1.15.2 can be found [here](https://github.com/SmoochyPit/Warp-Pads/tree/legacy).

### Uninstalling

To uninstall, run `/function warppad:setup/uninstall`. Then disable or remove the data pack from the world.

## Credits

I used [TheDestruc7ion's advancements generator](https://advancements.thedestruc7i0n.ca/) for creating the advancements, which would have been tedious otherwise.

The rest is made with love by @SmoochyPit