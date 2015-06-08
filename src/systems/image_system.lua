local class = require "middleclass"
require "ces"
require "components/position_component"
require "components/image_component"

ImageSystem = class("ImageSystem", System)

function ImageSystem:initialize()
	System.initialize(self, {PositionComponent, ImageComponent})
end

function ImageSystem:draw(entities)
	for entityKey, entity in pairs(entities) do
		local pos = entity:getComponentByClass(PositionComponent)
		local img = entity:getComponentByClass(ImageComponent)
		love.graphics.draw(img:getImage(), pos:getX(), pos:getY())
	end
end