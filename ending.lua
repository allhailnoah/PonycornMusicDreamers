ending = {}

function ending.load()
	t = nil
	tween(12, tweens, {cloudx=-50})
	clouds = love.graphics.newImage("clouds.jpg")
end

function ending.update(dt)
	if tweens.cloudx <= -50 then
		love.event.quit()
	end
end

function ending.draw()
	love.graphics.draw(clouds, tweens.cloudx, 0)
	ma[28]:play(400,0)
end