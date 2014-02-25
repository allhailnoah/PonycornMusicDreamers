class Particle
	pitches: {55,58,61,65,69,73,77,82,87,92,98,104,110,117,123,131,139,147,156,165,175,185,196,208,220,233,247,262,277,294,311,330,349,370,392,415,440,466,494,523,554,587,622,659,698}
	new: (x, y, terminate) =>
		@anim = anim8.newAnimation(partgrid('1-3',1, '2-1',1), 0.1)
		@x = x
		@y = y
		@w = 14
		@h = 14
		@death = terminate
		@vx = 0
		@vy = 0
		@speed = 0
		@timer = 0
		@color = {255,255,255}
		@alph = 40
		@pitch = 0
		@type = 8
		tween(terminate, @, {alph = 0}, 'inQuint')
	update: (dt) =>
		@anim:update(dt)
		gx = self.x - love.mouse.getX()
		gy = self.y - love.mouse.getY()
		totalDist = math.sqrt(gx^2 + gy^2)
		ax = gx/totalDist
		ay = gy/totalDist
		if totalDist <= 100 and totalDist > 3 and conduct then
			@speed = (100/totalDist) * 100
		end
		if @speed > 3 then
			@speed = @speed - 200*dt
		else
			@speed = 3
		end
		if totalDist > 5 and @speed > 2000 then @speed = 0 end

		@vx = ax*@speed
		@vy = ay*@speed

		if totalDist ~= 0 then
			@x = @x + @vx*dt
			@y = @y + @vy*dt
		end

		@timer = @timer - 1*dt --decrease timer
		pitch = @y     --the pitch is equal to y (part 2 of the array)
		dif = 99999999
		dVal = 0
		for i in pairs(pitches) do
			if(pitches[i]-pitch > 0) then
				if(pitches[i]-pitch < dif) then
					dif = pitches[i]-pitch
					dVal = pitches[i]
				end
			else
				if(pitch-pitches[i] < dif) then
					dif = pitch-pitches[i]
					dVal = pitches[i]
				end
			end
		end
		pitch = dVal
		@pitch = dVal
		if pitch > 300 then
			pitch = pitch - 300   --work out distance
			m = 1    --double or half?
		elseif pitch < 300 then
			pitch = 300 - pitch   --distance
			m = -1
		end
		if pitch ~= 300 then
			pitch = pitch/300  --get percent of distance
			if m == -1 then
				pitch = pitch/2
				pitch = 1 - pitch
			else
				pitch = 1 + pitch
			end
			if @timer <= 0 then
				@sound = love.audio.play(auS) --play source
				@timer = 1.5 --timer used to prevent overloading the sound card
			end
			sx = self.x - 400
			@sound:setDirection(sx,0,0)   --attempt to have x = speaker balance
			@sound:setAttenuationDistances(5000,5000)
			@sound:setPitch(pitch)  --bend pitch
			@sound:setVolume(tweens.partvol/2)
		end
		if pretty then
			if @y>0 and @y<love.graphics.getHeight() then
				r,g,b,a = rainbow:getPixel(0, math.floor(@y))
				@color = {r,g,b}
			end
		end
		if @type~=8 then @sound:setVolume(0) end
		@death = @death - 1*dt
	draw: =>
		love.graphics.setColor(@color)
		@anim:draw(partimage, @x, @y, 0, 0.6, 0.6, @/2, @h/2)
		love.graphics.setBlendMode("additive")
		love.graphics.setColor(@color[1],@color[2],@color[3],@alph)
		love.graphics.draw(circ,@x,@y,0,(1.5+math.sin((@death+1)/2)),(1.5+math.sin((@death+1)/2)),50,50)
		love.graphics.setColor(255,255,255,255)
		love.graphics.setBlendMode("alpha")
