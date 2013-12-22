module("StateManager", package.seeall)


function StateManager:start(initial_state)
	self.state = initial_state
	self.state:start()
end

function StateManager:stop()
	self.state:stop()
	self.state = nil
end

function StateManager:update(dt)
	local new_state = self.state:update(dt)
	if new_state then
		self.state:stop()
		self.state = new_state
		self.state:start()
	end
end

function StateManager:draw()
	self.state:draw()
end

function StateManager:key(key, action)
	self.state:key(key, action)
end

function StateManager:mousePos(x,y)
	self.state:mousePos(x,y)
end

function StateManager:mouse(key, action)
	self.state:mouse(key, action)
end