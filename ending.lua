ending = {}

clouds = love.graphics.newImage("clouds.jpg")

function ending.update(dt)
	tween(8, tweens, {cloudx=-30})
	if tweens.cloudx == -30 then
		love.event.quit()
	end
end

function ending.draw()
	love.graphics.draw(clouds, tweens.cloudx, 0)
	ma[27]:play(400,0)
end