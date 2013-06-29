game = {}

t = {{4,1,1000},{50,39,1700},{540,13,432},{12,13,1600}}  --x, y, time to stay alive
pts = love.graphics.newImage("catpix.png")    --a particle

function game.draw()
	for i, foo in pairs(t) do
		love.graphics.draw(pts, t[i][1], t[i][2])
	end
end

function game.keypressed(key)
	if key == " " then
		table.insert(t, {love.mouse.getX(), love.mouse.getY(), 1000})
	end
end

function game.update(dt)
	for i, foo in pairs(t) do
		t[i][3] = t[i][3] - 1
		if t[i][3] == 0 then table.remove(t, i) end
	end
end