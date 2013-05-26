
module ('ui', package.seeall)

require 'lux.object'

Card = lux.object.new {
  tapped = false
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
    {'center', "("..self.info.type..")"},
    {'center', "----------------------"},
    {'center', ""},
  }
  for _,rule in ipairs(self.info.rules) do
    table.insert(info, {'left', rule})
  end
  return info
end

function Card:keyAction (i, j, key)
  if key == 't' then
    self:tap()
  elseif key == 'u' then
    self:untap()
  end
end

function Card:draw (graphics, hidden, selection)
  if self.tapped then
    graphics.rotate(math.pi/2)
  end
  graphics.setColor(90,70,50,255)
  graphics.rectangle('fill', -32, -48, 64, 96)
  if selection[self] then
    graphics.setColor(100,180,140,255)
  else
    graphics.setColor(255,255,255,255)
  end
  graphics.rectangle('line', -32, -48, 64, 96)
  graphics.setColor(100,140,180,255)
  if not hidden and self.info then
    graphics.printf(self.info.name, -28, -40, 64-8, 'center')
  end
end
