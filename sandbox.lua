sandbox = {}

function sandbox.load()
	loadgame()

	sa = _navi:new("|cFB7422FFPress G to activate ghostly mode", {box=false, wait=1000000, msg_spd=5, alxb='m', skip=false, alx='m'})

	pretty = true
	conduct = true
	deathtime = 10
	spawnnow = true
end

function sandbox.update(dt)
	spawnagain = spawnagain - 30*dt

	local go = true
	for i, part in pairs(t) do
		part:update(dt)
		if part.x == love.mouse.getX() and part.y == love.mouse.getY() then
			go = false
			print("Hmm?")
		end
		if part.death < 0 or love.keyboard.isDown("d") then
			part = nil
			table.remove(t, i)
		end
	end

	if (mousedown or love.keyboard.isDown(" ")) and spawnnow and spawnagain <= 0 and go then
		if ghosty then
			table.insert(t, Ghosticle:new(love.mouse.getX(), love.mouse.getY(), deathtime, math.random(1,7)))
		else
			table.insert(t, Particle:new(love.mouse.getX(), love.mouse.getY(), deathtime))
		end
		spawnagain = 3
	end
	if ghosty and math.random(1,42) == 42 then
		table.insert(t, Ghosticle:new(math.random(0,800),math.random(0,600), deathtime / 16, 8))
	end
end

function sandbox.draw()
	love.graphics.draw(bgpic)
	for i, part in pairs(t) do
		part:draw()
	end
	sa:play(400,0)
end

function sandbox.keypressed(key)
	if key == "g" then ghosty = not ghosty end
end

function sandbox.mousepressed()
	mousedown = true
end

function sandbox.mousereleased()
	mousedown = false
end
