
module ('model', package.seeall)

require 'lux.object'

Slot = lux.object.new {}

Slot.__init = {
  stack   = {},
  color   = {0,0,0,0},
  hidden  = false,
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

function Slot:totalSize ()
  local total = 0
  for _,card in ipairs(self.stack) do
    total = total + (card.info.size or 0)
  end
  return total
end

function Slot:pushCard (card)
  return table.insert(self.stack, card)
end

function Slot:insertCard (card, pos)
  return table.insert(self.stack, pos or 1, card)
end

function Slot:popCard ()
  return table.remove(self.stack)
end

function Slot:removeCard (cardID)
  local index
  for i,stacked in ipairs(self.stack) do
    if stacked.id == cardID then
      index = i
      break
    end
  end
  return index and table.remove(self.stack, index)
end

function Slot:topCard ()
  return self.stack[#self.stack]
end

function Slot:getQuantity ()
  return #self.stack
end

function Slot:cards ()
  return ipairs(self.stack)
end
