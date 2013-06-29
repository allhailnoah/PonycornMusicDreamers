game = {}

Particle = require "particle"

t = {}
spawnagain = 0
clock = 0
i = 0
pitch = 440

function game.draw()
	auS = love.audio.newSource("tone.ogg","static")
	for i, part in pairs(t) do
		part:draw()
	end
end

function game.update(dt)
	for i, part in pairs(t) do
		part:update(dt)
		if part.death <= 0 then table.remove(t, i) end
	end
	spawnagain = spawnagain - 30*dt
	if (mousedown or love.keyboard.isDown(" ")) and spawnagain <= 0 then
		table.insert(t, Particle:new(love.mouse.getX(), love.mouse.getY(), 1000))
		spawnagain = 3
	end
	if clock == 0 then
		audioCall()
		clock = 1
	else
		clock = clock - 1
	end
end

function game.mousepressed()
	mousedown = true
end

function game.mousereleased()
	mousedown = false
end

function audioCall()   --doesn't produce sound?!
	i=i+1
	if i > 800 then i=0 end    --for every value of x
		for z, foo in pairs(t) do    --see if any values equal x, and play them
			if t[z] ~= nil then    --is it non-nil?
				if x == t[z][1] then    --do the x-values match?
					pitch = t[z][2]     --the pitch is equal to y (part 2 of the array)
					if pitch > 300 then
						pitch = pitch - 300   --work out distance
						m = 1    --double or half?
					else if pitch < 300 then
						pitch = 300 - pitch   --distance
						m = -1
					end
					if pitch ~= 300 then
						pitch = pitch/300  --get percent of distance
						pitch = pitch
						if m == -1 then
							pitch = pitch/2
							pitch = 1 - pitch
						else pitch = 1 + pitch end
						auS:setPitch(pitch)  --bend pitch
						love.audio.play(auS)   --play source
					end
				end
			end
		end
	end
end
