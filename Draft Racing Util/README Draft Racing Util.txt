This is a Utility Script for use in Draft Racing. 
It's built to allow using multiple Lua Scripts at once by making them more 
modular and having one central script that calls the others.

You can select in the config.txt which Scripts to enable or disable by adding or removing a "--" at the start of the names

Credit to Dondon151 for the original Version of the RNG Randomizer Script
I (Geene) Added the Ranked Utilities and adapted the structure.

Default Hotkeys:

	RngScrambler:
	'R' - Display RNs on the Right Side
	
	Instructions:
	'T' - Print EXP Breakdown per unit in the Lua Console
	'U' - Increase Treasure Counter
	'I' - Decrease Treasure Counter




Hotkey change Instructions (universal):

Open the script in the "Utils" folder in a text editor of your choice.

Example: Instead of 'U' -> 'L'
CTRL + F - Search for "heldDown" (without the quotation marks)
Replace 
	['U'] = false
With
	['L'] = false
	


CTRL + F - Search for "function inputCheck"
Replace 
	if userInput.U and heldDown['U'] == false then
With
	if userInput.L and heldDown['L'] == false then


That's it!

Updates:
30 May 2022:
Update READMEs, some Comments, if printing all characters, don't double count if all isn't the first line.

? June 2021:
Modularize Script structure to enable usage of multiple utilities

5 June 2021:
Added support for FE6 & FE7
Added support to add "all" as the first line in the the picks file to calcualte the exp of all characters 