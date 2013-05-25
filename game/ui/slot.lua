
module ('ui', package.seeall)

require 'lux.object'

Slot = lux.object.new {}

Slot.__init = {
  color = {0,0,0,0},
  stack = {}
}

function Slot:getColor ()
  return unpack(self.color)
end

function Slot:setColor (...)
  local color = ...
  if type(color) == 'table' then
    self.color = color
  else
    self.color = { ... }
  end
end

function Slot:pushCard (card)
  return table.insert(self.stack, card)
end

function Slot:popCard ()
  return table.remove(self.stack)
end

function Slot:topCard ()
  return self.stack[#self.stack]
end

function Slot:click (x, y, selection)
  local topcard = self:topCard()
  if not topcard then return end
  if selection[topcard] then
    selection[topcard] = nil
  else
    selection[topcard] = true
  end
end

function Slot:draw (graphics, selection)
  for _,card in ipairs(self.stack) do
    graphics.push()
    card:draw(graphics, selection)
    graphics.pop()
  end
  if #self.stack > 1 then
    graphics.printf(
      #self.stack,
      -48, 64-2*graphics.getFont():getHeight(),
      96,
      'right'
    )
  end
end
