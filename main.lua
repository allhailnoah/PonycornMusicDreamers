require "requirer"
require "game"
require "ending"
require "menu"

function love.load()
	gamestate = menu
	paused = false
	pausedopac = 0
	maxframe = 0.2
end

function love.update(dt)
	if start then
		gamestate = game
	end
	if not paused then
		gamestate.update(dt)
		arc.check_keys(dt)
		tween.update(dt)
	end
end

function love.draw()
	gamestate.draw()
	love.graphics.setColor(0,0,0,pausedopac)
	love.graphics.rectangle("fill", 0, 0, love.graphics:getWidth(), love.graphics:getHeight())
	love.graphics.setColor(255,255,255,255)
	arc.clear_key()
end

function love.mousepressed(x, y, button)
	if gamestate.mousepressed then
		gamestate.mousepressed(x, y, button)
	end
end

function love.mousereleased(x, y, button)
	if gamestate.mousereleased then
		gamestate.mousereleased(x, y, button)
	end
end

function love.keypressed(key, unicode)
	if key == "escape" then
		love.event.quit()
	end
	if gamestate.keypressed then
		gamestate.keypressed(key)
	end
	arc.set_key(key)
end

function love.keyreleased(key)
	if gamestate.keyreleased then
		gamestate.keyreleased(key)
	end
end

function love.focus(f)
	if gamestate~=menu then
		if not f then
			pausedopac = 170
			bgm:pause()
			paused = true
		else
			pausedopac = 0
			bgm:resume()
			paused = false
	  	end
	end
end

function sign(x)
	return x < 0 and -1 or (x > 0 and 1 or 0)
end