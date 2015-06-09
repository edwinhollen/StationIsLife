local class = require "middleclass"
require "color"

ShapeComponent = class("ShapeComponent")
function ShapeComponent:initialize(newColor)
  self.color = newColor or Color:new(255, 0, 0)
end

--
-- Rectangle
--
RectangleShapeComponent = class("RectangleShapeComponent", ShapeComponent)
function RectangleShapeComponent:initialize(newWidth, newHeight, newColor)
  ShapeComponent:initialize(newColor)
  self.width = newWidth or 0
  self.height = newHeight or 0
end

--
-- Circle
--
CircleShapeComponent = class("CircleShapeComponent", ShapeComponent)
function CircleShapeComponent:initialize(newRadius, newColor)
  ShapeComponent:initialize(newColor)
  self.radius = newRadius or 0
end