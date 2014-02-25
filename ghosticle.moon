class Ghosticle extends Particle
	new: (x, y, terminate, type) =>
		super\new x, y, terminate
		@life = terminate
		@factor = {1}
		@mode = "additive"
		tween(terminate, @factor, {0})
		@type = type
		if @type == 8 then
			@circles = {}
			@circles[1] = {x = math.random(1,20), y = math.random(1,20), s = 1, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
			@circles[2] = {x = math.random(1,20), y = math.random(1,20), s = 2, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
			@circles[3] = {x = math.random(1,20), y = math.random(1,20), s = 3, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
			@circles[4] = {x = math.random(1,20), y = math.random(1,20), s = 4, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
			@circles[5] = {x = math.random(1,20), y = math.random(1,20), s = 5, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
			@circles[6] = {x = math.random(1,20), y = math.random(1,20), s = 6, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
			@circles[7] = {x = math.random(1,20), y = math.random(1,20), s = 7, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
			@circles[8] = {x = math.random(1,20), y = math.random(1,20), s = 8, c = {math.random(0,255),math.random(0,255),math.random(0,255)}}
			for i,v in ipairs(@circles) do
				tween(terminate, v, {x = 10, y = 10, s = 5})
			end
			@twid = tween(4 * terminate, @, {x = love.mouse.getX() - 250, y = love.mouse.getY() - 250})
	update: (dt) =>
		super\update dt
		if @type == 8 then
			tween.stop(@twid)
			tween.reset(@twid)
			@twid = tween(4 * (@.life - @.death), @, {x = love.mouse.getX()- 250, y = love.mouse.getY()- 250})
