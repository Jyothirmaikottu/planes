debug = true

canShoot = true
canShootTimerMax = 0.2 
canShootTimer = canShootTimerMax

bulletImg = nil
bullets = {}


function love.load()
	player = { x = 300, y = 410, speed = 350, img = nil }
	player.img = love.graphics.newImage("assets/airplane.png")
	bulletImg = love.graphics.newImage('assets/bullet.png')
end

function love.update(dt)
	if love.keyboard.isDown('escape') then
		love.event.push('quit')
	end

	if love.keyboard.isDown('left','a') then
		if player.x > 0 then -- restricting the map
			player.x = player.x - (player.speed*dt)
		end

		elseif love.keyboard.isDown('right','d') then
			if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
				player.x = player.x + (player.speed*dt)
			end
		end

		canShootTimer = canShootTimer - (1 * dt)
		if canShootTimer < 0 then
			canShoot = true
		end

		if love.keyboard.isDown('space', 'rctrl', 'lctrl', 'ctrl') and canShoot then
			newBullet = { x = player.x + (player.img:getWidth()/2), y = player.y, img = bulletImg }
			table.insert(bullets, newBullet)
			canShoot = false
			canShootTimer = canShootTimerMax
		end

		for i, bullet in ipairs(bullets) do
			bullet.y = bullet.y - (250 * dt)

		  	if bullet.y < 0 then -- off screen removing bullets
		  		table.remove(bullets, i)
		  	end
		end
end

function love.draw(dt)
	love.graphics.setBackgroundColor(255,255,255)
	love.graphics.draw(player.img, player.x, player.y)
	for i, bullet in ipairs(bullets) do
		love.graphics.draw(bullet.img, bullet.x, bullet.y)
	end
end