
module ('component', package.seeall)

require 'base.Component'

local width, height, gap = 64, 64*1.6, 8


Board = base.Component:new {
  cards = {}
}

function Board:draw (graphics)
  local total = #self.cards
  graphics.setColor(50, 120, 50)
  graphics.rectangle('fill', 0, 0, self.size:unpack())
  for i,card in ipairs(self.cards) do
    graphics.setColor(50, 50, 120)
    graphics.rectangle(
      'fill',
      self.size.x/2-total/2*(width+gap)+(i-1)*(width+gap), 0,
      width, height
    )
  end
end
