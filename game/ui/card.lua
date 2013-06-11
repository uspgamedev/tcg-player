
module ('ui', package.seeall)

require 'lux.object'

Card = lux.object.new {}

function Card.keyAction (key, reference)
  if key == 't' then
    reference:tap()
  elseif key == 'u' then
    reference:untap()
  end
end

function Card.draw (graphics, hidden, selection, reference)
  if reference.tapped then
    graphics.rotate(math.pi/2)
  end
  graphics.setColor(90,70,50,255)
  graphics.rectangle('fill', -32, -48, 64, 96)
  if selection[reference] then
    graphics.setColor(100,180,140,255)
  else
    graphics.setColor(0,0,0,255)
  end
  graphics.rectangle('line', -32, -48, 64, 96)
  graphics.setColor(100,140,180,255)
  if not hidden and reference.info then
    graphics.printf(reference.info.name, -32+2, -48+2, 64-4, 'center')
  end
end
