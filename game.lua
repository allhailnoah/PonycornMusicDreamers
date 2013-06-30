game = {}

t = {}
spawnagain = 0
pitch = 440
start = 0

auS = love.audio.newSource("tone.ogg","static")
bgm = love.audio.newSource("bgm.ogg","stream")
rainbow = love.graphics.newImage("rainbow.png")
partimage = love.graphics.newImage("catpix.png")
partgrid = anim8.newGrid(7,7,partimage:getWidth(),partimage:getHeight())

ma = {}
ma[1] = _navi:new("I had a dream once.", {box=false, wait=1, msg_spd=7, alxb='m', skip=false, alx='m'})
ma[2] = _navi:new("Throughout, I saw many, many things.", {box=false, msg_spd=17, wait=1, alxb='m', alx='m', skip=false})
ma[3] = _navi:new("But first, it was a void.", {box=false, wait=7, msg_spd=7, alxb='m', skip=false, alx='m'})
ma[4] = _navi:new("A dark, dark void.", {box=false, wait=24, msg_spd=7, alxb='m', skip=false, alx='m'})
ma[5] = _navi:new("It was silent, except for a single underlying pattern.", {box=false, wait=3, msg_spd=7, alxb='m', skip=false, alx='m'})
ma[6] = _navi:new("Getting prettier", {box=false, wait=0, msg_spd=3, alxb='m', skip=false, alx='m'})
ma[7] = _navi:new("With every spark.", {box=false, wait=0, msg_spd=2, alxb='m', skip=false, alx='m'})
ma[8] = _navi:new("Poetry created by this song", {box=false, wait=1, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[9] = _navi:new("Conducted by you in a wonderful way", {box=false, wait=2, msg_spd=5, alxb='m', skip=false, alx='m'})

function game.draw()
	for i, part in pairs(t) do
		part:draw()
	end
	love.graphics.setBlendMode("multiplicative")
	love.graphics.draw(rainbow)
	love.graphics.setBlendMode("alpha")
	_navi.play_list(ma, 400, 0)
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
