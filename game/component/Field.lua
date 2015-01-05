
module ('component', package.seeall)

require 'component.Zone'

local width, height, gap = 64, 64*1.6, 8

Field = component.Field:new {}

function Field:draw (graphics)
  local total = #self.cards
  graphics.setColor(50, 120, 50)
  graphics.rectangle('fill', 0, 0, self.size:unpack())
  for i,card in ipairs(self.cards) do
    graphics.push()
    graphics.translate(self.size.x/2-total/2*(width+gap)+(i-1)*(width+gap), 0)
    graphics.setColor(50, 50, 120)
    graphics.rectangle('fill', 0, 0, width, height)
    graphics.setColor(200, 200, 100)
    graphics.printf(card, 0, 0, width, 'center')
    graphics.pop()
  end
end
