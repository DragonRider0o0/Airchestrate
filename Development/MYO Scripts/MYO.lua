scriptId = 'com.thalmic.examples.outputeverything'
sensedYaw = 0
sensedPitch = 0
sensedRoll = 0
currentYaw = 0
currentPitch = 0
currentRoll = 0
sensitivity = 0.1
enabled = true
beginTime = myo.getTimeMilliseconds()
currentTime = (myo.getTimeMilliseconds() - beginTime) / 1000
expectedTime = 0;
startBeat = 4
currentBeat = 4
beatCount = 1
secondsPerBeat = 0.714

currentApp = ""



tempo = 84

-- myo.controlMouse(enabled)

function onPoseEdge(pose, edge)
	if currentApp == "AIRCHESTRATE" then
		myo.debug("Time: " .. currentTime)
		if pose == "fist" and edge == "on" then
			-- myo.mouse("left", "down")
			myo.debug("Fist")
		end
		if pose == "fist" and edge == "off"  then
			-- myo.mouse("left", "up")
			myo.debug("Unfist")
		end

		if pose == "thumbToPinky" then
			-- myo.centerMousePosition()
		end
	end
end

function onPeriodic()
	currentTime = (myo.getTimeMilliseconds() - beginTime) / 1000
	
	if expectedTime < currentTime then
		beatCount = beatCount + 1;
		currentBeat = (beatCount % 4) + 1
		
		myo.debug("Beat: " .. currentBeat)
		expectedTime = beatCount * secondsPerBeat;
		if currentBeat == 1 then
			myo.vibrate("medium")
		else
			myo.vibrate("short")
		end
	end
		
	sensedYaw = myo.getYaw()
	sensedPitch = myo.getPitch()
	sensedRoll = myo.getRoll()
	if currentYaw <= (sensedYaw - sensitivity) then
		currentYaw = sensedYaw
		-- myo.debug("Yaw: " .. currentYaw)
	end
	if currentYaw >= (sensedYaw + sensitivity) then
		currentYaw = sensedYaw
		-- myo.debug("Yaw: " .. currentYaw)
	end
	if currentPitch <= (sensedPitch - sensitivity) then
		currentPitch = sensedPitch
		-- myo.debug("Pitch: " .. currentPitch)
	end
	if currentPitch >= (sensedPitch + sensitivity) then
		currentPitch = sensedPitch
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
    myo.debug("onActiveChange")
end