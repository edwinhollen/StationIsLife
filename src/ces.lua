local class = require("middleclass")
require "systems/physics_system"
require "systems/shape_system"
require "systems/image_system"
require "systems/ui_system"

--
-- ComponentEntitySystem
--
ComponentEntitySystem = class("ComponentEntitySystem")

function ComponentEntitySystem:initialize(initialEntities, initialSystems)
	print("Creating CES...")
	self.entities = initialEntities or {}
	self.systems = initialSystems or {
	 PhysicsSystem:new(),
	 ShapeSystem:new(),
	 ImageSystem:new(),
	 UISystem:new()
	}
end

function ComponentEntitySystem:addEntity(newEntity)
	table.insert(self.entities, newEntity)
end

function ComponentEntitySystem:addSystem(newSystem)
	table.insert(self.systems, newSystem)
end

function ComponentEntitySystem:getFilteredEntities()
	local returnList = {}
	for systemKey, system in ipairs(self.systems) do
		local obj = {}
		obj["system"] = system
		obj["entities"] = {}
		for entityKey, entity in ipairs(self.entities) do
			local hasAcceptableComponents = true
			for componentClassKey, componentClass in ipairs(obj["system"].acceptableComponents) do
				if not entity:hasComponentOfType(componentClass) then
					hasAcceptableComponents = false
					break
				end
			end
			if hasAcceptableComponents then
				table.insert(obj["entities"], entity)
			end
		end
		table.insert(returnList, obj)
	end
	return returnList
end
