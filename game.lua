game = {}

Particle = require "particle"

t = {}
spawnagain = 0
pitch = 440
start = 0

auS = love.audio.newSource("tone.ogg","static")
bgm = love.audio.newSource("bgm.ogg","stream")
rainbow = love.graphics.newImage("rainbow.png")
partimage = love.graphics.newImage("catpix.png")
partgrid = anim8.newGrid(7,7,partimage:getWidth(),partimage:getHeight())

m1 = _navi:new("I had a dream once.", {box=false, wait=3, msg_spd=6, alxb='m', skip=false, alx='m'})

function game.draw()
	for i, part in pairs(t) do
		part:draw()
	end
	love.graphics.setBlendMode("multiplicative")
	love.graphics.draw(rainbow)
	love.graphics.setBlendMode("alpha")
	m1:play(400,0)
	love.graphics.print(love.timer.getFPS(), 0, 0)
end

function game.update(dt)
	for i, part in pairs(t) do
		part:update(dt)
		if part.death <= 0 or part.x < 0 or part.x > 800 or part.y < 0 or part.y > 600 then part = nil table.remove(t, i) end
	end
	spawnagain = spawnagain - 30*dt
	if (mousedown or love.keyboard.isDown(" ")) and spawnagain <= 0 then
		table.insert(t, Particle:new(love.mouse.getX(), love.mouse.getY(), 5000))
		spawnagain = 3
	end
	if start == 0 then
		love.audio.play(bgm)
		bgm:setLooping(false)
		start = 1
	--elseif bgm:isStopped() == true then love.event.push('quit') end
	end  --remove if removing comment above
end

function game.mousepressed()
	mousedown = true
end

function game.mousereleased()
	mousedown = false
end
