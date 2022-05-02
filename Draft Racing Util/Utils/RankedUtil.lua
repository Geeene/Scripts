shouldPrint = false
treasureCounter = 0

characterOffsetMapFE6 = {
	['Roy'] = 0x017,
	['Clarine'] = 0x027,
	['Fae'] = 0x037,
	['Shin'] = 0x047,
	['Sue'] = 0x057,
	['Dayan'] = 0x067,
	['Barthe'] = 0x087,
	['Bors'] = 0x097,
	['Gwendolyn'] = 0x0A7,
	['Douglas'] = 0x0B7,
	['Wolt'] = 0x0D7,
	['Dorothy'] = 0x0E7,
	['Klein'] = 0x0F7,
	['Saul'] = 0x107,
	['Elen'] = 0x117,
	['Yoder'] = 0x127,
	['Chad'] = 0x147,
	['Karel'] = 0x157,
	['Fir'] = 0x167,
	['Rutger'] = 0x177,
	['Dieck'] = 0x187,
	['Ogier'] = 0x197,
	['Garret'] = 0x1A7,
	['Alen'] = 0x1B7,
	['Lance'] = 0x1C7,
	['Perceval'] = 0x1D7,
	['Igrene'] = 0x1E7,
	['Marcus'] = 0x1F7,
	['Astolfo'] = 0x207,
	['Wade'] = 0x217,
	['Lot'] = 0x227,
	['Bartre'] = 0x237,
	['Lugh'] = 0x257,
	['Lilina'] = 0x267,
	['Hugh'] = 0x277,
	['Niime'] = 0x287,
	['Raigh'] = 0x2A7,
	['Larum'] = 0x2B7,
	['Juno'] = 0x2C7,
	['Thea'] = 0x2E7,
	['Shanna'] = 0x317,
	['Zeiss'] = 0x327,
	['Elffin'] = 0x347,
	['Cath'] = 0x357,
	['Sophia'] = 0x367,
	['Melady'] = 0x377,
	['Gonzales'] = 0x387,
	['Noah'] = 0x3A7,
	['Treck'] = 0x3B7,
	['Zelot'] = 0x3C7,
	['Echidna'] = 0x3D7,
	['Cecilia'] = 0x3F7,
	['Geese'] = 0x407,
	['Merlinus'] = 0x427
}

characterOffsetMapFE7 = {
	['Eliwood'] = 0x019,
	['Hector'] = 0x029,
	['Raven'] = 0x049,
	['Geitz'] = 0x059,
	['Guy'] = 0x069,
	['Karel'] = 0x079,
	['Dorcas'] = 0x089,
	['Bartre'] = 0x099,
	['Oswin'] = 0x0B9,
	['Rebecca'] = 0x0E9,
	['Louise'] = 0x0F9,
	['Lucius'] = 0x109,
	['Serra'] = 0x119,
	['Renault'] = 0x129,
	['Erk'] = 0x139,
	['Nino'] = 0x149,
	['Pent'] = 0x159,
	['Canas'] = 0x169,
	['Lowen'] = 0x199,
	['Marcus'] = 0x1A9,
	['Priscilla'] = 0x1B9,
	['Fiora'] = 0x1E9,
	['Farina'] = 0x1F9,
	['Heath'] = 0x109,
	['Vaida'] = 0x219,
	['Hawkeye'] = 0x229,
	['Matthew'] = 0x239,
	['Jaffar'] = 0x249,
	['Ninian'] = 0x259,
	['Lyn'] = 0x2D9,
	['Wil'] = 0x2E9,
	['Kent'] = 0x2F9,
	['Sain'] = 0x309,
	['Florina'] = 0x319,
	['Rath'] = 0x329,
	['Dart'] = 0x339,
	['Isadora'] = 0x349,
	['Legault'] = 0x369,
	['Karla'] = 0x379,
	['Harken'] = 0x389,
	['Rath'] = 0x329,
}

characterOffsetMapFE8 = {
	['Eirika'] = 0x019,
	['Seth'] = 0x029,
	['Gilliam'] = 0x039,
	['Franz'] = 0x049,
	['Moulder'] = 0x059,
	['Vanessa'] = 0x069,
	['Ross'] = 0x079,
	['Neimi'] = 0x089,
	['Colm'] = 0x099,
	['Garcia'] = 0x0A9,
	['Innes'] = 0x0B9,
	['Lute'] = 0x0C9,
	['Natasha'] = 0x0D9,
	['Cormag'] = 0x0E9,
	['Ephraim'] = 0x0F9,
	['Forde'] = 0x109,
	['Kyle'] = 0x119,
	['Amelia'] = 0x129,
	['Artur'] = 0x139,
	['Gerik'] = 0x149,
	['Tethys'] = 0x159,
	['Marisa'] = 0x169,
	['Saleh'] = 0x179,
	['Ewan'] = 0x189,
	["L'Arachel"] = 0x199,
	['Dozla'] = 0x1A9,
	['Rennac'] = 0x1C9,
	['Duessel'] = 0x1D9,
	['Myrrh'] = 0x1E9,
	['Knoll'] = 0x1F9,
	['Joshua'] = 0x209,
	['Syrene'] = 0x219,
	['Tana'] = 0x229,
	['Lyon'] = 0x239,
	['Orson'] = 0x249,
	['Glen'] = 0x259,
	['Selena'] = 0x269,
	['Valter'] = 0x279,
	['Riev'] = 0x289,
	['Caellach'] = 0x299,
	['Fado'] = 0x2A9,
	['Ismaire'] = 0x2B9,
	['Hayden'] = 0x2C9,
}

bwlOffsetMap = {
	['Sealed Sword J'] = 0x203D524,
	['Blazing Sword U'] = 0x203E790,
	['Blazing Sword J'] = 0x203E790,
	['Sacred Stones U'] = 0x203E884,
	['Sacred Stones J'] = 0x203E884
}

characterOffsetMapsByGameId = {
	['Sealed Sword J'] = characterOffsetMapFE6,
	['Blazing Sword U'] = characterOffsetMapFE7,
	['Blazing Sword J'] = characterOffsetMapFE7,
	['Sacred Stones U'] = characterOffsetMapFE8,
	['Sacred Stones J'] = characterOffsetMapFE8
}

function calculateTotalExp()
	local totalexp = 0
	
	fileIterator = io.lines("picks.txt")
	if fileIterator == nil then
		return ""
	end
	
	characterOffsetMap = characterOffsetMapsByGameId[currentGame]
	if shouldPrint == true then
		print("----------------")
		print("EXP per Unit:")
		print("----------------")
	end
	
	-- Get the EXP for each character in the file, or for all characters if the file contains "all"
	for line in fileIterator do
		-- skip lines starting with --
		if string.sub(line, 1,string.len(line)) ~= "--" then
			if line == "all" then
				-- Reset incase all wasn't line 1
				totalexp = 0
				for character, offset in pairs(characterOffsetMap) do
					totalexp = totalexp + getExpForCharacter(character, offset)
				end
				break
			end
				
			
			characterOffset = characterOffsetMap[line]
			totalexp = totalexp + getExpForCharacter(line, characterOffset)
			if eof then
				break
			end
		end
	end
	shouldPrint = false
	return totalexp
end

function getExpForCharacter(character, offset)
	characterBwlOffset = BWLBASE+offset
	characterExp = getExpFromBWLTable(characterBwlOffset)
	if shouldPrint == true then
		print(character..": "..characterExp)
	end
	return characterExp
end

function getExpFromBWLTable(offset)
	-- The EXP in the BWL Table is stored as 12 Bits.
	-- The 12 Bits are part of 2 Bytes, the byte only the last 4 bits are part of the EXP
	-- The Second Byte is completely for EXP.
	-- The 12 Bits then need to be put together with the value from 
	-- the first byte being AFTER the bits from the second byte.
	-- eg: 0C54 -> 54C -> 1356 EXP.
	
	-- Read the info from the first byte and remove the first 4 bits. Not Relevant for EXP
	local expbyte1 = string.sub(bit.tohex(memory.readbyte(offset),2),0,1) --"C"
	-- Read the Second Byte
	local expbyte2 = bit.tohex(memory.readbyte(offset+0x1),2) --"54"
	-- Put them together reversed
	local expHexValue = expbyte2..expbyte1 --"54C"
	-- conver to decimal
	local expNumber = tonumber(expHexValue,16)
	return expNumber
end
BWLBASE = bwlOffsetMap[currentGame]

heldDownRankedUtil = { 
	['T'] = false, 
	['U'] = false, 
	['I'] = false
}

function inputCheckRankedUtil()
	local heldDown = heldDownRankedUtil
	if userInput.T and heldDown['T'] == false then
		shouldPrint = true
	end	
	if userInput.U and heldDown['U'] == false then
		treasureCounter = treasureCounter +1
	end
	if userInput.I and heldDown['I'] == false then
		treasureCounter = treasureCounter -1
	end
	for key, value in pairs(heldDown) do
		heldDown[key] = true
		if userInput[key] == nil then
			heldDown[key] = false
		end
	end
end

function rankedUtilRoutine()
	userInput = input.get()
	inputCheckRankedUtil()
	gui.text(2, 10, calculateTotalExp(false),"white")
	gui.text(2, 18, treasureCounter,"white")
end