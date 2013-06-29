local Particle = class("Particle")

function Particle:initialize(x, y, terminate)
	self.image = love.graphics.newImage("catpix.png")
	self.w = self.image:getWidth()
	self.h = self.image:getHeight()
	self.x = x
	self.y = y
	self.death = terminate
	self.vx = 0
	self.vy = 0
	self.speed = 0
end

function Particle:update(dt)
	self.death = self.death - 400*dt
	
	local gx = self.x - love.mouse.getX()
	local gy = self.y - love.mouse.getY()
	local totalDist = math.sqrt(gx^2 + gy^2)
	local ax = gx/totalDist
	local ay = gy/totalDist
	if totalDist <= 100 then
		self.speed = (100/totalDist) * 100
	else
		if self.speed > 0 then
			self.speed = self.speed - 200*dt
		else
			self.speed = 0
		end
	end
	
	self.vx = ax*self.speed
	self.vy = ay*self.speed
	if totalDist ~= 0 then
		self.x = self.x + self.vx*dt
		self.y = self.y + self.vy*dt
	end
end

function Particle:draw()
	love.graphics.draw(self.image, self.x-(self.w/2), self.y-(self.h/2))
end

return Particle