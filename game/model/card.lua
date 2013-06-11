
module ('model', package.seeall)

require 'lux.object'

Card = lux.object.new {
  tapped = false,
  info = nil
}

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
  local info = {
    {
      'right',
      "{"..(self.info.cost or '').."} -- ["..(self.info.size or '').."]"
    },
    {'center', self.info.name},
    {'center', "----------------------"},
    {'center', "("..self.info.type..(self.tapped and " - tapped" or "")..")"},
    {'center', "----------------------"},
    {'center', ""},
  }
  for _,rule in ipairs(self.info.rules) do
    table.insert(info, {'left', rule})
  end
  return info
end
