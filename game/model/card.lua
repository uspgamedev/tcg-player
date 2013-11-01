
module ('model', package.seeall)

require 'data.cards'
require 'lux.object'

Card = lux.object.new {
  tapped  = false,
  name    = ""
}

function Card:getID ()
  return self.id 
end

function Card:tap ()
  self.tapped = true
end

function Card:untap ()
  self.tapped = false
end

function Card:toggleTap ()
  self.tapped = not self.tapped
end

function Card:getInfo ()
  return data.cards.getCardInfo(self.name)
end

function Card:getFormattedInfo ()
  local info = self:getInfo()
  local formatted = {
    {
      'right',
      "{"..(info.cost or '').."} -- ["..(info.size or '').."]"
    },
    {'center', info.name},
    {'center', "----------------------"},
    {'center', "("..info.type..(self.tapped and " - tapped" or "")..")"},
    {'center', "----------------------"},
    {'center', ""},
  }
  for _,rule in ipairs(info.rules) do
    table.insert(formatted, {'left', rule})
  end
  return formatted
end
