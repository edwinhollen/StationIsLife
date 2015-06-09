local class = require "middleclass"
local json = require "json"
require "system"
require "components/position_component"
require "components/image_component"

ImageSystem = class("ImageSystem", System)

function ImageSystem:initialize()
	System.initialize(self, {PositionComponent, ImageComponent})
	love.graphics.setDefaultFilter("nearest", "nearest")
	self.loadedImages = {}
	-- load sprite images from map
	local assetmap = json.decode(tostring(love.filesystem.read("assetmap.json")))
	for imageName, info in pairs(assetmap["images"]) do
	 local canvas = love.graphics.newCanvas(info["width"], info["height"])
	 love.graphics.setCanvas(canvas)
	 love.graphics.draw(love.graphics.newImage("images/"..info["image"]), -info["x"], -info["y"])
	 love.graphics.setCanvas()
	 self.loadedImages[imageName] = love.graphics.newImage(canvas:getImageData())
	 print("Loaded", imageName)
	end
end

function ImageSystem:getImage(filename)
  if not self.loadedImages[filename] then
    self.loadedImages[filename] = love.graphics.newImage("images/"..filename)
  end
  return self.loadedImages[filename]
end

function ImageSystem:draw(entities)
  local scale = (800/400)
	for entityKey, entity in pairs(entities) do
		local pos = entity:getComponentByClass(PositionComponent)
		local img = entity:getComponentByClass(ImageComponent)
		love.graphics.draw(
		  self:getImage(img.image), 
		  math.floor(pos.x * scale + 0.5), 
		  math.floor(pos.y * scale + 0.5),
		  0,
		  scale,
		  scale
	  )
	end
end