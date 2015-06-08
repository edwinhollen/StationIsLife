local class = require "middleclass"

PositionComponent = class("PositionComponent")

function PositionComponent:initialize(newX, newY)
	self.x = newX or 0
	self.y = newY or 0
end

function PositionComponent:getX()
	return self.x
end

function PositionComponent:getY()
	return self.y
end

function PositionComponent:setX(newX)
	self.x = newX
end

function PositionComponent:setY(newY)
	self.y = newY
end