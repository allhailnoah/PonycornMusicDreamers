game = {}

t = {}  --x, y, time to stay alive
pts = love.graphics.newImage("catpix.png")    --a particle
spawnagain = 0

function game.draw()
	for i, foo in pairs(t) do
		love.graphics.draw(pts, t[i][1]-(pts:getWidth()/2), t[i][2]-(pts:getHeight()/2))
	end
end

function game.update(dt)
	for i, foo in pairs(t) do
		t[i][3] = t[i][3] - 1
		if t[i][3] == 0 then table.remove(t, i) end
	end
	spawnagain = spawnagain - 30*dt
	if love.keyboard.isDown(" ") and spawnagain <= 0 then
		table.insert(t, {love.mouse.getX(), love.mouse.getY(), 2000})
		spawnagain = 3
	end
end