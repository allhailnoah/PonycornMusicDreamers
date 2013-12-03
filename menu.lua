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
		f:set(40)
		love.graphics.print("SONG OF SPARKS",50,100)
		love.graphics.print("a musical toy",50,200)
		love.graphics.print("for you to enjoy",50,250)
		love.graphics.print("just click to make notes",50,300)
		love.graphics.print("and hear the sound as it floats",50,350)
		love.graphics.print("press space to begin",50,400)
		love.graphics.print("this game by tim, michi and finn!",50,450)
	end
end

function menu.keypressed(key)
	if not drawSplash then
		if key==" " then
			start = true
		end
	else
		if key==" " then
			drawSplash = false
			endSplash()
		end
	end
end