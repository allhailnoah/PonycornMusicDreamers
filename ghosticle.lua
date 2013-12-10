local Ghosticle = class("Ghosticle", Particle)

function Ghosticle:initialize(x, y, terminate, type)
	Particle.initialize(self,x,y,terminate)
	self.factor = {1}
	tween(terminate, self.factor, {0})
	self.type = type
	if self.type == 8 then
		self.circles = {}
		self.circles[1] = {x = math.random(1,20), y = math.random(1,20), s = 1, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
		self.circles[2] = {x = math.random(1,20), y = math.random(1,20), s = 2, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
		self.circles[3] = {x = math.random(1,20), y = math.random(1,20), s = 3, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
		self.circles[4] = {x = math.random(1,20), y = math.random(1,20), s = 4, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
		self.circles[5] = {x = math.random(1,20), y = math.random(1,20), s = 5, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
		self.circles[6] = {x = math.random(1,20), y = math.random(1,20), s = 6, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
		self.circles[7] = {x = math.random(1,20), y = math.random(1,20), s = 7, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
		self.circles[8] = {x = math.random(1,20), y = math.random(1,20), s = 8, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
		for i,v in ipairs(self.circles) do
			tween(terminate, v, {x = 10, y = 10, s = 5})
		end
		tween(terminate, self, {x = math.random(0,800), y = math.random(0,600)})
	end
end

function Ghosticle:update(dt)
	Particle.update(self,dt)
end

function Ghosticle:drawMain()
	love.graphics.setBlendMode("multiplicative")
	love.graphics.setColor(self.color[1],self.color[2],self.color[3],1)
	love.graphics.draw(circ,self.x,self.y, 0, 2*self.factor[1], 2*self.factor[1], 50, 50)
	love.graphics.setColor(self.color)
	love.graphics.setBlendMode("alpha")
	self.anim:draw(partimage, self.x, self.y, 0, 0.6, 0.6, self.w/2, self.h/2)
end

function Ghosticle:drawDirParts()
	self.anim:draw(partimage, self.x, self.y + self.bigmove, 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x, self.y - self.bigmove, 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x + self.bigmove, self.y, 0, 0.6, 0.6, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x - self.bigmove, self.y, 0, 0.6, 0.6, self.w/2, self.h/2)
	if self.factor[1]<0.5 then
		love.graphics.setColor(255-self.color[1],255-self.color[2],255-self.color[3],200*self.factor[1])
	else
		love.graphics.setColor(255-self.color[1],255-self.color[2],255-self.color[3],200-200*self.factor[1])
	end
	love.graphics.draw(circ,self.x,self.y + self.bigmove, 0, 1* (1-self.factor[1]), 1* (1-self.factor[1]), 50, 50)
	love.graphics.draw(circ,self.x,self.y - self.bigmove, 0, 1* (1-self.factor[1]), 1* (1-self.factor[1]), 50, 50)
	love.graphics.draw(circ,self.x + self.bigmove,self.y, 0, 1* (1-self.factor[1]), 1* (1-self.factor[1]), 50, 50)
	love.graphics.draw(circ,self.x - self.bigmove,self.y, 0, 1* (1-self.factor[1]), 1* (1-self.factor[1]), 50, 50)
end

function Ghosticle:drawDiagParts()
	self.anim:draw(partimage, self.x + self.smallmove, self.y + self.smallmove, 0, 0.3, 0.3, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x - self.smallmove, self.y + self.smallmove, 0, 0.3, 0.3, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x + self.smallmove, self.y - self.smallmove, 0, 0.3, 0.3, self.w/2, self.h/2)
	self.anim:draw(partimage, self.x - self.smallmove, self.y - self.smallmove, 0, 0.3, 0.3, self.w/2, self.h/2)
	if self.factor[1]<0.5 then
		love.graphics.setColor(self.color[1],self.color[2],self.color[3],200*self.factor[1])
	else
		love.graphics.setColor(self.color[1],self.color[2],self.color[3],200-200*self.factor[1])
	end
	love.graphics.draw(circ,self.x + self.smallmove,self.y + self.smallmove, 0, 1.5* (1-self.factor[1]), 1.5* (1-self.factor[1]), 50, 50)
	love.graphics.draw(circ,self.x - self.smallmove,self.y + self.smallmove, 0, 1.5* (1-self.factor[1]), 1.5* (1-self.factor[1]), 50, 50)
	love.graphics.draw(circ,self.x + self.smallmove,self.y - self.smallmove, 0, 1.5* (1-self.factor[1]), 1.5* (1-self.factor[1]), 50, 50)
	love.graphics.draw(circ,self.x - self.smallmove,self.y - self.smallmove, 0, 1.5* (1-self.factor[1]), 1.5* (1-self.factor[1]), 50, 50)
end

function Ghosticle:drawRndCircles()
	for i,v in ipairs(self.circles) do
		love.graphics.setBlendMode("multiplicative")
		love.graphics.setColor(v["c"])
		love.graphics.draw(circ, self.x + v["x"]-10+self.bigmove, self.y + v["y"]-10+self.smallmove, 0, v["s"], v["s"], math.random(1,15), math.random(1,15))
	end
end

function Ghosticle:draw()
	self.bigmove = 90 * (self.factor[1]) + 10
	self.smallmove =75- (65 * (self.factor[1]) + 10)
	if self.type == 1 then
		self:drawMain()
		self:drawDirParts()
		self:drawDiagParts()
	elseif self.type == 2 then
		self:drawMain()
		self:drawDirParts()
	elseif self.type == 3 then
		self:drawMain()
		self:drawDiagParts()
	elseif self.type == 4 then
		self:drawMain()
	elseif self.type == 5 then
		self:drawDirParts()
		self:drawDiagParts()
	elseif self.type == 6 then
		self:drawDirParts()
	elseif self.type == 7 then
		self:drawDiagParts()
	elseif self.type == 8 then
		self:drawRndCircles()
	end
	love.graphics.setColor(255,255,255,255)
	love.graphics.setBlendMode("alpha")
end

return Ghosticle
