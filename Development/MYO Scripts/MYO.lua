scriptId = 'com.thalmic.examples.outputeverything'
sensedYaw = 0
sensedPitch = 0
sensedRoll = 0
currentYaw = 0
currentPitch = 0
currentRoll = 0
sensitivity = 0.05
enabled = true
beginTime = myo.getTimeMilliseconds()
currentTime = (myo.getTimeMilliseconds() - beginTime) / 1000
expectedTime = 0;
startBeat = 1
currentBeat = startBeat
beatCount = 1
secondsPerBeat = 0.714

-- stopTime = 0

upCount = 0
downCount = 0
leftCount = 0
rightCount = 0

currentApp = ""

minVolume = 0.5
maxVolume = 1.0
currentVolume = 0.5
volumeIncrement = 0.1
downIncrement = - 0.1

notches = 0

counting = false

-- reset = true



tempo = 84

-- myo.controlMouse(enabled)

function onPoseEdge(pose, edge)
	if currentApp == "AIRCHESTRATE" or currentApp == "AIRCHESTRATE - Google Chrome" then
		-- myo.debug("Time: " .. currentTime)
		if pose == "fist" and edge == "on" then
			-- myo.mouse("left", "down")
			myo.keyboard("p", "press")
			myo.debug("Fist")
			counting = false
			-- reset = false
		end
		if pose == "fist" and edge == "off"  then
			-- myo.mouse("left", "up")
			myo.keyboard("space", "press")
			-- myo.debug("Unfist")
			counting = true
			beginTime = myo.getTimeMilliseconds() - (currentTime * 1000)
		end

		if pose == "thumbToPinky" then
			-- myo.centerMousePosition()
		end
	end
end

function onPeriodic()
	if counting == true then
		currentTime = (myo.getTimeMilliseconds() - beginTime) / 1000
	else
		-- stopTime = (myo.getTimeMilliseconds() - currentTime) / 1000
		-- if stopTime > 10 and reset == false then
			-- minVolume = 0.5
			-- maxVolume = 1.0
			-- currentVolume = 0.5
			-- volumeIncrement = 0.1
			-- downIncrement = - 0.1
			-- enabled = true
			-- beginTime = myo.getTimeMilliseconds()
			-- currentTime = (myo.getTimeMilliseconds() - beginTime) / 1000
			-- expectedTime = 0;
			-- startBeat = 1
			-- currentBeat = startBeat
			-- beatCount = 1
			-- secondsPerBeat = 0.714

			-- stopTime = 0

			-- notches = 0

			-- counting = false
			-- reset = true
			-- myo.keyboard("r", "press")
		-- end
		return;
	end
	
	if expectedTime < currentTime then

		myo.debug("\tUp: " .. upCount .. "\tDown: " .. downCount .. "\tLeft: " .. leftCount .. "\tRight: " .. rightCount )

		
		
		if currentBeat == 1 then
			myo.vibrate("medium")
			if downCount < 3 then 
				downCount = 3
			end
			if downCount > 13 then 
				downCount = 13
			end
			notches = math.floor((downCount - 3) / 2)
			
		end
		if currentBeat == 2 then
			myo.vibrate("short")
			notches = math.floor((leftCount - 3) / 2)
		end
		if currentBeat == 3 then
			myo.vibrate("short")
			if rightCount < 3 then 
				rightCount = 3
			end
			if rightCount > 13 then 
				rightCount = 13
			end
			notches = math.floor((rightCount - 3) / 2)
		end
		if currentBeat == 4 then
			myo.vibrate("short")
			if upCount < 3 then 
				upCount = 3
			end
			if upCount > 13 then 
				upCount = 13
			end
			notches = math.floor((upCount - 3) / 2)
		end
		
		beatCount = beatCount + 1;
		currentBeat = (beatCount % 4) + 1
		
		upCount = 0
		downCount = 0
		leftCount = 0
		rightCount = 0
		
		while currentVolume > minVolume do
			currentVolume = currentVolume - volumeIncrement
			myo.debug("Current Volume: " .. currentVolume)
			myo.keyboard("0", "press")
		end
		while currentVolume < (minVolume + (notches * volumeIncrement)) do
			myo.debug("Current Volume: " .. currentVolume)
			currentVolume = currentVolume + volumeIncrement
			myo.keyboard("1", "press")
		end
		
		-- myo.debug("\t" .. notches)
		
		myo.debug("Beat: " .. currentBeat)
		expectedTime = beatCount * secondsPerBeat;
	end
		
	sensedYaw = myo.getYaw()
	sensedPitch = myo.getPitch()
	sensedRoll = myo.getRoll()
	if currentYaw <= (sensedYaw - sensitivity) then
		currentYaw = sensedYaw
		
		leftCount = leftCount + 1
		-- myo.debug("Yaw: " .. currentYaw)
	end
	if currentYaw >= (sensedYaw + sensitivity) then
		currentYaw = sensedYaw
		rightCount = rightCount + 1
		-- myo.debug("Yaw: " .. currentYaw)
	end
	if currentPitch <= (sensedPitch - sensitivity) then
		currentPitch = sensedPitch
		downCount = downCount + 1
		-- myo.debug("Pitch: " .. currentPitch)
	end
	if currentPitch >= (sensedPitch + sensitivity) then
		currentPitch = sensedPitch
		upCount = upCount + 1
		-- myo.debug("Pitch: " .. currentPitch)
	end
	if currentRoll <= (sensedRoll - sensitivity) then
		currentRoll = sensedRoll
		-- myo.debug("Roll: " .. currentRoll)
	end
	if currentRoll >= (sensedRoll + sensitivity) then
		currentRoll = sensedRoll
		-- myo.debug("Roll: " .. currentRoll)
	end
	
end

function onForegroundWindowChange(app, title)
    myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
	currentApp = title
    return true
end

function activeAppName()
    return "Output Everything"
end

function onActiveChange(isActive)
    -- myo.debug("onActiveChange")
end