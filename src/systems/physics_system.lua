local class = require "middleclass"
require "ces"
require "components/position_component"
require "components/physics_component"

PhysicsSystem = class("PhysicsSystem", System)

function PhysicsSystem:initialize(newVelocityX, newVelocityY)
	System.initialize(self, {PositionComponent})
end

function PhysicsSystem:update(entities, dt)
	for entityKey,entity in pairs(entities) do
		local pos = entity:getComponentByClass(PositionComponent)
		local phys = entity:getComponentByClass(PhysicsComponent)
		pos:setX(pos:getX()+(phys:getVelocityX()*dt))
		pos:setY(pos:getY()+(phys:getVelocityY()*dt))
	end
end