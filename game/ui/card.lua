
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

function Card:keyAction (i, j, key)
  if key == 't' then
    self:tap()
  elseif key == 'u' then
    self:untap()
  end
end

function Card:draw (graphics, selection)
  if self.tapped then
    graphics.rotate(math.pi/2)
  end
  if selection[self] then
    graphics.setColor(100,140,180,255)
    graphics.rectangle('fill', -36, -52, 72, 104)
  end
  graphics.setColor(90,70,50,255)
  graphics.rectangle('fill', -32, -48, 64, 96)
  graphics.setColor(255,255,255,255)
  graphics.rectangle('line', -32, -48, 64, 96)
  graphics.setColor(100,140,180,255)
  if self.info then
    graphics.printf(self.info.name, -28, -40, 64-8, 'center')
  end
end
