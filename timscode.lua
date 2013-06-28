--Assorted code that doesn't really do anything in itself. Just collision and a mapCollide function that doesn't really even work out of the box.
--If we can figure out how to work this in to an entity base class, then that would be cool.

local Player = class("Player")

function Player:initialize(x, y)
	self.name = "player"
	self.l = x
	self.t = y
	self.w = 50
	self.h = 50
	bump.add(self)
	self.vx = 0
	self.vy = 0
end

function Player:update()
	if not love.keyboard.isDown("left","right") then
		self.vx = 0
	end
	if not love.keyboard.isDown("up","down") then
		self.vy = 0
	end
	
	signvx = sign(self.vx)
	if math.abs(self.vx) > tilesize then self.vx = signvx*tilesize end
	if mapCollide(self.l + self.vx, self.t) or mapCollide(self.l + self.vx, self.t + self.h - 1) or mapCollide (self.l + self.vx, self.t + self.h / 2) then
		self.l = math.floor(self.l / tilesize) * tilesize
		self.vx = 0
	elseif mapCollide(self.l + self.vx + self.w, self.t) or mapCollide(self.l + self.vx + self.w, self.t + self.h - 1) or mapCollide (self.l + self.vx + self.w, self.t + self.h / 2) then
		self.l = (math.floor((self.l + self.w + self.speed) / tilesize) * tilesize) - self.w
		self.vx = 0
	end
	
	self.l = self.l + self.vx
	
	signvy = sign(self.vy)
	if math.abs(self.vy) > tilesize then self.vy = signvy*tilesize end
	if mapCollide(self.l, self.t + self.h + self.vy) or mapCollide(self.l + self.w - 1, self.t + self.h + self.vy) or mapCollide (self.l + self.w / 2, self.t + self.h + self.vy) then
		self.t = (math.floor((self.t + self.h + self.speed) / tilesize) * tilesize) - self.h
		self.vy = 0
	elseif mapCollide(self.l, self.t + self.vy) or mapCollide(self.l + self.w - 1, self.t + self.vy) or mapCollide (self.l + self.w / 2, self.t + self.vy) then
		self.t = math.floor(self.t / tilesize) * tilesize
		self.vy = 0
	end
	
	self.t = self.t + self.vy
end

function mapCollide(x, y)
	local checkMap = currentMap("Main")(math.floor(x/tilesize), math.floor(y/tilesize))
	if checkMap ~= nil then
		if checkMap.properties.solid then
			return true
		end
	end
end

function Player:draw()
end

return Player