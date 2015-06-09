local class = require "middleclass"
require "color"

UIComponent = class("UIComponent")
function UIComponent:initialize()
  self.textColor = Color:new(255, 255, 255)
end

--
-- Label component
--
UILabelComponent = class("UILabelComponent", UIComponent)
function UILabelComponent:initialize(newText, newAlign, newLimit, newFont)
  UIComponent.initialize(self)
  self.text = newText or ""
  self.align = newAlign or "left" -- "left", "center", "right"
  self.limit = newLimit or 800
  self.font = newFont or "font_regular"
end