local Particle = class("Particle")

pitches = {55,58,61,65,69,73,77,82,87,92,98,104,110,117,123,131,139,147,156,165,175,185,196,208,220,233,247,262,277,294,311,330,349,370,392,415,440,466,494,523,554,587,622,659,698}

function Particle:initialize(x, y, terminate)
	self.anim = anim8.newAnimation(partgrid('1-3',1, '2-1',1), 0.1)
	self.x = x
	self.y = y
	self.w = 14
	self.h = 14
	self.death = terminate
	self.vx = 0
	self.vy = 0
	self.speed = 0
	self.timer = 0
	self.color = {255,255,255}
	self.alph = 40
	self.pitch = 0
	self.type = 8 --I have no idea what type is help me, just added to make sure that particles actually make sound
	tween(terminate, self, {alph = 0}, 'inQuint')
end

function Particle:update(dt)
	self.anim:update(dt)

	local gx = self.x - love.mouse.getX()
	local gy = self.y - love.mouse.getY()
	local totalDist = math.sqrt(gx^2 + gy^2)
	local ax = gx/totalDist
	local ay = gy/totalDist
	if totalDist <= 100 and totalDist > 3 and conduct then
		self.speed = (100/totalDist) * 100
	end
	if self.speed > 3 then
		self.speed = self.speed - 200*dt
	else
		self.speed = 3
	end
	if totalDist > 5 and self.speed > 2000 then self.speed = 0 end

	self.vx = ax*self.speed
	self.vy = ay*self.speed

	if totalDist ~= 0 then
		self.x = self.x + self.vx*dt
		self.y = self.y + self.vy*dt
	end

	self.timer = self.timer - 1*dt --decrease timer
	pitch = self.y     --the pitch is equal to y (part 2 of the array)
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
	self.pitch = dVal
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
		if self.timer <= 0 then
			self.sound = love.audio.play(auS) --play source
			self.timer = 1.5 --timer used to prevent overloading the sound card
		end
		sx = self.x - 400
		--self.sound:setDirection(sx,0,0)   --attempt to have x = speaker balance
		--self.sound:setAttenuationDistances(5000,5000)
		self.sound:setPitch(pitch)  --bend pitch
		self.sound:setVolume(tweens.partvol/2)
	end
	if pretty then
		if self.y>0 and self.y<love.graphics.getHeight() then
			local r,g,b,a = rainbow:getPixel(0, math.floor(self.y))
			self.color = {r,g,b}
		end
	end
	if self.type~=8 then self.sound:setVolume(0) end
	self.death = self.death - 1*dt
end

function Particle:draw()
	love.graphics.setColor(self.color)
	self.anim:draw(partimage, self.x, self.y, 0, 0.6, 0.6, self.w/2, self.h/2)
	love.graphics.setBlendMode("add")
	love.graphics.setColor(self.color[1],self.color[2],self.color[3],self.alph)
	love.graphics.draw(circ,self.x,self.y,0,(1.5+math.sin((self.death+1)/2)),(1.5+math.sin((self.death+1)/2)),50,50)
	love.graphics.setColor(255,255,255,255)
	love.graphics.setBlendMode("alpha")
end

return Particle
