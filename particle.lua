local Particle = class("Particle")

function Particle:initialize(x, y, terminate)
	self.anim = anim8.newAnimation(partgrid('1-3',1, '2-1',1), 0.1)
	self.w = 7
	self.h = 7
	self.x = x --+ math.random()
	self.y = y --+ math.random()
	self.death = terminate
	self.vx = 0
	self.vy = 0
	self.speed = 0
	self.timer = 0
end

function Particle:update(dt)
	self.anim:update(dt)
	self.death = self.death - 400*dt
	
	local gx = self.x - love.mouse.getX()
	local gy = self.y - love.mouse.getY()
	local totalDist = math.sqrt(gx^2 + gy^2)
	if totalDist < 2 then totalDist = 2 end
	local ax = gx/totalDist
	local ay = gy/totalDist
	if totalDist <= 100 then
		self.speed = (100/totalDist) * 100
	else
		if self.speed > 3 then
			self.speed = self.speed - 200*dt
		else
			self.speed = 3
		end
	end
	
	self.vx = ax*self.speed
	self.vy = ay*self.speed
	
	self.x = self.x + self.vx*dt
	self.y = self.y + self.vy*dt
	
	self.timer = self.timer - 1*dt --decrease timer
	pitch = self.y     --the pitch is equal to y (part 2 of the array)
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
			self.timer = 2 --timer used to prevent overloading the sound card
		end
		self.sound:setPitch(pitch)  --bend pitch
	end
end

function Particle:draw()
	self.anim:draw(partimage, self.x-(self.w/2), self.y-(self.h/2))
end

return Particle