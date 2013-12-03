sp = {}

sp[1] = love.graphics.newImage("splashers/1.png")
sp[2] = love.graphics.newImage("splashers/2.png")
sp[3] = love.graphics.newImage("splashers/3.png")
sp[4] = love.graphics.newImage("splashers/4.png")
sp[5] = love.graphics.newImage("splashers/5.png")
sp[6] = love.graphics.newImage("splashers/6.png")

fim = love.audio.newSource("splashers/fimichi.wav")
delta = 0

function loadSplash()
	love.audio.setVolume(2.8)
	love.audio.play(fim)
    splalg = 0
end

function playSplash()
	if delta<0.95 then
		x=1
	elseif delta<1.3 then
		x=2
	elseif delta<2.6 then
		x=3
	elseif delta<3.1 then
		x=4
	elseif delta<3.7 then
		x=5
	elseif delta<11 then
		x=6
	else
		return true
	end
	love.graphics.draw(sp[x])
	if delta>7 then
		if delta<10 then
			splalg = (delta-7)/3*100
		else
			splalg = 100
		end
		love.graphics.setColor(0,0,0,splalg/100*255)
		love.graphics.rectangle("fill",0,0,800,600)
	end
	return false
end

function updateSplash(dt)
	delta=delta+dt
end

function endSplash()
	love.audio.stop(fim)
end
