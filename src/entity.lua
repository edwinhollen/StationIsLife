local class = require "middleclass"

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
  for componentKey, component in pairs(self.components) do
    if component:isInstanceOf(requestedClass) then
      return component
    end
  end
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
