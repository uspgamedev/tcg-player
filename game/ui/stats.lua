
module ('ui.stats', package.seeall)

require 'ui.common'

function render (graphics, p1wreckage, p2wreckage)
  ui.common.infoBox(graphics, 512-96, 384-48, 96*2, 96, {
    {'center', "Player 1's Wreckage:"},
    {'center', p1wreckage.."/20"},
    {'center', "Player 2's Wreckage:"},
    {'center', p2wreckage.."/20"}
  })
end
