local class = require("middleclass")

--
-- ComponentEntitySystem
--
ComponentEntitySystem = class("ComponentEntitySystem")

function ComponentEntitySystem:initialize(initialSystems, initialEntities)
	print("Creating CES...")
	self.entities = initialEntities or {}
	self.systems = initialSystems or {}
end

function ComponentEntitySystem:addEntity(newEntity)
	table.insert(self.entities, newEntity)
end

function ComponentEntitySystem:addSystem(newSystem)
	table.insert(self.systems, newSystem)
end

function ComponentEntitySystem:getFilteredEntities()
	local returnList = {}
	for systemKey, system in pairs(self.systems) do
		returnList[system] = {}
		for entityKey, entity in pairs(self.entities) do
			local hasAcceptableComponents = true
			for componentClassKey, componentClass in pairs(system:getAcceptableComponents()) do
				if not entity:hasComponentOfType(componentClass) then
					hasAcceptableComponents = false
					break
				end
			end
			if hasAcceptableComponents then
				table.insert(returnList[system], entity)
			end
		end
	end
	return returnList
end

--
-- System
--
System = class('System')

function System:initialize(acceptableComponents)
	self.acceptableComponents = acceptableComponents or {}
end

function System:acceptsComponent(component)
	for acceptableComponentKey, acceptableComponent in pairs(self.acceptableComponents) do
		if Object.isInstanceOf(component, acceptableComponent) then
			return true
		end
	end
	return false
end

function System:getAcceptableComponents()
	return self.acceptableComponents
end
function System:update(entities, dt) end
function System:draw(entities) end

--
-- Entity
--
Entity = class('Entity')

function Entity:initialize(newComponents)
	self.components = newComponents or {}
end

function Entity:addComponent(newComponent)
	self.components.insert(newComponent)
end

function Entity:hasComponentOfType(requestedClass)
	for componentKey, component in pairs(self.components) do
		if component:isInstanceOf(requestedClass) then
			return true
		end
	end
	return false
end

function Entity:getComponentByClass(requestedClass)
	return self:getComponentsByClass(requestedClass)[1]
end

function Entity:getComponentsByClass(requestedClass)
	local returnComponents = {}
	for componentKey, component in pairs(self.components) do
		if component:isInstanceOf(requestedClass) then
			table.insert(returnComponents, component)
		end
	end
	return returnComponents
end