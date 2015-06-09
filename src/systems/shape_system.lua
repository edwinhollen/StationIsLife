local class = require "middleclass"
require "ces"
require "components/shape_component"
require "components/position_component"

ShapeSystem = class("ShapeSystem", System)
function ShapeSystem:initialize()
  System.initialize(self, {ShapeComponent, PositionComponent})
end

function ShapeSystem:update(entities, dt)
  
end

function ShapeSystem:draw(entities)
  local scale = (800/400)
  for entityKey, entity in pairs(entities) do
    local pos = entity:getComponentByClass(PositionComponent)
    local shape = entity:getComponentByClass(ShapeComponent)
    love.graphics.setColor(shape.color.r, shape.color.g, shape.color.b, shape.color.a)
    local xPos = math.floor(pos.x * scale + 0.5)
    local yPos = math.floor(pos.y * scale + 0.5)
    if shape:isInstanceOf(RectangleShapeComponent) then
      -- draw rectangle
      local rect = entity:getComponentByClass(RectangleShapeComponent)
      love.graphics.rectangle("fill", xPos, yPos, rect.width * scale, rect.height * scale)
    elseif shape:isInstanceOf(CircleShapeComponent) then
      -- draw circle
      local circ = entity:getComponentByClass(CircleShapeComponent)
      love.graphics.circle("fill", xPos, yPos, circ.radius*scale, 16)
    end
    love.graphics.setColor(255, 255, 255, 255)
  end
end