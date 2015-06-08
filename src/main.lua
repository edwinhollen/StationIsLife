--io.stdout:setvbuf("no")
require "ces"
require "components/position_component"
require "components/physics_component"
require "components/image_component"
require "systems/physics_system"
require "systems/image_system"

local _ces

function love.load()
	
	_ces = ComponentEntitySystem:new({
		PhysicsSystem:new(),
		ImageSystem:new()
	})

	_ces:addEntity(Entity:new({
		PositionComponent:new(20, 20),
		PhysicsComponent:new(0, 0),
		ImageComponent:new(love.graphics.newImage("palette.png"))
	}))

end

function love.update(dt)
	for system, entities in pairs(_ces:getFilteredEntities()) do
		system:update(entities, dt)
	end
end

function love.draw()
	for system, entities in pairs(_ces:getFilteredEntities()) do
		system:draw(entities)
	end
end