game = {}

t = {}
spawnagain = 0
pitch = 440
gameclock = 0
deathtime = 2000
bgalpha = 0

auS = love.audio.newSource("tone.ogg","static")
bgm = love.audio.newSource("bgm.ogg","stream")
bgm:setLooping(true)
music = love.audio.play(bgm)
rainbow = love.image.newImageData("rainbow.png")
bgpic = love.graphics.newImage("backpic.png")
partimage = love.graphics.newImage("catpix.png")
love.graphics.setBackgroundColor(235,235,235)
partgrid = anim8.newGrid(14,14,partimage:getWidth(),partimage:getHeight())

tweens={partvol=1,alpha=0,cloudx=0}

ma = {}
ma[1] = _navi:new("|c000000FFI had a dream once.", {box=false, wait=30, msg_spd=8, alxb='m', skip=false, alx='m', y=275})
ma[2] = _navi:new("|c000000FFThroughout, I saw many, many things.", {box=false, msg_spd=17, wait=30, alxb='m', alx='m', skip=false, y=275})
ma[3] = _navi:new("But first, it was a void.", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[4] = _navi:new("A dark, dark void.", {box=false, wait=30, msg_spd=2, alxb='m', skip=false, alx='m'})
ma[5] = _navi:new("It was silent, except for a single underlying pattern.", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[6] = _navi:new("|cFB7422FFGetting prettier", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[7] = _navi:new("|cFB7422FFWith every spark.", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[8] = _navi:new("|cFB7422FFPoetry created by this song", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[9] = _navi:new("|cFB7422FFConducted by you in a wonderful way", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[10] = _navi:new("|cFB7422FFLike a beautiful haiku", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[11] = _navi:new("|cFB7422FFAbout sakura blossom", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[12] = _navi:new("|cFB7422FFWhich fell at 5cm per second", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[13] = _navi:new("|cFB7422FFWithin this void", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[14] = _navi:new("|cFB7422FFMajesty was created", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[15] = _navi:new("|cFB7422FFLike the Disasterpeace track", {box=false, wait=30, msg_spd=12, alxb='m', skip=false, alx='m'})
ma[16] = _navi:new("|cFB7422FFin the key of A minor", {box=false, wait=30, msg_spd=8, alxb='m', skip=false, alx='m'})
ma[17] = _navi:new("|cFB7422FFthen major", {box=false, wait=30, msg_spd=8, alxb='m', skip=false, alx='m'})
ma[18] = _navi:new("|cFB7422FFthen every key", {box=false, wait=30, msg_spd=7, alxb='m', skip=false, alx='m'})
ma[19] = _navi:new("|cFB7422FFconducted with sparks", {box=false, wait=30, msg_spd=6, alxb='m', skip=false, alx='m'})
ma[20] = _navi:new("|cFB7422FFin a continuous pattern", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[21] = _navi:new("|cFB7422FFto make a pretty tune", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[22] = _navi:new("|cFB7422FFa song of sparks", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[23] = _navi:new("|cFB7422FFin your pretty void", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
ma[24] = _navi:new("|cFB7422FFinstruments are added", {box=false, wait=30, msg_spd=7, alxb='m', skip=false, alx='m'})
ma[25] = _navi:new("|cFB7422FFand as you go", {box=false, wait=30, msg_spd=18, alxb='m', skip=false, alx='m'})
ma[26] = _navi:new("|cFB7422FFthe void lights up", {box=false, wait=30, msg_spd=10, alxb='m', skip=false, alx='m'})
ma[27] = _navi:new("|cFB7422FFand you exit your pretty little void", {box=false, wait=30, msg_spd=7, alxb='m', skip=false, alx='m'})
ma[28] = _navi:new("into your pretty little world", {box=false, wait=30, msg_spd=5, alxb='m', skip=false, alx='m'})
sa = _navi:new("|cFB7422FFSANDBOX MODE", {box=false, wait=1000000, msg_spd=5, alxb='m', skip=false, alx='m'})
currentmsg = ma[1]

function game.draw()
	love.graphics.setColor(255,255,255,bgalpha)
	love.graphics.draw(bgpic)
	love.graphics.setColor(255,255,255)
	for i, part in pairs(t) do
		part:draw()
	end
	love.graphics.setColor(255,255,255)
	currentmsg:play(400,0)
	love.graphics.setColor(255,255,255,tweens.alpha)
	love.graphics.rectangle("fill",0,0,800,600)
end

function game.update(dt)
	if love.keyboard.isDown("d") or (love.keyboard.isDown("s") and gameclock < 182) then
		for i, part in pairs(t) do
			part = nil
			table.remove(t, i)
		end
	end
	
	for i, part in pairs(t) do
		if part.death <= 0 or part.x < 0 or part.x > 799 or part.y < 0 or part.y > 599 then part = nil table.remove(t, i)
		else part:update(dt) end
	end
	
	spawnagain = spawnagain - 30*dt
	
	if (mousedown or love.keyboard.isDown(" ")) and spawnnow and spawnagain <= 0 then
		table.insert(t, Particle:new(love.mouse.getX(), love.mouse.getY(), deathtime))
		spawnagain = 3
	end
	
	if not sandbox then
		gameclock = gameclock + 1 * dt
		if gameclock >= 207 then ending.load() gamestate = ending
		elseif gameclock >= 193 then currentmsg = ma[27]
		elseif gameclock >= 182 then currentmsg = ma[26] tween(25, tweens, {partvol=0,alpha=255})
		elseif gameclock >= 180 then currentmsg = ma[25]
		elseif gameclock >= 174 then currentmsg = ma[24]
		elseif gameclock >= 170 then currentmsg = ma[23]
		elseif gameclock >= 164 then currentmsg = ma[22]
		elseif gameclock >= 157 then currentmsg = ma[21]
		elseif gameclock >= 150 then currentmsg = ma[20]
		elseif gameclock >= 145 then currentmsg = ma[19]
		elseif gameclock >= 137 then currentmsg = ma[18]
		elseif gameclock >= 133 then currentmsg = ma[17]
		elseif gameclock >= 130 then currentmsg = ma[16]
		elseif gameclock >= 127 then currentmsg = ma[15]
		elseif gameclock >= 120 then currentmsg = ma[14]
		elseif gameclock >= 112 then currentmsg = ma[13]
		elseif gameclock >= 105 then currentmsg = ma[12]
		elseif gameclock >= 97 then currentmsg = ma[11]
		elseif gameclock >= 89 then currentmsg = ma[10]
		elseif gameclock >= 80 then currentmsg = ma[9]
		elseif gameclock >= 73 then currentmsg = ma[8]
		elseif gameclock >= 62 then currentmsg = ma[7]
		elseif gameclock >= 56 then currentmsg = ma[6]
		elseif gameclock >= 45 then currentmsg = ma[5]
		elseif gameclock >= 18 then currentmsg = ma[4]
		elseif gameclock >= 9 then currentmsg = ma[3]
		elseif gameclock >= 4 then currentmsg = ma[2]
		else currentmsg = ma[1]end
		
		if gameclock >= 9 then bgalpha = 255 spawnnow = true
		else bgalpha = 0 spawnnow = false end
		if gameclock >= 56 then pretty = true else pretty = false end
		if gameclock >= 80 then conduct = true deathtime = 4000
		else conduct = false deathtime = 2000 end
	else
		bgalpha = 255
		spawnnow = true
		pretty = true
		deathtime = 7500
		conduct = true
		currentmsg = sa
	end
end

function game.mousepressed()
	mousedown = true
end

function game.mousereleased()
	mousedown = false
end

function game.keypressed(key)
	if key == "s" and gameclock < 182 then
		sandbox = not sandbox
		if not music:isPaused() then
			music:pause()
		else
			music:resume()
		end
	end
end