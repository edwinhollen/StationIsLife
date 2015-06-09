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
  self.ces:addSystem(PhysicsSystem:new())
  self.ces:addSystem(ShapeSystem:new())
  self.ces:addSystem(ImageSystem:new())
  
  for key, sys in pairs(self.ces.systems) do
    print(key, sys)
  end
  
  --love.quit()
  

  -- add entities
  --[[

	self.ces:addEntity(Entity:new({

		ImageComponent:new(love.graphics.newImage("palette.png")),

		PositionComponent:new(10, 10),

		PhysicsComponent:new(4, 3)

	}))

  self.ces:addEntity(Entity:new({

    PositionComponent:new(50, 50),

    RectangleShapeComponent:new(100, 50, Color:new(255, 255, 0))

  }))

  ]]--
  self.ces:addEntity(Entity:new({
    PositionComponent:new(0, 0),
    RectangleShapeComponent:new(400, 300, Color:new(24, 21, 30))
  }))
  for i=1, 20 do
    self.ces:addEntity(Entity:new({
      PositionComponent:new(love.math.random(400), love.math.random(300)),
      ImageComponent:new(({"star_tiny","star_small","star_medium","star_large"})[love.math.random(1,4)])
    }))
  end

end

function TitleScene:update(dt)
  for k,obj in ipairs(self.ces:getFilteredEntities()) do
    obj["system"]:update(obj["entities"], dt)
  end
end

function TitleScene:draw()
  for k,obj in ipairs(self.ces:getFilteredEntities()) do
    obj["system"]:draw(obj["entities"])
  end
end
