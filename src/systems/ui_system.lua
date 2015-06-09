local class = require "middleclass"
local tastytext = require "tastytext"
require "system"
require "components/position_component"
require "components/ui_component"

UISystem = class("UISystem", System)
function UISystem:initialize()
  System.initialize(self, {UIComponent, PositionComponent})
    self.font_regular = love.graphics.newFont("fonts/FiraSans-Regular.ttf", 16)
    self.font_bold = love.graphics.newFont("fonts/FiraSans-Bold.ttf", 16)
    self.font_huge = love.graphics.newFont("fonts/FiraSans-Bold.ttf", 48)
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
      love.graphics.setFont(self[lc.font])
      posX = math.floor(pos.x * scale - (lc.limit/2) + 0.5)
      love.graphics.printf(lc.text, posX, posY, lc.limit, lc.align)
    end
  end
end