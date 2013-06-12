
module ('ui.stats', package.seeall)

require 'ui.common'

function showWreckage (graphics, p1wreckage, p2wreckage)
  ui.common.infoBox(graphics, 512-96, 384-48, 96*2, 96, {
    {'center', "Player 1's Wreckage:"},
    {'center', p1wreckage.."/20"},
    {'center', "Player 2's Wreckage:"},
    {'center', p2wreckage.."/20"}
  })
end

function showStack (graphics, slot)
  local w = 96
  local n = slot:getQuantity()
  local x0 = 512+n*(w)
  for i,card in slot:cards() do
    ui.common.infoBox(
      graphics,
      x0-2*w-(i-1)*2*(w+1)-1, 384-128,
      w*2, 256,
      card:getInfo()
    )
  end
end
