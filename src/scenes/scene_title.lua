local class = require "middleclass"
require "scene"
require "color"
require "entity"
require "components/position_component"
require "components/physics_component"
require "components/shape_component"
require "components/ui_component"

TitleScene = class("TitleScene", Scene)
function TitleScene:initialize()
  self.ces = ComponentEntitySystem:new()

  -- add systems
  -- systems are auto-added now
  
  -- add entities
  -- background
  self.ces:addEntity(Entity:new({
    PositionComponent:new(0, 0),
    RectangleShapeComponent:new(400, 300, Color:new(24, 21, 30))
  }))
  -- stars
  for i=1, 20 do
    self.ces:addEntity(Entity:new({
      PositionComponent:new(love.math.random(400), love.math.random(300)),
      ImageComponent:new(({"star_tiny","star_small","star_medium","star_large"})[love.math.random(1,4)])
    }))
  end
  -- title
  self.ces:addEntity(Entity:new({
    PositionComponent:new(400/2, 300/2-20),
    UILabelComponent:new("Station is Life", "center", 800, "font_huge")
  }))

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
