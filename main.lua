--Title: WhackAMole
--Name: Sasha Malko
--Course: ICS2O/3C
--This program places a mole on the screen. If the user clicks on it in time,
--the score increases by 1.
-----------------------------------------------------------------------------
--create local variables
local points = 0
local pointsObject

--Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--Creating background
local bkg = display.newRect(0, 0, display.contentWidth, display.contentHeight)

--set the background colour
bkg:setFillColor(0,75,10)

--Setting position
bkg.anchorX = 0
bkg.anchorY = 0
bkg.x = 0
bkg.y = 0

--Creating mole
local mole = display.newImage("Images/mole.png", 0, 0)

--Setting position
mole.x = display.contentCenterX
mole.y = display.contentCenterY

--make the mole smaller
mole:scale(0.3,0.3)

--make the mole invisible
mole.alpha = 0

--display the points on the screen
pointsObject.text = "Points" .. "=" .. points
pointsObject = display.newText("", 30, 30, Arial, 20)
pointsObject:setTextColor(1,0,0)

---------------------------------------------------------------------------------
--FUNCTIONS
---------------------------------------------------------------------------------

--This function makes the mole appear in a random (x,y) position on the screen 
--before calling the Hide function
function PopUp()

	--Choosing Random Position on the screen between 0 and the size of the screen
	mole.x = math.random(0, display.contentWidth)
	mole.y = math.random(0, display.contentHeight)

end

--This fucntion calls the PopUp fuction after 3 seconds
function PopUpDelay()
	timer.performWithDelay(3000, PopUp)
end

--This function makes the mole invisible and then calls the PopUpDelay function
function Hide()

	--Changing visibilty
	mole.isVisible = false
	PopUpDelay()
end

--This function starts the game
function GameStart()
	PopUpDelay()
end

--This function increments the score only if the mole is clicked. It then displays the
--new score.
function Whacked(event)

	--If touch phase just started 
	if (event.phase == "began") then
		points = points + 1
		pointsObject.text = "Points" .. "=" .. points
	end
end

------------------------------------------------------------------------------------
--EVENT LISTENERS
------------------------------------------------------------------------------------

--I added the event listener to the mole so that if the mole us touched, the Whacked function
--is called
mole:addEventListener("touch", Whacked)

---------------------------Start the game------------------------------------------