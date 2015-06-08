local class = require "middleclass"

ImageComponent = class("ImageComponent")

function ImageComponent:initialize(newImage)
	self.image = newImage or nil
end

function ImageComponent:getImage()
	return self.image 
end

function ImageComponent:setImage(newImage)
	self.image = newImage
end