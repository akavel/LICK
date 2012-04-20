require "LICK"
lick.reset = true
lick.clearFlag = true


State = State or {}
function declare(t)
	for i,v in pairs(t) do
		if not State[i] then
			State[i] = v
			_G[i] = State[i]
		end
	end
end

-- fill the screen with translucent black
function cls(alpha)
	love.graphics.setColor(0,0,0,alpha)
	love.graphics.rectangle("fill", 0,0,800,600)
end


-- put in main.lua
function love.load()
	
	declare({ 
		t = 0,
		x = 0,
		y = 0,
		o1 = 0,
		o2 = 0,
		g1 = 0,
		g2 = 0,
		k = 0,
		h = 0,
		circle = {x=200,y=200,r=1,seg=32, color={255, 255, 255}}
	})
	
	
end

function love.update(dt)
	circle.color = {0, 255, 0, 150} --ez.color("green", 150)
	h = 5 + 0.01
	k = 1 + 0.0001
end

function love.draw()
	cls(20)
	love.graphics.setBlendMode("alpha")

	for i=1,500 do
		t = t + 0.01
		o1 = 1 * h
		o2 = 2.5 * k
		g1 = 400 
		g2 = 300
		scale = 300 
		x = scale * math.sin(o1 * t) + g1
		y = scale * math.sin(o2 * t) + g2
		circle.x = x
		circle.y = y

        love.graphics.setColor(unpack(circle.color))
        love.graphics.circle("fill", circle.x, circle.y, circle.r, circle.seg)
		--circle:draw("fill")
	end
	love.graphics.setBlendMode("multiplicative")

	
end

