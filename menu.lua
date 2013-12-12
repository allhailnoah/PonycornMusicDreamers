menu = {}

function menu.load()
	bgpic = love.graphics.newImage("backpic.png")
end

function loadgame()
	auS = love.audio.newSource("toneA.ogg","static")
	auS:setVolume(0.1)
	harmonyEng = love.audio.newSource("toneB.ogg","static")
	rainbow = love.image.newImageData("rainbow.png")
	partimage = love.graphics.newImage("catpix.png")
	circ = love.graphics.newImage("circle.png")
	love.graphics.setBackgroundColor(235,235,235)
	partgrid = anim8.newGrid(14,14,partimage:getWidth(),partimage:getHeight())
	tweens={partvol=1,alpha=0,cloudx=0}
	
	t = {}
	spawnagain = 0
	gameclock = 0
	deathtime = 5
	bgalpha = 0
	
	love.graphics.setFont(arc.fn.f)
end

function menu.update(dt)
end

function menu.draw()
	love.graphics.draw(bgpic)
	love.graphics.setColor(255,255,255,255)
	f:set(40)
	love.graphics.print("SONG OF SPARKS",50,50)
	f:set(30)
	love.graphics.print("a musical toy",50,150)
	love.graphics.print("for you to enjoy",50,190)
	love.graphics.print("just click to make notes",50,230)
	love.graphics.print("and hear the sound as it floats",50,280)
	f:set(32)
	love.graphics.print("click down here to begin",50,350)
	love.graphics.print("this game by tim, michi and finn!",50,390)
	f:set(30)
	local y = love.mouse.getY()
	local x = love.mouse.getX()
	if x>=50 and x<=350 and y>= 480 and y<=580 then
		love.graphics.setColor(0,100,255)
	else
		love.graphics.setColor(255,255,255)
	end
	love.graphics.rectangle("line", 50, 480, 300, 100)
	love.graphics.printf("Story Mode", 50, 510, 300, "center")
	if x>=450 and x<=750 and y>=480 and y<=580 then
		love.graphics.setColor(0,255,100)
	else love.graphics.setColor(255,255,255) end
	love.graphics.rectangle("line", 450, 480, 300, 100)
	love.graphics.printf("Sandbox Mode", 450, 510, 300, "center")
end

function menu.keypressed(key)
end

function menu.mousepressed(x,y,b)
	if b == "l" then
		if y <= 580 and y >=480 then
			if x <= 350 and x >= 50 then
				change(game)
			end
			if x <= 750 and x >= 450 then
				change(sandbox)
			end
		end
	end
end