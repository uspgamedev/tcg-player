
module ('ui', package.seeall)

require 'control.card'
require 'lux.object'

Card = lux.object.new {}

function Card.keyAction (key, carddata)
  if key == 't' then
    control.card.tapCard(carddata)
  elseif key == 'u' then
    control.card.untapCard(carddata)
  end
end

function Card.draw (graphics, hidden, selection, carddata)
  if carddata.tapped then
    graphics.rotate(math.pi/2)
  end

  -- background
  graphics.setColor(90,70,50,255)
  graphics.rectangle('fill', -32, -48, 64, 96)

  -- border
  if selection[carddata] then
    graphics.setColor(100,180,140,255)
  else
    graphics.setColor(0,0,0,255)
  end
  graphics.rectangle('line', -32, -48, 64, 96)

  -- card text
  graphics.setColor(100,140,180,255)
  if not hidden and carddata.info then
    graphics.printf(carddata.info.name, -32+2, -48+2, 64-4, 'center')
  end
end
