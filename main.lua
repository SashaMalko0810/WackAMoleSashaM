--Title: WhackAMole
--Name: Sasha Malko
--Course: ICS2O/3C
--This program places a duck on the screen. If the user clicks on it in time,
--the score increases by 1.
-----------------------------------------------------------------------------

--declare local variables
local points = 0
local pointsObject

--sound
local whack = audio.loadSound("Sounds/whack.mp3")
local whackChannel
local straight = audio.loadSound("Sounds/straight.mp3")
local straightChannel

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

--Creating duck
local duck = display.newImage("Images/duck.png", 0, 0)

--Setting position
duck.x = display.contentCenterX
duck.y = display.contentCenterY

--make the duck smaller
duck:scale(0.2,0.2)

--make the duck invisible
duck.alpha = 1

--display the points
pointsObject = display.newText("", 110, 50, Arial, 50)
pointsObject:setTextColor(0,0,1)
pointsObject.text = "Points" .. " = " .. points

--play the background music
straightChannel = audio.play(straight)

---------------------------------------------------------------------------------
--FUNCTIONS
---------------------------------------------------------------------------------

--This function makes the duck appear in a random (x,y) position on the screen 
--before calling the Hide function
function PopUp()

	--Choosing Random Position on the screen between 0 and the size of the screen
	duck.x = math.random(0, display.contentWidth)
	duck.y = math.random(0, display.contentHeight)
	duck.isVisible = true
	timer.performWithDelay(600, Hide)

end

--This fucntion calls the PopUp fuction after 3 seconds
function PopUpDelay()
	timer.performWithDelay(3000, PopUp)
end

--This function makes the duck invisible and then calls the PopUpDelay function
function Hide()

	--Changing visibilty
	duck.isVisible = false
	PopUpDelay()
end

--This function starts the game
function GameStart()
	PopUpDelay()
end

--This function increments the score only if the duck is clicked. It then displays 
--the new score.
function Whacked(event)

	--If touch phase just started 
	if (event.phase == "began") then
		points = points + 1
		pointsObject.text = "Points" .. "=" .. points
		whackChannel = audio.play(whack)
	end
end
------------------------------------------------------------------------------------
--EVENT LISTENERS
------------------------------------------------------------------------------------

--I added the event listener to the duck so that if the duck us touched, the Whacked 
--function is called
duck:addEventListener("touch", Whacked)

-------------------------------Start the Game---------------------------------------
GameStart()