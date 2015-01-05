
module ('component', package.seeall)

require 'base.Component'

local width, height, gap = 64, 64*1.6, 8

Board = base.Component:new {
  zones = {}
}

function Board:draw (graphics)
  graphics.setColor(50, 120, 50)
  graphics.rectangle('fill', 0, 0, self.size:unpack())
end
