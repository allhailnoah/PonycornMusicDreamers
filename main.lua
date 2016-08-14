require "requirer"
require "game"
require "ending"
require "menu"
require "splash"
require "sandbox"

function love.load()
	change(splash)
	paused = false
	pausedopac = 0
	maxframe = 0.2
end

function love.update(dt)
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
	if paused then
		f:set(50)
		love.graphics.printf("Game paused", 50, 285, 700, "center")
	else f:set(15)
	end
	arc.clear_key()
end

function change(state)
	love.audio.stop()
	gamestate = state
	state.load()
end

function love.mousepressed(x, y, button)
  if button == 1 then button = "l"
  elseif button == 2 then button = "r"
  elseif button == 3 then button = "m" end
	if button == "m" then
		love.graphics.setCanvas(love.graphics.newCanvas())
		love.draw()
		love.graphics.getCanvas():getImageData():encode("screenshot"..os.time()..".png")
		love.graphics.setCanvas()
	end
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

function love.focus(foc)
	if gamestate~=splash then
		if not foc then
			pausedopac = 170
			love.audio.pause()
			paused = true
		else
			pausedopac = 0
			love.audio.resume()
			paused = false
	  	end
	end
end

function sign(x)
	return x < 0 and -1 or (x > 0 and 1 or 0)
end
