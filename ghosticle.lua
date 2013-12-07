local Ghosticle = class("Ghosticle", Particle)

function Ghosticle:initialize(x, y, terminate)
	Particle.initialize(self,x,y,terminate)
end

function Ghosticle:update(dt)
	Particle.update(self,dt)
end

function Ghosticle:draw()
	love.graphics.setColor(self.color)
	self.anim:draw(partimage, self.x, self.y, 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x, self.y + 100 * (self.death/self.initialdeath), 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x, self.y - 100 * (self.death/self.initialdeath), 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x + 100 * (self.death/self.initialdeath), self.y, 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x - 100 * (self.death/self.initialdeath), self.y, 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x + 75 * (self.death/self.initialdeath), self.y + 75 * (self.death/self.initialdeath), 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x - 75 * (self.death/self.initialdeath), self.y + 75 * (self.death/self.initialdeath), 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x + 75 * (self.death/self.initialdeath), self.y - 75 * (self.death/self.initialdeath), 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x - 75 * (self.death/self.initialdeath), self.y - 75 * (self.death/self.initialdeath), 0, 0.6, 0.6, self.w/2, self.h/2)
	love.graphics.setBlendMode("multiplicative")
	love.graphics.setColor(self.color[1],self.color[2],self.color[3],200-200*self.death/self.initialdeath)
	love.graphics.draw(circ,self.x,self.y, 0, 2.5* (self.death/self.initialdeath), 2.5* (self.death/self.initialdeath), 50, 50)
	love.graphics.setColor(255,255,255,255)
	love.graphics.setBlendMode("alpha")
end

return Ghosticle
