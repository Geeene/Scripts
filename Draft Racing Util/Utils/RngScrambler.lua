math.randomseed(os.time())
RNGBase = 0x03000000
lastSeenRNG = {memory.readword(RNGBase+4), memory.readword(RNGBase+2), memory.readword(RNGBase)}
numDisplayedRNs = 20
superRNToRNConversionDivisor = 655.36
RNGPosition = 0
lastRNGPosition = 0
displayRNG = false

function superRNToRN(srn)
	return math.floor(srn/superRNToRNConversionDivisor)
end

function nextSuperRN(r1, r2, r3)
	-- Given three sequential RNG values, generate a fourth
	return bit.band(bit.bxor(bit.bxor(bit.bxor(bit.rshift(r3, 5), bit.lshift(r2, 11)), bit.lshift(r1, 1)), bit.rshift(r2, 15)),0xFFFF)
end

function printRNG(n)
	-- Print n entries of the RNG table
	RNGTable = RNGSimulate(n)
	-- Print each RNG value
	for i=1,n do
		gui.text(228, 8*(i-1) + 2, string.format("%3d", superRNToRN(RNGTable[i])))
	end
end

function RNGSimulate(n)
	-- Generate n entries of the RNG table (including the 3 RNs used for the RNG seed)
	local result = { memory.readword(RNGBase+4), memory.readword(RNGBase+2), memory.readword(RNGBase) }
	advanceRNGTable(result,3)
	for i = 4, n do
		result[i] = nextSuperRN(result[i-3],result[i-2],result[i-1])
	end
	return result
end

function advanceRNGTable(RNGTable,n)
	if n == 0 then
		return RNGTable
	end
	for i = 1, math.abs(n), 1 do
		local nextRN
		if n > 0 then
			nextRN = nextSuperRN(RNGTable[#RNGTable-2], RNGTable[#RNGTable-1], RNGTable[#RNGTable])
			for j = 1, #RNGTable - 1, 1 do
				RNGTable[j] = RNGTable[j+1]
			end
			RNGTable[#RNGTable] = nextRN
		else
			nextRN = previousSuperRN(RNGTable[1], RNGTable[2], RNGTable[3])
			for j = #RNGTable, 2, -1 do
				RNGTable[j] = RNGTable[j-1]
			end
			RNGTable[1] = nextRN
		end
	end
	return RNGTable
end

function advanceRNG()
	-- Identify the memory addresses of the first 4 RNG values
	local RNG1 =  memory.readword(RNGBase+4)
	local RNG2 =  memory.readword(RNGBase+2)
	local RNG3 = memory.readword(RNGBase)
	local RNG4 = nextSuperRN(RNG1, RNG2, RNG3)
	-- Swap the values in RNG Seed 1,2,3 by the RNG values 2,3,4
	memory.writeword(RNGBase + 4, RNG2)
	memory.writeword(RNGBase + 2, RNG3)
	memory.writeword(RNGBase + 0, RNG4)
end

heldDownRngScrambler = {
	['R'] = false
}

function inputCheckRngScrambler()
	local heldDown = heldDownRngScrambler
	if userInput.R and heldDown['R'] == false then
		-- help display on/off
		displayRNG = not displayRNG
	end
	for key, value in pairs(heldDown) do
		heldDown[key] = true
		if userInput[key] == nil then
			heldDown[key] = false
		end
	end
end

function rngScramblerRoutine()
	userInput = input.get()
	inputCheckRngScrambler()
	if memory.readbyte(phaseMap[currentGame]) == 0 then
		advanceRNG()
		gui.text(2, 2, "ACTIVE", "green")
	else gui.text(2, 2, "PAUSED", "red")		
	end
	if displayRNG then
		printRNG(numDisplayedRNs)
	end
end