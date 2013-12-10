sandbox = {}

function sandbox.load()
	loadgame()

	sa = _navi:new("|cFB7422FFSANDBOX MODE", {box=false, wait=1000000, msg_spd=5, alxb='m', skip=false, alx='m'})

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
		table.insert(t, Particle:new(love.mouse.getX(), love.mouse.getY(), deathtime))
		spawnagain = 3
	end
end

function sandbox.draw()
	love.graphics.draw(bgpic)
	for i, part in pairs(t) do
		part:draw()
	end
	sa:play(400,0)
end

function sandbox.mousepressed()
	mousedown = true
end

function sandbox.mousereleased()
	mousedown = false
end