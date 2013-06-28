menu = {}

menustring = "Press enter."
state = 1

function menu.update(dt)
end

function menu.keypressed(key)
	if key == "return" then gamestate = game
	elseif state == 1 and key == "up" then state = state + 1
	elseif state == 2 and key == "up" then state = state + 1
	elseif state == 3 and key == "down" then state = state + 1
	elseif state == 4 and key == "down" then state = state + 1
	elseif state == 5 and key == "left" then state = state + 1
	elseif state == 6 and key == "right" then state = state + 1
	elseif state == 7 and key == "left" then state = state + 1
	elseif state == 8 and key == "right" then state = state + 1
	elseif state == 9 and key == "b" then state = state + 1
	elseif state == 10 and key == "a" then menustring = "KONAMI MODE ACTIVATED."
	else state = 1 end
end

function menu.draw()
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(menustring, 0, 0)
end