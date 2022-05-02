gameID = ""
-- Read consecutive values from the ROM to find a special string (ex/ FIREEMBLEM6.AFEJ01) used to distinguish between games
for i = 0, 18, 1 do
	gameID = gameID..memory.readbyte(0x080000A0 + i)
end

gameIDMap = {
	['70738269697766766977540657069744849150'] = "Sealed Sword J",
	['70738269697766766977690656955694849150'] = "Blazing Sword U",
	['70738269697766766977550656955744849150'] = "Blazing Sword J",
	['707382696977667669775069666956694849150'] = "Sacred Stones U",
	['70738269697766766977560666956744849150'] = "Sacred Stones J"
}

phaseMap = {
	['Sealed Sword J'] = 0x0202AA57,
	['Blazing Sword U'] = 0x0202BC07,
	['Blazing Sword J'] = 0x0202BC03,
	['Sacred Stones U'] = 0x0202BCFF,
	['Sacred Stones J'] = 0x0202BCFB
}


currentGame = gameIDMap[gameID]
print("Current game: "..currentGame)

fileIterator = io.lines("config.txt")
rngScramblerActive = false
rankedUtilActive = false
for line in fileIterator do
	if line == "RngScrambler" then rngScramblerActive = true require "utils/RngScrambler"
	elseif line == "RankedUtil" then rankedUtilActive = true require "utils/RankedUtil"
	elseif eof then break
	end
end

while true do
	if rankedUtilActive then 
		rankedUtilRoutine()
	end
	if rngScramblerActive then
		rngScramblerRoutine()
	end
	emu.frameadvance()
end
