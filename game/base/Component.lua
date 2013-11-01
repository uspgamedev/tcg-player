
module ('base', package.seeall)

require 'lux.object'
require 'lux.functional'
require 'lux.geom.vector'

Component = lux.object.new {}

Component.__init = {
  pos   = lux.geom.point:new {},
  size  = lux.geom.vector:new {}
}

function Component:left ()
  return self.pos.x
end
  
function Component:top ()
  return self.pos.y
end
  
function Component:right ()
  return self.pos.x + self.size.x
end
  
function Component:bottom ()
  return self.pos.y + self.size.y
end
  
function Component:inside (pos)
  if pos.x < self:left() or
     pos.y < self:top() or
     pos.x > self:right() or
     pos.y > self:bottom() then
    return false
  end
  return true
end

function Component:load ()
  -- unimplemented
end

function Component:update (dt)
  -- unimplemented
end

function Component:draw ()
  -- unimplemented
end

function Component:attach (love)
  local bind = lux.functional.bindleft
  for _,callback in ipairs{'load', 'update', 'draw'} do
    love[callback] = bind(self[callback], self)
  end
end
