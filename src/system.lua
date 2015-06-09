local class = require "middleclass"

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
function System:update(entities, dt) end
function System:draw(entities) end
