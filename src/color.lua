local class = require "middleclass"

Color = class("Color")
function Color:initialize(newR, newG, newB, newA)
  self.r = newR or 0
  self.g = newG or 0
  self.b = newB or 0
  self.a = newA or 255
end