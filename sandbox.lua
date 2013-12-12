sandbox = {}

finalPitch = 1
prevPitch = 1
timer = 0

function sandbox.load()
	loadgame()

	sa = _navi:new("|cFB7422FFPress G to activate ghostly mode", {box=false, wait=1000000, msg_spd=5, alxb='m', skip=false, alx='m'})

	pretty = true
	conduct = true
	deathtime = 10
	spawnnow = true
	if gamestate==sandbox then
		sound = love.audio.play(harmonyEng)
		sound:setLooping(true)
	end
end

function sandbox.update(dt)
	spawnagain = spawnagain - 30*dt

	local go = true
	for i, part in pairs(t) do
		part:update(dt)
		if part.x == love.mouse.getX() and part.y == love.mouse.getY() then
			go = false
			--print("Hmm?")
		end
		if part.death < 0 or love.keyboard.isDown("d") then
			part = nil
			table.remove(t, i)
		end
	end
	if gamestate == sandbox then
		prevPitch=finalPitch
		local pitching = {} --yes that is a pun of "bitching"
		for i, part in pairs(t) do --yes it has to be seperate
			if part.type ~= 8 then
			for x=1,#pitches,1 do
				if pitches[x] == part.pitch then
					table.insert(pitching,x)  --get all the values of the particles as members of pitches[]
					--print(x)
					break
				end
			end end
		end
		if #pitching > 0 then --check to see if there are particles
			panic=false
			finalPitch = pitching[1]+7  --right! let's build a perfect fifth! (nice interval)
			for a=1,#pitching,1 do
				for x=1,#pitching,1 do --below: check to make sure that no nasty intervals are created
					if finalPitch == pitching[x]+1 or finalPitch == pitching[x]-1 or finalPitch == pitching[x]+3 or finalPitch == pitching[x]-3 or finalPitch == pitching[x]+13 or finalPitch == pitching[x]-13 or finalPitch == pitching[x]+11 or finalPitch == pitching[x]-11 or finalPitch == pitching[x]+18 or finalPitch == pitching[x]-18 or finalPitch == pitching[x]+6 or finalPitch == pitching[x]-6 then
						panic = true
						break
					end
				end
				if not panic then break
				else finalPitch=pitching[a]+7 end
				panic=false
			end
		end--we got the pitch!!! yay!!!
		print(finalPitch)
		if finalPitch>=1 then
			if prevPitch~=0 then
				if finalPitch>prevPitch then
					while true do
						if finalPitch-prevPitch>12 then
							finalPitch=finalPitch-12
						else break end
					end
				elseif prevPitch>finalPitch then
					while true do
						if prevPitch-finalPitch>12 then
							finalPitch=finalPitch+12
						else break end
					end
				end
			end
		end
		if finalPitch>=1 and finalPitch<#pitches+12 and finalPitch-prevPitch~=1 and finalPitch-prevPitch~=-1 then
			if finalPitch > 12 then
				finalPitch = pitches[finalPitch-12]
			else finalPitch = pitches[finalPitch] end
			if finalPitch > 300 then
				finalPitch = finalPitch - 300   --work out distance
				m = 1    --double or half?
			elseif finalPitch < 300 then
				finalPitch = 300 - finalPitch   --distance
				m = -1
			end
			if finalPitch ~= 300 then
				finalPitch = finalPitch/300  --get percent of distance
				if m == -1 then
					finalPitch = finalPitch/2
					finalPitch = 1 - finalPitch
				else
					finalPitch = 1 + finalPitch
				end
				if timer <= 0 then
					 --play source
					timer = 3 --timer used to prevent overloading the sound card
				end
				sound:setDistance(5000,5000)
				sound:setPitch(finalPitch)  --bend pitch
			end
		end

		timer = timer - 1*dt --decrease timer
	end

	if (mousedown or love.keyboard.isDown(" ")) and spawnnow and spawnagain <= 0 and go then
		if ghosty then
			table.insert(t, Ghosticle:new(love.mouse.getX(), love.mouse.getY(), deathtime, math.random(1,7)))
		else
			table.insert(t, Particle:new(love.mouse.getX(), love.mouse.getY(), deathtime))
		end
		spawnagain = 3
	end
	if ghosty and math.random(1,42) == 42 then
		table.insert(t, Ghosticle:new(math.random(-400,800),math.random(-300,600), deathtime / 16, 8))
	end
end

function sandbox.draw()
	love.graphics.draw(bgpic)
	for i, part in pairs(t) do
		part:draw()
	end
	sa:play(400,0)
end

function sandbox.keypressed(key)
	if key == "g" then ghosty = not ghosty end
end

function sandbox.mousepressed()
	mousedown = true
end

function sandbox.mousereleased()
	mousedown = false
end
