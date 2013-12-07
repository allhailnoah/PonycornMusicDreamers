local Ghosticle = class("Ghosticle", Particle)

function Ghosticle:initialize(x, y, terminate)
	Particle.initialize(self,x,y,terminate)
end

function Ghosticle:update(dt)
	Particle.update(self,dt)
end

function Ghosticle:draw()
	love.graphics.setColor(self.color)
	local bigmove = 90 * (self.death/self.initialdeath) + 10
	local smallmove =75-0 (65 * (self.death/self.initialdeath) + 10)
	self.anim:draw(partimage, self.x, self.y, 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x, self.y + bigmove, 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x, self.y - bigmove, 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x + bigmove, self.y, 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x - bigmove, self.y, 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x + smallmove, self.y + smallmove, 0, 0.3, 0.3, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x - smallmove, self.y + smallmove, 0, 0.3, 0.3, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x + smallmove, self.y - smallmove, 0, 0.3, 0.3, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x - smallmove, self.y - smallmove, 0, 0.3, 0.3, self.w/2, self.h/2)
	love.graphics.setBlendMode("multiplicative")
	love.graphics.setColor(self.color[1],self.color[2],self.color[3],50)
	love.graphics.draw(circ,self.x,self.y, 0, 2* (self.death/self.initialdeath), 2* (self.death/self.initialdeath), 50, 50)
	if self.death < self.initialdeath/2 then
		love.graphics.setColor(255-self.color[1],255-self.color[2],255-self.color[3],200*self.death/self.initialdeath)
	else
		love.graphics.setColor(255-self.color[1],255-self.color[2],255-self.color[3],200-200*self.death/self.initialdeath)
	end
	love.graphics.draw(circ,self.x,self.y + bigmove, 0, 1* (1-self.death/self.initialdeath), 1* (1-self.death/self.initialdeath), 50, 50)
	love.graphics.draw(circ,self.x,self.y - bigmove, 0, 1* (1-self.death/self.initialdeath), 1* (1-self.death/self.initialdeath), 50, 50)
	love.graphics.draw(circ,self.x + bigmove,self.y, 0, 1* (1-self.death/self.initialdeath), 1* (1-self.death/self.initialdeath), 50, 50)
	love.graphics.draw(circ,self.x - bigmove,self.y, 0, 1* (1-self.death/self.initialdeath), 1* (1-self.death/self.initialdeath), 50, 50)
	if self.death < self.initialdeath/2 then
		love.graphics.setColor(self.color[1],self.color[2],self.color[3],200*self.death/self.initialdeath)
	else
		love.graphics.setColor(self.color[1],self.color[2],self.color[3],200-200*self.death/self.initialdeath)
	end
	love.graphics.draw(circ,self.x + smallmove,self.y + smallmove, 0, 1.5* (1-self.death/self.initialdeath), 1.5* (1-self.death/self.initialdeath), 50, 50)
	love.graphics.draw(circ,self.x - smallmove,self.y + smallmove, 0, 1.5* (1-self.death/self.initialdeath), 1.5* (1-self.death/self.initialdeath), 50, 50)
	love.graphics.draw(circ,self.x + smallmove,self.y - smallmove, 0, 1.5* (1-self.death/self.initialdeath), 1.5* (1-self.death/self.initialdeath), 50, 50)
	love.graphics.draw(circ,self.x - smallmove,self.y - smallmove, 0, 1.5* (1-self.death/self.initialdeath), 1.5* (1-self.death/self.initialdeath), 50, 50)

	love.graphics.setColor(255,255,255,255)
	love.graphics.setBlendMode("alpha")
end

return Ghosticle
