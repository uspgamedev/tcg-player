
module ('ui', package.seeall)

require 'ui.card'
require 'lux.object'

Slot = lux.object.new {}

Slot.__init = {
  reference = nil,
  focus     = false
}

function Slot:click (selection, info)
  local topcard = self.reference:topCard()
  if not topcard then return end
  if selection[topcard] then
    selection[topcard] = nil
  else
    selection[topcard] = info
  end
end

function Slot:hover ()
  self.focus = true
end

function Slot:draw (graphics, selection)
  if self.focus then
    graphics.setColor(255,100,100,255)
    graphics.rectangle('line', -64, -64, 127, 127)
    self.focus = false
  end
  for i,card in self.reference:cards() do
    graphics.push()
    local d = math.min(#self.reference.stack-i-1, 2)
    graphics.translate(d*5, d*5)
    ui.Card.draw(graphics, self.reference.hidden, selection, card)
    graphics.pop()
  end
  if #self.reference.stack > 1 then
    graphics.printf(
      #self.reference.stack,
      -60, 64-2*graphics.getFont():getHeight(),
      120,
      'right'
    )
  end
end
