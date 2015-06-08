local class = require "middleclass"
require "scene"
require "ces"
require "color"
require "components/position_component"
require "components/physics_component"
require "components/shape_component"

require "systems/image_system"
require "systems/physics_system"
require "systems/shape_system"

TitleScene = class("TitleScene", Scene)
function TitleScene:initialize()
	self.ces = ComponentEntitySystem:new()
  
	-- add systems
	self.ces:addSystem(ImageSystem:new())
	self.ces:addSystem(PhysicsSystem:new())
  self.ces:addSystem(ShapeSystem:new())

	-- add entities
	self.ces:addEntity(Entity:new({
		ImageComponent:new(love.graphics.newImage("palette.png")),
		PositionComponent:new(10, 10),
		PhysicsComponent:new(4, 3)
	}))
  self.ces:addEntity(Entity:new({
    PositionComponent:new(50, 50),
    RectangleShapeComponent:new(100, 50, Color:new(255, 255, 0))
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