
require 'base.Component'

local MainScene = base.Component:new{}

function MainScene:load ()
  love.graphics.setBackgroundColor(100,100,100)
end

function MainScene:update (dt)
  -- body
end

function MainScene:draw ()
  -- body
end

MainScene:new{}:attach(love)
