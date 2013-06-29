t = {{4,1,1000},{50,39,1700},{540,13,432},{12,13,1600}}  --x, y, time to stay alive
debounce = true   --for detecting "q"

function love.load()
	pts = love.graphics.newImage("catpix.png")    --a particle
end

function love.draw()
	for i=1,1000,1 do
		if t[i] ~= nil then
			love.graphics.draw(pts, t[i][1], t[i][2])
			t[i][3] = t[i][3] - 1
			if t[i][3] == 0 then t[i] = nil end
		end
	end
end

function love.update()
	for i=1,1000,1 do
		if t[i] == nil then
			maxT = i
			break
		end
	end
	if love.keyboard.isDown("q") and debounce == true then
		t[maxT] = {love.mouse.getX(), love.mouse.getY(), 1000}
		debounce = false
	else debounce = true end
end
