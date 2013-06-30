game = {}

Particle = require "particle"

t = {}
spawnagain = 0
pitch = 440
auS = love.audio.newSource("tone.ogg","static")
rainbow = love.graphics.newImage("rainbow.png")

function game.draw()
	for i, part in pairs(t) do
		part:draw()
	end
	love.graphics.setBlendMode("multiplicative")
	love.graphics.draw(rainbow)
	love.graphics.setBlendMode("alpha")
end

function game.update(dt)
	for i, part in pairs(t) do
		part:update(dt)
		if part.death <= 0 or part.x < 0 or part.x > 800 or part.y < 0 or part.y > 600 then table.remove(t, i) end
	end
	spawnagain = spawnagain - 30*dt
	if (mousedown or love.keyboard.isDown(" ")) and spawnagain <= 0 then
		table.insert(t, Particle:new(love.mouse.getX(), love.mouse.getY(), 7500))
		spawnagain = 3
	end
end

function game.mousepressed()
	mousedown = true
end

function game.mousereleased()
	mousedown = false
end