local class = require "middleclass"

PhysicsComponent = class("PhysicsComponent")

function PhysicsComponent:initialize(newVelocityX, newVelocityY)
	self.velocityX = newVelocityX or 0
	self.velocityY = newVelocityY or 0
end

function PhysicsComponent:getVelocityX()
	return self.velocityX
end

function PhysicsComponent:getVelocityY()
	return self.velocityY
end

function PhysicsComponent:setVelocityX(newVX)
	self.velocityX = newVX or self.velocityX
end

function PhysicsComponent:setVelocityY(newVY)
	self.velocityY = newVY or self.velocityY
end