
module ('ui.slot', package.seeall)

require 'ui.card'

function click (selection, info, topcard)
  if not topcard then return end
  if selection[topcard] then
    selection[topcard] = nil
  else
    selection[topcard] = info
  end
end

function render (graphics, selection, slotdata, focus)
  if focus then
    graphics.setColor(255,100,100,255)
    graphics.rectangle('line', -64, -64, 127, 127)
  end
  for i,card in slotdata:cards() do
    graphics.push()
    local d = math.min(#slotdata.stack-i-1, 2)
    graphics.translate(d*5, d*5)
    ui.card.render(graphics, slotdata.hidden, selection, card)
    graphics.pop()
  end
  if #slotdata.stack > 1 then
    graphics.printf(
      #slotdata.stack,
      -60, 64-2*graphics.getFont():getHeight(),
      120,
      'right'
    )
  end
end
