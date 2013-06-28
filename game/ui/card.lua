
module ('ui.card', package.seeall)

require 'control.card'

local net = require 'net'

function keyAction (key, cardID)
  local action = (key == 't') and 'tapCard' or ((key == 'u') and 'untapCard')
  if not action then return end
  net.sendto 'server' {
    controller  = 'card',
    action      = action,
    cardID      = cardID
  }
end

function render (graphics, hidden, selection, carddata)
  if carddata.tapped then
    graphics.rotate(math.pi/2)
  end

  -- background
  graphics.setColor(90,70,50,255)
  graphics.rectangle('fill', -32, -48, 64, 96)

  -- border
  if selection[carddata.id] then
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
