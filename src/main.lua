--io.stdout:setvbuf("no")
require "ces"
require "components/position_component"
require "components/physics_component"
require "components/image_component"
require "systems/physics_system"
require "systems/image_system"
require "scenes/scene_title"

local currentScene

function love.load()
	currentScene = TitleScene:new()
end

function love.update(dt)
	currentScene:update(dt)
end

function love.draw()
	currentScene:draw()
end