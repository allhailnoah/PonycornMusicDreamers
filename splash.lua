splash = {}

local tick
local x
local sp
local finn

function splash.load()
	sp = {}
	sp[1] = love.graphics.newImage("splashers/1.png")
	sp[2] = love.graphics.newImage("splashers/2.png")
	sp[3] = love.graphics.newImage("splashers/3.png")
	sp[4] = love.graphics.newImage("splashers/4.png")
	sp[5] = love.graphics.newImage("splashers/5.png")
	sp[6] = love.graphics.newImage("splashers/6.png")
	sp.fade = 0

	fim = love.audio.newSource("splashers/fimichi.wav")
	love.audio.play(fim)
	tick = 0
	x=1
end

function splash.update(dt)
	tick = tick + dt
	if tick < 0.95 then x=1
	elseif tick < 1.3 then x=2
	elseif tick < 2.6 then x=3
	elseif tick < 3.1 then x=4
	elseif tick < 3.7 then x=5
	elseif tick < 11 then x=6
	end
	if tick > 6 and finn == nil then
		tween(2, sp, {fade=255})
		finn = true
	end
	if tick > 8 then change(menu) end
end

function splash.draw()
	love.graphics.draw(sp[x],-85,-85)
	love.graphics.setColor(0,0,0,sp.fade)
	love.graphics.rectangle("fill",0,0,800,600)
end

function splash.keypressed()
	change(menu)
end

function splash.mousepressed()
	change(menu)
end