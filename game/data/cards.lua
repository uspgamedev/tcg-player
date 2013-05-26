
module ('data.cards', package.seeall)

require 'lux.common'
require 'ui.card'

local cardsinfo = {}

function load (cardfile)
  local cards = lux.common.datafile(cardfile, love.filesystem.load)
  for _,cardinfo in pairs(cards) do
    cardsinfo[cardinfo.name] = cardinfo
  end
end

function make (name)
  return ui.Card:new{ info = cardsinfo[name] }
end
