local Particle = class("Particle")

function Particle:initialize(x, y, terminate)
	self.image = love.graphics.newImage("catpix.png")
	self.w = self.image:getWidth()
	self.h = self.image:getHeight()
	self.x = x
	self.y = y
	self.death = terminate
end

function Particle:update(dt)
	self.death = self.death - 400*dt
end

function Particle:draw()
	love.graphics.draw(self.image, self.x-(self.w/2), self.y-(self.h/2))
end

return Particle