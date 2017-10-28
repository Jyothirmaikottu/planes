debug = true

function love.load()
	player.plane = love.graphics.newImage("assets/airplane.png")
end

function love.update(dt)
	if love.keyboard.isDown('escape') then
		love.event.push('quit')
	end

	if love.keyboard.isDown('left','a') then
	if player.x > 0 then -- binds us to the map
		player.x = player.x - (player.speed*dt)
	end
	elseif love.keyboard.isDown('right','d') then
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed*dt)
		end
	end
end

function love.draw()
	love.graphics.setBackgroundColor(255,255,255)
	love.graphics.draw(player.plane, player.x, player.y)
end