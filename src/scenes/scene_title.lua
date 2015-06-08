local class = require "middleclass"
require "scene"
require "ces"
require "components/position_component"
require "components/physics_component"

require "systems/image_system"
require "systems/physics_system"

TitleScene = class("TitleScene", Scene)
function TitleScene:initialize()
	self.ces = ComponentEntitySystem:new()
	-- add systems
	self.ces:addSystem(ImageSystem:new())
	self.ces:addSystem(PhysicsSystem:new())

	-- add entities
	self.ces:addEntity(Entity:new({
		ImageComponent:new(love.graphics.newImage("palette.png")),
		PositionComponent:new(10, 10),
		PhysicsComponent:new(4, 3)
	}))
end

function TitleScene:update(dt)
	for system, entities in pairs(self.ces:getFilteredEntities()) do
		system:update(entities, dt)
	end
end

function TitleScene:draw()
	for system, entities in pairs(self.ces:getFilteredEntities()) do
		system:draw(entities)
	end
end