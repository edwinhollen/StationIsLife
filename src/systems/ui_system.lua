local class = require "middleclass"
require "system"
require "components/position_component"
require "components/ui_component"

UISystem = class("UISystem", System)
function UISystem:initialize()
  System.initialize(self, {UIComponent, PositionComponent})
end

function UISystem:update(entities, dt)

end

function UISystem:draw(entities)
  local scale = (800/400)
  for key, entity in ipairs(entities) do
    local pos = entity:getComponentByClass(PositionComponent)
    local uic = entity:getComponentByClass(UIComponent)
    local posX = math.floor(pos.x * scale + 0.5)
    local posY = math.floor(pos.y * scale + 0.5)
    if uic:isInstanceOf(UILabelComponent) then
      local lc = entity:getComponentByClass(UILabelComponent)
      love.graphics.setColor(uic.textColor.r, uic.textColor.g, uic.textColor.b, uic.textColor.a)
      love.graphics.printf(lc.text, posX, posY, lc.limit, lc.align)
    end
  end
end