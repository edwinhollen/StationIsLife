local class = require "middleclass"
require "ces"
require "components/position_component"
require "components/physics_component"

PhysicsSystem = class("PhysicsSystem", System)

function PhysicsSystem:initialize(newVelocityX, newVelocityY)
	System.initialize(self, {PositionComponent, PhysicsComponent})
end

function PhysicsSystem:update(entities, dt)
	for entityKey,entity in pairs(entities) do
		local pos = entity:getComponentByClass(PositionComponent)
		local phys = entity:getComponentByClass(PhysicsComponent)
		pos.x = pos.x + (phys.velocityX * dt)
		pos.y = pos.y + (phys.velocityY * dt)
	end
end