menu = {}

require("splash")

bkg = love.graphics.newImage("backpic.png")

ready = true
drawSplash = true
start = false

function menu.update(dt)
	if ready then
		loadSplash()
		ready=false
	else
		if drawSplash then
			updateSplash(dt)
		end
	end
end

function menu.draw()
	if drawSplash then
		if playSplash() then
			drawSplash = false
			endSplash()
		end
	else
		love.graphics.draw(bkg)
		love.graphics.setColor(255,255,255,255)
		f:set(40)
		love.graphics.print("SONG OF SPARKS",50,100)
		f:set(30)
		love.graphics.print("a musical toy",50,200)
		love.graphics.print("for you to enjoy",50,240)
		love.graphics.print("just click to make notes",50,280)
		love.graphics.print("and hear the sound as it floats",50,320)
		f:set(32)
		love.graphics.print("click down here to begin",50,400)
		love.graphics.print("this game by tim, michi and finn!",50,440)
		f:set(30)
		love.graphics.rectangle("line", 50, 480, 300, 100)
		love.graphics.rectangle("line", 450, 480, 300, 100)
		love.graphics.printf("Story Mode", 50, 510, 300, "center")
		love.graphics.printf("Sandbox Mode", 450, 510, 300, "center")
	end
end

function menu.keypressed(key)
	if drawSplash then
		drawSplash = false
		endSplash()
	end
end

function menu.mousepressed(x,y,b)
	if drawSplash then
		drawSplash = false
		endSplash()
	end
	if b == "m" then print(x.." "..y) end
	if b == "l" then
		if y <= 580 and y >=480 then
			if x <= 350 and x >= 50 then
				sandbox = false
				start = true
			end
			if x <= 750 and x >= 450 then
				sandbox = true
				start = true
			end
		end
	end
end