
module ('ui', package.seeall)

require 'lux.object'

Slot = lux.object.new {}

Slot.__init = {
  color   = {0,0,0,0},
  stack   = {},
  hidden  = false
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

function Slot:setHidden (flag)
  self.hidden = flag
end

function Slot:pushCard (card)
  return table.insert(self.stack, card)
end

function Slot:popCard ()
  return table.remove(self.stack)
end

function Slot:removeCard (card)
  local index
  for i,stacked in ipairs(self.stack) do
    if stacked == card then
      index = i
      break
    end
  end
  return table.remove(self.stack, index)
end

function Slot:topCard ()
  return self.stack[#self.stack]
end

function Slot:click (selection, info)
  local topcard = self:topCard()
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
    graphics.rectangle('line', -64, -64, 128, 127)
    self.focus = false
  end
  for _,card in ipairs(self.stack) do
    graphics.push()
    card:draw(graphics, self.hidden, selection)
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
