
module ('base', package.seeall)

require 'lux.object'
require 'lux.functional'

Component = lux.object.new {}

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
