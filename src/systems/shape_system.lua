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
  for entityKey, entity in pairs(entities) do
    local pos = entity:getComponentByClass(PositionComponent)
    local shape = entity:getComponentByClass(ShapeComponent)
    if shape:isInstanceOf(RectangleShapeComponent) then
      -- draw rectangle
      local rect = entity:getComponentByClass(RectangleShapeComponent)
      local vertices = {
        pos.x, pos.y,
        pos.x+rect.width, pos.y,
        pos.x+rect.width, pos.y+rect.height,
        pos.x, pos.y+rect.height
      }
      love.graphics.setColor(rect.color.r, rect.color.g, rect.color.b, rect.color.a)
      love.graphics.polygon("fill", vertices)
      
    elseif shape:isInstanceOf(CircleShapeComponent) then
      -- draw circle
      local circ = entity:getComponentByClass(CircleShapeComponent)
      love.graphics.setColor(circ.color.r, circ.color.g, circ.color.b, circ.color.a)
      love.graphics.circle("fill", pos.x, pos.y, circ.radius, 16)
    end
    
    love.graphics.setColor(255, 255, 255, 255)
  end
end